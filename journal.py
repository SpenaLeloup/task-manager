#!/usr/bin/env python3
"""
journal.py — Mise à jour automatique du journal de bord Flutter
Usage   : python journal.py
Prérequis: Python 3.8+, dépôt Git initialisé

Workflow attendu (une branche par séance) :
  1. git checkout -b seance-XX          # début de séance
  2. <travail + commits sur la branche>
  3. git checkout main                  # fin de séance
  4. git merge --no-ff seance-XX        # merge dans main
  5. python journal.py                  # mise à jour du journal
  6. git add JOURNAL.md && git commit -m "journal: séance XX"
  7. git push
"""

import subprocess
import re
import sys
from datetime import date
from pathlib import Path

JOURNAL_FILE  = Path("JOURNAL.md")
MAIN_BRANCHES = {"main", "master"}          # noms de branche principale acceptés


# ---------------------------------------------------------------------------
# Utilitaires Git
# ---------------------------------------------------------------------------

def run(cmd):
    result = subprocess.run(cmd, capture_output=True, text=True, shell=True)
    return result.stdout.strip()


def current_branch():
    return run("git rev-parse --abbrev-ref HEAD")


def check_prerequisites(branch):
    """Vérifie les conditions minimales avant de continuer."""
    if not JOURNAL_FILE.exists():
        _abort(
            "JOURNAL.md introuvable.",
            "Assurez-vous d'exécuter ce script à la racine du projet."
        )

    if not Path(".git").exists():
        _abort("Ce répertoire n'est pas un dépôt Git.")

    if not run("git rev-parse HEAD"):
        _abort(
            "Aucun commit trouvé.",
            "Faites au moins un commit avant de remplir le journal."
        )

    if branch not in MAIN_BRANCHES:
        _abort(
            f"Vous êtes sur la branche '{branch}', pas sur 'main'.",
            "",
            "Le journal doit être rempli depuis la branche principale,",
            "après avoir mergé votre branche de séance.",
            "",
            "Procédure :",
            "  git checkout main",
            f"  git merge --no-ff {branch}",
            "  python journal.py"
        )


def _abort(*messages):
    print()
    print("✖  Erreur :", messages[0])
    for m in messages[1:]:
        print("   ", m)
    print()
    sys.exit(1)


def get_last_journal_date(content):
    """Retourne la date ISO de la dernière séance renseignée, ou None."""
    dates = re.findall(r"## Séance \d+ — (\d{4}-\d{2}-\d{2})", content)
    return dates[-1] if dates else None


def get_merged_branch_name():
    """
    Retourne le nom de la dernière branche mergée dans main (hors main elle-même).
    Utile pour afficher un rappel à l'étudiant.
    """
    log = run('git log --merges --oneline -1')
    if not log:
        return None
    # Extrait le nom de branche depuis le message de merge
    match = re.search(r"Merge branch '([^']+)'", run('git log --merges --format="%s" -1'))
    return match.group(1) if match else None


def get_commits_since(since_date):
    """
    Commits non-merge depuis since_date sur la branche courante (main).
    Ces commits proviennent de la branche de séance mergée.
    """
    if since_date:
        cmd = f'git log --oneline --no-merges --since="{since_date} 00:00:00"'
    else:
        cmd = "git log --oneline --no-merges -20"
    output = run(cmd)
    return output.splitlines() if output else []


def get_files_since(since_date):
    """
    Fichiers modifiés depuis since_date, hors JOURNAL.md.
    Après un merge --no-ff, git log --no-merges depuis la date capture
    exactement les commits de la branche de séance.
    """
    if since_date:
        oldest = run(
            f'git log --format="%H" --no-merges --since="{since_date} 00:00:00"'
        ).splitlines()
        if not oldest:
            return []
        ref    = oldest[-1]
        parent = run(f"git rev-parse {ref}^ 2>/dev/null")
        base   = parent if parent else ref
        raw    = run(f"git diff --name-only {base} HEAD")
    else:
        raw = run('git show --name-only --format="" HEAD')

    return [f for f in raw.splitlines() if f and f != "JOURNAL.md"]


# ---------------------------------------------------------------------------
# Parsing du journal
# ---------------------------------------------------------------------------

def find_next_empty_section(content):
    """
    Retourne (num_séance, pos_début, pos_fin) du prochain bloc non rempli.
    Un bloc vide a 'AAAA-MM-JJ' comme date.
    """
    header_re = re.compile(r"## Séance (\d+) — AAAA-MM-JJ")
    match = header_re.search(content)
    if not match:
        return None, None, None

    section_num = match.group(1)
    start       = match.start()

    sep   = content.find("\n---\n", start)
    bilan = content.find("\n## Bilan", start)

    if sep != -1:
        end = sep
    elif bilan != -1:
        end = bilan
    else:
        end = len(content)

    return section_num, start, end


