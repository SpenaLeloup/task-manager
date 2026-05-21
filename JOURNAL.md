# Journal de bord — [Alexis COUTURIER] — To-Do List Flutter

> Lisez attentivement le fichier [CONSIGNES_JOURNAL.md](CONSIGNES_JOURNAL.md) avant de commencer.

---

## Séance 1 — 2026-05-05

### Travail effectué
- Installation et configuration de l'environnement de développement Flutter et vérification avec flutter doctor.

- Clonage du dépôt GitHub Classroom et initialisation du projet avec la commande flutter create.

- Exploration de la structure du projet :

    - lib/main.dart : Point d’entrée de l’application.

    - pubspec.yaml : Dépendances et métadonnées du projet.

    - android/ : Code natif Android généré par Flutter.

    - ios/ : Code natif iOS généré par Flutter.

    - test/ : Tests automatisés.

    - JOURNAL.md : Journal de bord à la racine du dépôt.

- Lancement de l'application sur émulateur Android et test réussi du Hot Reload en modifiant le texte du fichier main.dart.

- Premier commit et push du code sur la branche seance-01.

### Difficultés rencontrées
- Difficulté lors du premier git push car la branche distante n'était pas encore créée.

- Blocage dans l'éditeur de texte Vim lors de la validation du message de merge (--no-ff).

- Échec du script automatique journal.py qui ne détectait pas les commits après la fusion.

### Comment j'ai résolu le problème
- Utilisation de la commande git push --set-upstream origin seance-01 pour lier la branche locale au serveur.

- Apprentissage des commandes Vim (:wq) pour enregistrer et quitter l'éditeur lors du merge.

- Saisie manuelle des informations dans le fichier JOURNAL.md pour pallier le dysfonctionnement du script Python. Afin de gagner du temps pour cette séance, je regarderais pour faire fonctionner le script pour la suite.

### Prévu pour la prochaine séance
- Début du développement des fonctionnalités de la To-Do List et apprentissage des premiers widgets Flutter.

- Faire fonctionner le script python.

---

## Séance 2 — 2026-05-13

### Travail effectué

**Branche :** `seance-TD3`

**Commits :**
  - `ce486f5 repparation du journal`
  - `922050b creation de task_title.dart et trie dans home_screen.dart`
  - `0bf2342 amelioration du ListTitle`
  - `34b7fb4 modification du main.dart et reorganisation des fichiers`
  - `c30f5f5 creation du fichier home_screen.dart`
  - `c741e01 creation du fichier task.dart`
  - `f29ab02 debut de l'exercice 3`
  - `b105910 exercice02 termine`
  - `78ae0c6 initialisation de la partie 2 de l'exercice 6`
  - `5d7c0b5 realisation de la partie 01 de l'exercice 6`
  - `2bd8015 realisation de l'exercice 1`
  - `70d2b84 initialisation du projet dart_odyssey`
  - `649d69e journal: sÃ©ance 01`
  - `2fde604 init: crÃ©ation du projet Flutter To-Do List`

**Fichiers modifiés :** `dart_odyssey/.gitignore`, `dart_odyssey/CHANGELOG.md`, `dart_odyssey/README.md`, `dart_odyssey/analysis_options.yaml`, `dart_odyssey/bin/dart_odyssey.dart`, `dart_odyssey/pubspec.lock`, `dart_odyssey/pubspec.yaml`, `dart_odyssey/src/classes/journey.dart`, `dart_odyssey/src/classes/starship.dart`, `dart_odyssey/src/dart_odyssey.dart` *(+10 fichier(s))*

### Difficultés rencontrées
- La prise en main des widgets

### Comment j'ai résolu le problème
- En essayant plussieurs fois de manières différentes

### Prévu pour la prochaine séance
- De faire le TD4
---

## Séance 3 — 2026-05-18

### Travail effectué

**Branche :** `seance-TD3`

