import 'package:flutter/foundation.dart';

class FavoriteMealsState extends ChangeNotifier {
  final Map<String, bool> _favoriteMeals = {};

  bool isFavorite(String mealName) => _favoriteMeals[mealName] ?? false;

  void toggleFavorite(String mealName) {
    _favoriteMeals[mealName] = !(_favoriteMeals[mealName] ?? false);
    notifyListeners();
  }
}