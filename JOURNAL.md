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

## Séance 5 — 2026-05-21

### Travail effectué

**Branche :** `seance-TD6`

**Commits :**
  - `037856e modification du fichier home_screen.dart`
  - `6c0b44d modification du fichier task_tile.dart`
  - `7cb8aca modification du fichier task_detail_screen.dart`
  - `c847658 modification du fichier add_task_screen`
  - `17a70f9 modification du fichier task.dart`
  - `f83d9e6 journal: sÃ©ance 4`
  - `5adfb66 realisation du TD 5 en retard car absence au cours precedent`

**Fichiers modifiés :** `lib/models/task.dart`, `lib/screens/add_task_screen.dart`, `lib/screens/home_screen.dart`, `lib/screens/task_detail_screen.dart`, `lib/widgets/task_tile.dart`

### Difficultés rencontrées
- Complexification du modèle Task avec l'ajout de nouveaux champs comme la description et l'énumération de priorité.
- Nécessité de réutiliser et d'adapter le même écran (AddTaskScreen) pour gérer deux comportements distincts : l'ajout et l'édition.

### Comment j'ai résolu le problème
- Utilisation d'un enum pour le champ de priorité afin de sécuriser le typage et restreindre les valeurs.
- Utilisation de la méthode initState() dans AddTaskScreen pour détecter la présence d'une tâche à modifier et pré-remplir automatiquement les champs texte.
- Intégration de l'opérateur de déversement conditionnel (...[]) dans l'écran de détail pour n'afficher la description que si elle est saisie.

### Prévu pour la prochaine séance
- Enfin passer à l'étape de l'implémentation de la persistance des données locale pour sauvegarder la liste de tâches même après la fermeture de l'application.
---

## Séance 6 — 2026-05-26

### Travail effectué

**Branche :** `seance-TD7`

**Commits :**
  - `feff622 plusieurs fichiers en lien avec les images`
  - `087fbc6 ajout de l'image de l'icone de l'application et modification du fichier pubspec.yaml`
  - `9e5e9cb ajout de l'image de l'icone de l'application et modification du fichier pubspec.yaml`
  - `7b98d54 modification du fichier home_srceen.dart`
  - `96e690e modification du fichier add_task_screen.dart`
  - `333f1f5 modification du fichier task_tile.dart`
  - `f643dca creation du fichier empy_state.dart pour les etats vide`
  - `8b0f98a modification du main.dart`
  - `32e6942 journal: sÃ©ance 5`
  - `037856e modification du fichier home_screen.dart`
  - `6c0b44d modification du fichier task_tile.dart`
  - `7cb8aca modification du fichier task_detail_screen.dart`
  - `c847658 modification du fichier add_task_screen`
  - `17a70f9 modification du fichier task.dart`
  - `f83d9e6 journal: sÃ©ance 4`
  - `5adfb66 realisation du TD 5 en retard car absence au cours precedent`

**Fichiers modifiés :** `android/app/src/main/res/mipmap-hdpi/ic_launcher.png`, `android/app/src/main/res/mipmap-mdpi/ic_launcher.png`, `android/app/src/main/res/mipmap-xhdpi/ic_launcher.png`, `android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png`, `android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png`, `assets/icon/icon.png`, `ios/Runner.xcodeproj/project.pbxproj`, `ios/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json`, `ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-1024x1024@1x.png`, `ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@1x.png` *(+28 fichier(s))*

### Difficultés rencontrées
- Centralisation et harmonisation de la charte graphique avec ThemeData.
- Gestion de l'affichage conditionnel pour l'état vide afin de soigner l'expérience utilisateur.
- Configuration et génération des icônes natives avec le package flutter_launcher_icons.

### Comment j'ai résolu le problème
- Utilisation de ColorScheme.fromSeed dans main.dart pour générer une palette Material 3 cohérente.
- Création d'un widget EmptyState et utilisation d'un opérateur ternaire dans HomeScreen.
- Ajout d'un conteneur coloré dynamique dans TaskTile basé sur l'énumération de priorité.
- Configuration du fichier pubspec.yaml et exécution de la commande dart run flutter_launcher_icons.

### Prévu pour la prochaine séance
- J'aimerais enfin pouvoir faire l'implémentation de la persistance des données locale pour conserver les tâches après la fermeture de l'application.
---

## Séance 7 — 2026-05-27

### Travail effectué

**Branche :** `seance-TD8`

