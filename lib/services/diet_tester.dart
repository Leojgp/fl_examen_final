import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_examen_final/models/diet.dart';
import 'package:fl_examen_final/models/ingredient.dart';
import 'package:fl_examen_final/models/meal.dart';
import 'package:fl_examen_final/utils/extended_models.dart';

class DietTestUtility {
  /// Creates a complete test diet with sample meals and ingredients
  static CompleteDiet createTestCompleteDiet() {
    // Create test ingredients
    final testIngredients = _createTestIngredients();

    // Create test meals with ingredients
    final testMealsWithIngredients =
        _createTestMealsWithIngredients(testIngredients);

    // Create test diet
    final testDiet = Diet(
      id: "test-diet-id-123",
      type: "Test Diet",
      mealsIDs: testMealsWithIngredients.map((meal) => meal.meal.id).toList(),
    );

    // Create and return CompleteDiet
    return CompleteDiet(
      diet: testDiet,
      meals: testMealsWithIngredients,
    );
  }

  /// Creates a list of test ingredients
  static List<Ingredient> _createTestIngredients() {
    return [
      Ingredient(
        id: "ingredient-id-1",
        name: "Chicken Breast",
        unit: "g",
        caloriesPer100: 165.0,
        imageUrl: "https://example.com/chicken.jpg",
      ),
      Ingredient(
        id: "ingredient-id-2",
        name: "Brown Rice",
        unit: "g",
        caloriesPer100: 112.0,
        imageUrl: "https://example.com/rice.jpg",
      ),
      Ingredient(
        id: "ingredient-id-3",
        name: "Broccoli",
        unit: "g",
        caloriesPer100: 34.0,
        imageUrl: "https://example.com/broccoli.jpg",
      ),
      Ingredient(
        id: "ingredient-id-4",
        name: "Olive Oil",
        unit: "ml",
        caloriesPer100: 884.0,
        imageUrl: "https://example.com/oliveoil.jpg",
      ),
      Ingredient(
        id: "ingredient-id-5",
        name: "Salmon",
        unit: "g",
        caloriesPer100: 208.0,
        imageUrl: "https://example.com/salmon.jpg",
      ),
    ];
  }

  /// Creates test meals with the provided ingredients
  static List<MealWithIngredients> _createTestMealsWithIngredients(
      List<Ingredient> ingredients) {
    // Create test meal 1: Chicken and rice
    final meal1 = Meal(
      id: "meal-id-1",
      name: "Chicken and Rice",
      image: Uri.parse("https://example.com/chicken_rice.jpg"),
      createdAt: Timestamp.now(),
      ingredientsIdsWithQuantity: [
        {100: "ingredient-id-1"}, // Chicken Breast, 100g
        {200: "ingredient-id-2"}, // Brown Rice, 200g
        {100: "ingredient-id-3"}, // Broccoli, 100g
        {15: "ingredient-id-4"}, // Olive Oil, 15ml
      ],
    );

    // Create test meal 2: Salmon with vegetables
    final meal2 = Meal(
      id: "meal-id-2",
      name: "Salmon with Vegetables",
      image: Uri.parse("https://example.com/salmon_veg.jpg"),
      createdAt: Timestamp.now(),
      ingredientsIdsWithQuantity: [
        {100: "ingredient-id-5"}, // Salmon, 100g
        {200: "ingredient-id-3"}, // Broccoli, 200g
        {15: "ingredient-id-4"}, // Olive Oil, 15ml
      ],
    );

    // Calculate calories based on quantities
    final int chickenKcal = calculateCalories(ingredients[0], 100);
    final int riceKcal = calculateCalories(ingredients[1], 200);
    final int broccoliKcal = calculateCalories(ingredients[2], 100);
    final int oilKcal = calculateCalories(ingredients[3], 15);
    final int salmonKcal = calculateCalories(ingredients[4], 100);
    final int doubleBroccoliKcal = calculateCalories(ingredients[2], 200);

    // Create IngredientWithKcal objects for meal 1
    final ingredientsWithKcal1 = [
      IngredientWithKcal(
        ingredient: ingredients[0],
        kcal: chickenKcal,
        quantity: 100,
      ),
      IngredientWithKcal(
        ingredient: ingredients[1],
        kcal: riceKcal,
        quantity: 200,
      ),
      IngredientWithKcal(
        ingredient: ingredients[2],
        kcal: broccoliKcal,
        quantity: 100,
      ),
      IngredientWithKcal(
        ingredient: ingredients[3],
        kcal: oilKcal,
        quantity: 15,
      ),
    ];

    // Create IngredientWithKcal objects for meal 2
    final ingredientsWithKcal2 = [
      IngredientWithKcal(
        ingredient: ingredients[4],
        kcal: salmonKcal,
        quantity: 100,
      ),
      IngredientWithKcal(
        ingredient: ingredients[2], // Reusing broccoli
        kcal: doubleBroccoliKcal,
        quantity: 200,
      ),
      IngredientWithKcal(
        ingredient: ingredients[3], // Reusing olive oil
        kcal: oilKcal,
        quantity: 15,
      ),
    ];

    // Create MealWithIngredients objects
    final mealWithIngredients1 = MealWithIngredients(
      meal: meal1,
      ingredients: ingredientsWithKcal1,
    );

    final mealWithIngredients2 = MealWithIngredients(
      meal: meal2,
      ingredients: ingredientsWithKcal2,
    );

    return [mealWithIngredients1, mealWithIngredients2];
  }

  /// Calculate calories based on ingredient and quantity
  static int calculateCalories(Ingredient ingredient, int quantity) {
    // Calorías = (cantidad / 100) * calorías por 100
    return ((quantity / 100) * ingredient.caloriesPer100).round();
  }
}
