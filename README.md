# Projet To-Do List — Flutter

Bienvenue dans votre projet Flutter !  
Ce dépôt est votre espace de travail personnel pour le développement d'une application mobile **To-Do List** sur 15 séances.

---

## Démarrage rapide

### 1. Vérifiez votre environnement

```bash
flutter doctor
python --version   # doit afficher 3.8 ou supérieur
```

### 2. Installez les dépendances Flutter

```bash
flutter pub get
```

### 3. Lancez l'application

```bash
flutter run
```

---

## Structure du dépôt

```
/
├── lib/                    ← votre code Flutter (à compléter séance par séance)
│   └── main.dart
├── seances/                ← énoncés détaillés de chaque séance
│   ├── S01.md … S15.md
├── assets/                 ← ressources (images, icônes…)
│   └── icon/               ← déposez ici votre icône (séance 6)
├── JOURNAL.md              ← votre journal de bord (à remplir à chaque séance)
├── CONSIGNES_JOURNAL.md    ← lisez-le avant de commencer
├── journal.py              ← script de mise à jour du journal
└── pubspec.yaml            ← dépendances du projet
```

---

## Journal de bord

À la fin de **chaque séance**, exécutez :

```bash
python journal.py
```

Le script récupère automatiquement vos commits Git et vous pose 3 questions.  
Committez ensuite le journal :

```bash
git add JOURNAL.md
git commit -m "journal: séance X"
git push
```

> Le journal fait partie de votre évaluation. Consultez `CONSIGNES_JOURNAL.md` pour les détails.

---

## Énoncés des séances

Chaque fichier `seances/SXX.md` décrit le travail à réaliser, les concepts abordés et le livrable attendu.  
Lisez l'énoncé **avant** de commencer à coder.

---

## Règles importantes

- **Commits réguliers** : committez à chaque avancée significative, pas seulement en fin de séance.
- **Messages de commit** clairs : `feat: ajout du Dismissible`, `fix: correction du setState`, etc.
- **Pas d'IA générative** : ChatGPT, GitHub Copilot et outils similaires sont interdits. Le code doit être le vôtre.
- **Soutenance orale** : vous devrez expliquer n'importe quelle ligne de votre code en séance 16.