**Commits :**
  - `8883920 feat: liste dynamique avec ajout, suppression et complÃ©tion de tÃ¢ches`
  - `78c503e questions 3 et 4 qui fonctionnent`
  - `4311c3f correction pour faire fonctionner les questions 1 et 2`
  - `5893e5f modifications pour les questions 1 et 2`
  - `de13b8e journal: sÃ©ance du TD3`
  - `ce486f5 repparation du journal`
  - `922050b creation de task_title.dart et trie dans home_screen.dart`
  - `0bf2342 amelioration du ListTitle`
  - `34b7fb4 modification du main.dart et reorganisation des fichiers`
  - `c30f5f5 creation du fichier home_screen.dart`
  - `c741e01 creation du fichier task.dart`

**Fichiers modifiés :** `android/app/build.gradle.kts`, `android/gradle/wrapper/gradle-wrapper.properties`, `dart_odyssey/bin/dart_odyssey.dart`, `dart_odyssey/src/classes/journey.dart`, `dart_odyssey/src/classes/starship.dart`, `dart_odyssey/src/dart_odyssey.dart`, `dart_odyssey/src/exercice01.dart`, `dart_odyssey/src/exercice02.dart`, `dart_odyssey/src/exercice03.dart`, `dart_odyssey/src/exercice06.dart` *(+6 fichier(s))*

### Difficultés rencontrées
- Erreur de build avec les métadonnées AAR (CheckAarMetadataWorkAction) liées aux dépendances.
- Version de Gradle obsolète (8.9) pour charger les outils récents.
- Blocage des liens symboliques (symlinks) par la sécurité Windows.

### Comment j'ai résolu le problème
- Configuration et correction du fichier build.gradle.kts pour activer le desugaring.
- Passage manuel à Gradle 8.13 dans le fichier gradle-wrapper.properties.
- Activation du Mode Développeur dans les paramètres de Windows.
- Implémentation des callbacks (onToggle, onDelete) et de setState pour dynamiser l'UI.

### Prévu pour la prochaine séance
- Découverte de la persistance des données pour sauvegarder la To-Do List localement.
---

## Séance 4 — 2026-05-21

### Travail effectué

**Branche :** `seance-TD5`

**Commits :**
  - `5adfb66 realisation du TD 5 en retard car absence au cours precedent`
  - `ebd298a journal: sÃ©ance 3`
  - `8883920 feat: liste dynamique avec ajout, suppression et complÃ©tion de tÃ¢ches`
  - `78c503e questions 3 et 4 qui fonctionnent`
  - `4311c3f correction pour faire fonctionner les questions 1 et 2`
  - `5893e5f modifications pour les questions 1 et 2`

**Fichiers modifiés :** `android/app/build.gradle.kts`, `android/gradle/wrapper/gradle-wrapper.properties`, `journal.py`, `lib/main.dart`, `lib/screens/add_task_screen.dart`, `lib/screens/home_screen.dart`, `lib/screens/task_detail_screen.dart`, `lib/widgets/task_tile.dart`

### Difficultés rencontrées
- Gestion et résolution des conflits de fusion (merge conflict) sur le fichier `build.gradle.kts` entre `main` et la branche de séance.
- Gestion et résolution des conflits de fusion (merge conflict) sur le fichier `build.gradle.kts` entre `main` et la branche de séance.
- Compréhension de la récupération asynchrone des données lors de la fermeture d'un écran

### Comment j'ai résolu le problème
- Résolution du conflit directement dans VS Code en conservant la configuration fonctionnelle de Gradle
- Utilisation de `Navigator.pushNamed` pour basculer proprement d'un écran à l'autre via les routes nommées.
- - Implémentation d'une `GlobalKey<FormState>` pour valider le champ texte et bloquer les saisies vides.

### Prévu pour la prochaine séance
- Découverte et mise en place de la persistance des données locale pour sauvegarder la liste de tâches au redémarrage.
---

## Séance 5 — AAAA-MM-JJ

### Travail effectué
- 

### Difficultés rencontrées
- 

### Comment j'ai résolu le problème
- 

### Prévu pour la prochaine séance
- 

---

## Séance 6 — AAAA-MM-JJ

### Travail effectué
- 

### Difficultés rencontrées
- 

### Comment j'ai résolu le problème
- 

### Prévu pour la prochaine séance
- 

---

## Bilan final

### Ce que j'ai appris durant ce projet
- 

### Ce que je ferais différemment si je recommençais
- 

### Fonctionnalités que je n'ai pas eu le temps d'implémenter
- 
