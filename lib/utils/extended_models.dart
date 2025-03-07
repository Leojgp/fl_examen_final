import 'package:fl_examen_final/models/diet.dart';
import 'package:fl_examen_final/models/ingredient.dart';
import 'package:fl_examen_final/models/meal.dart';

class IngredientWithKcal {
  final Ingredient ingredient;
  final int kcal;
  final int quantity;

  IngredientWithKcal({
    required this.ingredient,
    required this.kcal,
    required this.quantity,
  });
}

/// reprsenta un meal con sus ingredientes.
class MealWithIngredients {
  final Meal meal;
  final List<IngredientWithKcal> ingredients;
  final int totalKcal;

  MealWithIngredients({required this.meal, required this.ingredients})
      : totalKcal = ingredients.fold(0, (sum, item) => sum + item.kcal);
}

/// Modelo para representar una dieta completa con todas sus comidas e ingredientes
class CompleteDiet {
  final Diet diet;
  final List<MealWithIngredients> meals;
  final int totalKcal;

  CompleteDiet({required this.diet, required this.meals})
      : totalKcal = meals.fold(0, (suma, meal) => suma + meal.totalKcal);
}