**Commits :**
  - `0b010a7 ajout de nouvelles seance dans le journal`
  - `e2367f5 modification de _submit() dans add_task_screen.dart`
  - `ef39b3b migration de haome_screnn.dart`
  - `b703aa8 enregistrement du provider dans le main`
  - `008c619 creation de task_provider.dart`
  - `b546ff2 modification de pubspec.yaml`
  - `77df6cd modification de la couleur qui Ã©tait deja en place`
  - `6087562 journal: sÃ©ance 6`
  - `feff622 plusieurs fichiers en lien avec les images`
  - `087fbc6 ajout de l'image de l'icone de l'application et modification du fichier pubspec.yaml`
  - `9e5e9cb ajout de l'image de l'icone de l'application et modification du fichier pubspec.yaml`
  - `7b98d54 modification du fichier home_srceen.dart`
  - `96e690e modification du fichier add_task_screen.dart`
  - `333f1f5 modification du fichier task_tile.dart`
  - `f643dca creation du fichier empy_state.dart pour les etats vide`
  - `8b0f98a modification du main.dart`

**Fichiers modifiés :** `android/app/src/main/res/mipmap-hdpi/ic_launcher.png`, `android/app/src/main/res/mipmap-mdpi/ic_launcher.png`, `android/app/src/main/res/mipmap-xhdpi/ic_launcher.png`, `android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png`, `android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png`, `assets/icon/S08.pdf`, `assets/icon/icon.png`, `ios/Runner.xcodeproj/project.pbxproj`, `ios/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json`, `ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-1024x1024@1x.png` *(+28 fichier(s))*

### Difficultés rencontrées
- Compréhension des limitations de l'état local avec setState pour la scalabilité et le partage de données entre plusieurs écrans.
- Erreur de type (_TypeError) lors du Hot Reload liée à la transformation brutale de HomeScreen de StatefulWidget en StatelessWidget.
- Extraction et migration globale de toute la logique métier de la liste de tâches hors des widgets.

### Comment j'ai résolu le problème
- Installation du package provider et création de la classe TaskProvider héritant de ChangeNotifier.
- Utilisation de notifyListeners() pour déclencher la reconstruction automatique de l'interface graphique.
- Résolution du crash de reassemble en effectuant un redémarrage complet (Hot Restart / touche R) de l'application.
- Utilisation des méthodes context.watch() pour lire l'état et context.read() pour exécuter les actions sans rebuild inutile.

### Prévu pour la prochaine séance
- - Découverte et implémentation de la persistance des données locale pour sauvegarder les tâches.
---

## Séance 8 — 2026-05-29

### Travail effectué

**Branche :** `seance-TD9`

**Commits :**
  - `5713e54 fin du td9`
  - `cff48c7 mise a jour du fichier home_screen`
  - `11d6eed ajout de enum dans task_provider.task`
  - `6030b6c journal: sÃ©ance 7`
  - `0b010a7 ajout de nouvelles seance dans le journal`
  - `e2367f5 modification de _submit() dans add_task_screen.dart`
  - `ef39b3b migration de haome_screnn.dart`
  - `b703aa8 enregistrement du provider dans le main`
  - `008c619 creation de task_provider.dart`
  - `b546ff2 modification de pubspec.yaml`

**Fichiers modifiés :** `lib/main.dart`, `lib/providers/task_provider.dart`, `lib/screens/add_task_screen.dart`, `lib/screens/home_screen.dart`

### Difficultés rencontrées
- Gestion du rafraîchissement asynchrone des onglets du TabBarView partageant la même source de données.
- Synchronisation de l'état du filtre global de TaskProvider avec l'index actif du TabController.
- Calcul en temps réel du taux de complétion et des compteurs indépendants pour les badges.

### Comment j'ai résolu le problème
- Réimplémentation de HomeScreen en StatefulWidget avec le mixin SingleTickerProviderStateMixin pour contrôler finement le TabController.
- Filtrage des listes de tâches directement au moment de leur passage en paramètre aux enfants de TabBarView (.where().toList()).
- Implémentation de getters calculés (totalCount, pendingCount, completedCount, completionRate) dans TaskProvider.

### Prévu pour la prochaine séance
- Implémentation de la persistance locale des données pour sauvegarder la liste de tâches à la fermeture.
---

## Séance 9 — 2026-06-05

### Travail effectué

**Branche :** `seance-TD10`

**Commits :**
  - `d73bd35 ajout d'ne sÃ©ance dans le journal`
  - `b93fbb0 mise a jour de task-tile.dart et home_screen.dart`
  - `d86ac8c mise a jour de task_provider.dart`
  - `269b61e journal: sÃ©ance 8`
  - `5713e54 fin du td9`

**Fichiers modifiés :** `lib/providers/task_provider.dart`, `lib/screens/home_screen.dart`, `lib/widgets/task_tile.dart`

### Difficultés rencontrées
- Implémentation d'un algorithme de tri multi-critères dynamique (date, priorité, alphabet, statut) gérant l'inversion ascendant/descendant.
- Erreur de syntaxe et perte des repères de l'analyseur Dart suite à l'oubli des crochets de liste dans la propriété children d'une Column.
- Compréhension de la mutation des listes in-place avec la méthode .sort() en Dart.

