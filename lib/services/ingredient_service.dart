import 'package:fl_examen_final/models/ingredient.dart';
import 'package:fl_examen_final/utils/errors.dart';

Future<Ingredient> getIngredientById(String ingredientId) async {
  final ingredient = await ingredientRef.doc(ingredientId).get();
  if (!ingredient.exists || ingredient.data == null) {
    throw IngredientDataNotFoundException();
  }

  return ingredient.data!;
}

Future<Ingredient> createIngredient(Ingredient ingredient) async {
  final ingredientDoc = await ingredientRef.add(ingredient);
  final ingredientData = await ingredientDoc.get();
  if (!ingredientData.exists || ingredientData.data == null) {
    throw IngredientDataNotFoundException();
  }

  return ingredientData.data!;
}

Future<void> updateIngredient(Ingredient ingredient) async {
  await ingredientRef.doc(ingredient.id).update(
        name: ingredient.name,
        unit: ingredient.unit,
        caloriesPer100: ingredient.caloriesPer100,
        imageUrl: ingredient.imageUrl,
      );
}

Future<void> deleteIngredient(String ingredientId) async {
  await ingredientRef.doc(ingredientId).delete();
}

Future<List<Ingredient>> getIngredients() async {
  final ingredients = await ingredientRef.get();
  return ingredients.docs.map((e) => e.data).toList();
}