# ---------------------------------------------------------------------------
# Interaction terminal
# ---------------------------------------------------------------------------

def ask(question):
    """
    Affiche une question et collecte les réponses ligne par ligne.
    Une ligne vide termine la saisie.
    """
    print(f"\n{question}")
    print("(Une ligne vide pour terminer)")
    lines = []
    while True:
        try:
            line = input("  > ").strip()
        except (EOFError, KeyboardInterrupt):
            print()
            break
        if line == "":
            if lines:
                break
            print("  (Répondez au moins en une phrase, puis validez avec Entrée)")
        else:
            lines.append(line)
    return lines if lines else ["*(non renseigné)*"]


def fmt_bullets(lines):
    return "\n".join(f"- {l}" for l in lines)


# ---------------------------------------------------------------------------
# Construction du nouveau bloc
# ---------------------------------------------------------------------------

def build_section(num, today, branch, commits, files, difficulties, resolution, next_plan):
    commits_md = (
        "\n".join(f"  - `{c}`" for c in commits)
        if commits else "  - *(aucun commit détecté)*"
    )

    files_md = (
        ", ".join(f"`{f}`" for f in files[:10])
        + (f" *(+{len(files) - 10} fichier(s))*" if len(files) > 10 else "")
        if files else "*(aucun fichier modifié détecté)*"
    )

    branch_line = f"**Branche :** `{branch}`\n\n" if branch else ""

    return (
        f"## Séance {num} — {today}\n\n"
        f"### Travail effectué\n\n"
        f"{branch_line}"
        f"**Commits :**\n{commits_md}\n\n"
        f"**Fichiers modifiés :** {files_md}\n\n"
        f"### Difficultés rencontrées\n{fmt_bullets(difficulties)}\n\n"
        f"### Comment j'ai résolu le problème\n{fmt_bullets(resolution)}\n\n"
        f"### Prévu pour la prochaine séance\n{fmt_bullets(next_plan)}"
    )


# ---------------------------------------------------------------------------
# Point d'entrée
# ---------------------------------------------------------------------------

def main():
    branch = current_branch()
    check_prerequisites(branch)

    content = JOURNAL_FILE.read_text(encoding="utf-8")
    section_num, start, end = find_next_empty_section(content)

    if section_num is None:
        print("Toutes les séances du journal sont déjà renseignées.")
        print("Ajoutez une nouvelle section dans JOURNAL.md si nécessaire.")
        sys.exit(0)

    today     = date.today().isoformat()
    last_date = get_last_journal_date(content)
    merged    = get_merged_branch_name()

    # En-tête
    print()
    print("=" * 54)
    print(f"  Journal de bord — Séance {section_num} — {today}")
    print("=" * 54)

    if merged:
        print(f"\nBranche mergée détectée : {merged}")

    # Données Git
    commits = get_commits_since(last_date)
    files   = get_files_since(last_date)

    if commits:
        print(f"\nCommits détectés{' depuis le ' + last_date if last_date else ''} :")
        for c in commits:
            print(f"  • {c}")
    else:
        print()
        print("  Aucun commit détecté depuis la dernière séance.")
        print("  Avez-vous bien mergé votre branche de séance dans main ?")
        print(f"    git merge --no-ff seance-{section_num.zfill(2)}")

    if files:
        preview = files[:6]
        print(f"\nFichiers modifiés : {', '.join(preview)}", end="")
        print(f"  (+{len(files)-6} autre(s))" if len(files) > 6 else "")

    # Questions interactives
    print()
    difficulties = ask("1. Quelles difficultés as-tu rencontrées ?")
    resolution   = ask("2. Comment as-tu résolu ces difficultés ?")
    next_plan    = ask("3. Que prévois-tu pour la prochaine séance ?")

    # Mise à jour du fichier
    new_block   = build_section(
        section_num, today, merged, commits, files,
        difficulties, resolution, next_plan
    )
    new_content = content[:start] + new_block + content[end:]
    JOURNAL_FILE.write_text(new_content, encoding="utf-8")

    # Résumé final
    print()
    print("=" * 54)
    print(f"  Journal mis à jour — Séance {section_num} enregistrée.")
    print("=" * 54)
    print("\nÉtapes suivantes :")
    print(f'  git add JOURNAL.md')
    print(f'  git commit -m "journal: séance {section_num}"')
    print(f'  git push')
    print()


if __name__ == "__main__":
    main()