### Comment j'ai résolu le problème
- Utilisation de l'opérateur spread [...list] pour copier superficiellement le tableau avant d'appliquer le tri sans altérer la source.
- Correction syntaxique de la fonction _showPriorityMenu en encapsulant proprement le .map().toList() dans les crochets du children.
- Intégration d'un PopupMenuButton dans l'AppBar et d'un showModalBottomSheet déclenché par un GestureDetector (onLongPress).

### Prévu pour la prochaine séance
- Découverte et implémentation de la persistance locale des données pour enfin sauvegarder les tâches après la fermeture de l'application.
---


## Séance 10 — 2026-06-05

### Travail effectué

**Branche :** `seance-TD11`

**Commits :**
  - `e568860 ajout de sÃ©ances dans le joural`
  - `e3ce7a5 passage de ListView en style declaratif car demandÃ© par le prof`
  - `19f6b0f ajout de la persistance des donnÃ©es`
  - `6bae7fa crÃ©ation de storage_service.dart`
  - `eb4a162 modification de task.dart`
  - `d61565b journal: sÃ©ance 9`
  - `d73bd35 ajout d'ne sÃ©ance dans le journal`

**Fichiers modifiés :** `lib/models/task.dart`, `lib/providers/task_provider.dart`, `lib/screens/home_screen.dart`, `lib/services/storage_service.dart`

### Difficultés rencontrées
- Compréhension de la persistance de données locales et de la sérialisation/désérialisation JSON.
- Conflits de positionnement des énumérations globales provoquant des erreurs de portée ("Type not found") à la compilation.
- Adaptation de l'architecture pour respecter les exigences académiques spécifiques : passage d'un affichage impératif (ListView.builder) à un style déclaratif (.map()), et transition vers une mutation d'état contrôlée conservant les références mémoires des objets.

### Comment j'ai résolu le problème
- Isolation de la persistance dans un StorageService utilisant shared_preferences.
- Centralisation définitive de l'ensemble des enums (Priority, TaskFilter, SortCriteria) directement dans le modèle task.dart pour assurer leur visibilité globale.
- Refactoring de la méthode _buildTaskList dans le HomeScreen avec un SingleChildScrollView et une Column alimentée par un mapping déclaratif (tasks.map).
- Modification de la méthode updateTask du TaskProvider pour modifier les champs internes de l'objet existant au lieu de remplacer l'instance complète en mémoire.

### Prévu pour la prochaine séance
- Poursuite du développement de l'application selon les directives du prochain TD
---


## Séance 11 — 2026-06-08

### Travail effectué

**Branche :** `seance-TD12`

**Commits :**
  - `bcb060d modification du main.dart`
  - `02a5fa0 modification de database_helper.dart`
  - `da21b93 creation de database_helper.dart`
  - `beedb7f modification de task.dart`
  - `5218ece journal; sÃ©ance 10`
  - `e568860 ajout de sÃ©ances dans le joural`
  - `e3ce7a5 passage de ListView en style declaratif car demandÃ© par le prof`
  - `19f6b0f ajout de la persistance des donnÃ©es`
  - `6bae7fa crÃ©ation de storage_service.dart`
  - `eb4a162 modification de task.dart`
  - `d61565b journal: sÃ©ance 9`
  - `d73bd35 ajout d'ne sÃ©ance dans le journal`

**Fichiers modifiés :** `lib/main.dart`, `lib/models/task.dart`, `lib/providers/task_provider.dart`, `lib/screens/home_screen.dart`, `lib/services/database_helper.dart`, `lib/services/storage_service.dart`

### Difficultés rencontrées
- Gestion des types de données spécifiques à SQLite, notamment l'absence de type BOOLEAN natif obligeant à sérialiser les états à l'aide d'un entier (0 ou 1).
- Compréhension de l'asynchronisme lors de l'ouverture et de l'initialisation concurrente de la base de données.

### Comment j'ai résolu le problème
- Implémentation du pattern Singleton dans le DatabaseHelper pour centraliser l'accès et éviter les conflits d'ouverture de connexions.
- Enrichissement du modèle Task avec les méthodes toMap() et fromMap() pour encapsuler la conversion réciproque des booléens en entiers.
- Initialisation forcée du Helper au démarrage de l'application via WidgetsFlutterBinding.ensureInitialized().

### Prévu pour la prochaine séance
- Migration définitive de la logique d'accès aux données du TaskProvider depuis SharedPreferences vers notre nouveau service SQLite.
---

## Bilan final

### Ce que j'ai appris durant ce projet
- 

### Ce que je ferais différemment si je recommençais
- 

### Fonctionnalités que je n'ai pas eu le temps d'implémenter
- 
