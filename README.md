# 🎬 Ghibli Films Details App (Flutter)

Ce projet Flutter permet d’afficher les films du studio Ghibli, avec une page de détails complète pour chaque film.  
Il a été réalisé dans le cadre d’un TP encadré.

---

## 📱 Fonctionnalités

✅ Récupération des films via l'API publique Studio Ghibli  
✅ Affichage sous forme de liste avec bannière et titre  
✅ Navigation dynamique grâce à `go_router`  
✅ Affichage détaillé d’un film (titre, réalisateur, producteur, durée, description…)  
✅ Affichage de la note du film sous forme d’étoiles grâce au package `flutter_rating_bar`  
✅ UI simple et responsive avec une structure en deux colonnes

---

## 🔧 Technologies utilisées

- **Flutter** 3.x
- **Dart**
- `go_router`
- `flutter_rating_bar`
- Architecture widgetisée (séparation des responsabilités)

---

## 🖼️ Exemple visuel

| Liste des films | Détail d’un film |
|-----------------|------------------|
| ![Liste](assets/images/liste.png) | ![Détail](assets/images/detail.png) |

*(Ajoute des captures d’écran si tu veux)*

---

## 📁 Structure du projet

```bash
lib/
├── models/               # Classe Movie
├── services/             # Appels API + routing
├── screens/              # HomeScreen + MovieDetailScreen
├── widgets/              # MovieListWidget etc.
└── main.dart             # Entrée de l'application
