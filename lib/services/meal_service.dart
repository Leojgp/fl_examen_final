import 'package:fl_examen_final/models/meal.dart';
import 'package:fl_examen_final/services/diet_service.dart';
import 'package:fl_examen_final/services/ingredient_service.dart';
import 'package:fl_examen_final/utils/errors.dart';
import 'package:fl_examen_final/utils/extended_models.dart';

Future<Meal> getMealById(String mealId) async {
  final meal = await mealRef.doc(mealId).get();
  if (!meal.exists || meal.data == null) {
    throw MealDataNotFoundException();
  }

  return meal.data!;
}

Future<Meal> createMeal(Meal meal) async {
  final mealDoc = await mealRef.add(meal);
  final mealData = await mealDoc.get();
  if (!mealData.exists || mealData.data == null) {
    throw MealDataNotFoundException();
  }

  return mealData.data!;
}

Future<void> updateMeal(Meal meal) async {
  await mealRef.doc(meal.id).update(
        name: meal.name,
        image: meal.image,
        ingredientsIdsWithQuantity: meal.ingredientsIdsWithQuantity,
        createdAt: meal.createdAt,
      );
}

Future<void> deleteMeal(String mealId) async {
  await mealRef.doc(mealId).delete();
}

Future<List<Meal>> getMeals() async {
  final meals = await mealRef.get();
  return meals.docs.map((e) => e.data).toList();
}

Future<MealWithIngredients> getMealWithIngredients(String mealId) async {
  final meal = await getMealById(mealId);

  final List<IngredientWithKcal> ingredients = [];

  for (var ingredientEntry in meal.ingredientsIdsWithQuantity) {
    final entry = ingredientEntry.entries.first;
    final quantity = entry.key;
    final ingredientId = entry.value;

    final ingredient = await getIngredientById(ingredientId);

    final kcal = calculateCalories(ingredient, quantity);

    ingredients.add(
      IngredientWithKcal(
        ingredient: ingredient,
        quantity: quantity,
        kcal: kcal,
      ),
    );
  }

  return MealWithIngredients(
    meal: meal,
    ingredients: ingredients,
  );
}
