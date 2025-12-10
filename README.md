# 🌤️ Météo App# 🌤️ Météo App

Application météo moderne développée avec Flutter et Riverpod.Application météo moderne développée avec Flutter et Riverpod.

## ✨ Fonctionnalités## ✨ Fonctionnalités

- 🔍 Recherche de ville par nom- 🔍 **Recherche de ville** : Recherchez la météo de n'importe quelle ville dans le monde

- 🌡️ Température et conditions météo en temps réel- 🌡️ **Données en temps réel** : Température actuelle, conditions météorologiques

- 🌅 Détection automatique jour/nuit- 💨 **Informations détaillées** : Vitesse du vent, humidité, précipitations

- 💨 Vitesse du vent, humidité, précipitations- 🎨 **Interface moderne** : Design élégant avec dégradés et animations fluides

- 🎨 Interface responsive et élégante- 🌍 **Support multilingue** : Interface en français avec descriptions météo localisées

- 🌍 Descriptions en français- ⚡ **État réactif** : Gestion d'état avec Riverpod pour une expérience fluide

## 🚀 Installation## 📱 Captures d'écran

````bash_À venir : Ajoutez vos captures d'écran ici_

# Cloner le projet

git clone https://github.com/wilsonDenis/riverpod_app.git## 🛠️ Technologies utilisées

cd riverpod_app

- **Flutter** : Framework de développement cross-platform

# Installer les dépendances- **Riverpod** : Gestion d'état réactive et robuste

flutter pub get- **Open-Meteo API** : API météo gratuite et sans clé API

- **HTTP** : Requêtes réseau

# Lancer l'application- **Material Design 3** : Design moderne et cohérent

flutter run

```## 🚀 Installation



## 🛠️ Technologies### Prérequis



- **Flutter** - Framework UI cross-platform- Flutter SDK (version 3.0 ou supérieure)

- **Riverpod** - Gestion d'état- Dart SDK (version 3.0 ou supérieure)

- **Open-Meteo API** - Données météo gratuites- Un éditeur de code (VS Code, Android Studio, etc.)



## 📁 Structure### Étapes d'installation



```1. **Cloner le repository**

lib/

├── main.dart                 # Point d'entrée   ```bash

├── core/   git clone https://github.com/votre-username/riverpod_app.git

│   ├── constants/           # Constantes (couleurs, styles)   cd riverpod_app

│   └── theme/               # Thème de l'app   ```

├── models/

│   └── meteo.dart           # Modèle de données2. **Installer les dépendances**

├── controllers/

│   └── meteo_controller.dart # Logique métier   ```bash

├── providers/   flutter pub get

│   └── providers.dart       # Providers Riverpod   ```

├── widgets/                 # Widgets réutilisables

│   ├── search_bar.dart3. **Lancer l'application**

│   ├── weather_display.dart   ```bash

│   └── info_card.dart   flutter run

└── views/   ```

    └── home_page.dart       # Page principale

```## 📦 Dépendances



## 📝 Licence```yaml

dependencies:

MIT License - voir le fichier [LICENSE](LICENSE)  flutter:

    sdk: flutter

## 👨‍💻 Auteur  flutter_riverpod: ^3.x.x

  http: ^1.x.x

**Wilson Bahun**```



- GitHub: [@wilson-bahun](https://github.com/wilson-bahun)## 🏗️ Architecture



---L'application suit une architecture propre et modulaire :



⭐ N'hésitez pas à mettre une étoile si ce projet vous plaît !```

lib/
├── main.dart                 # Point d'entrée de l'application
├── model/
│   └── meteo.dart           # Modèle de données météo
├── controller/
│   └── meteo_controller.dart # Logique métier et appels API
├── providers/
│   └── provider.dart        # Providers Riverpod
└── views/
    └── home_page.dart       # Interface utilisateur principale
````

## 🌐 API utilisée

Cette application utilise [Open-Meteo API](https://open-meteo.com/), une API météo gratuite qui ne nécessite pas de clé API.

**Endpoints utilisés :**

- Géocodage : `https://geocoding-api.open-meteo.com/v1/search`
- Données météo : `https://api.open-meteo.com/v1/forecast`

## 🎯 Fonctionnalités à venir

- [ ] Prévisions sur 7 jours
- [ ] Localisation GPS automatique
- [ ] Favoris de villes
- [ ] Mode sombre/clair
- [ ] Graphiques de température
- [ ] Notifications météo
- [ ] Support multilingue (EN, ES, etc.)

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à :

1. Fork le projet
2. Créer une branche pour votre fonctionnalité (`git checkout -b feature/AmazingFeature`)
3. Commit vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrir une Pull Request

## 📝 Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## 👤 Auteur

**Votre Nom**

- GitHub: [@votre-username](https://github.com/wilsonDenis)
- LinkedIn: [Votre Profil](www.linkedin.com/in/denis-wilson-bahun-29a67228b)

## 🙏 Remerciements

- [Open-Meteo](https://open-meteo.com/) pour l'API météo gratuite
- [Riverpod](https://riverpod.dev/) pour la gestion d'état
- La communauté Flutter pour les ressources et le support

---

⭐ Si ce projet vous plaît, n'hésitez pas à lui donner une étoile sur GitHub !
