import 'package:fl_examen_final/models/user.dart' as u_model;
import 'package:fl_examen_final/models/meal.dart';
import 'package:fl_examen_final/models/diet.dart';
import 'package:fl_examen_final/models/ingredient.dart';
import 'package:fl_examen_final/services/user_service.dart';
import 'package:fl_examen_final/utils/date_formatter.dart';
import 'package:fl_examen_final/utils/errors.dart';
import 'package:fl_examen_final/utils/extended_models.dart';

/**
 * 
 * 
 *  SI SE USAN SUBCOLECCIONES, EL ACCESO A LOS DATOS ES MUCHO MAS SIMPLE, PERO:
 * 
 *  NO SE PUEDEN REUTILIZAR LOS DATOS DE UNA FORMA TAN SENCILLA COMO CON LOS CAMPOS DE REFERENCIA.
 *  EN NUESTRA APP, HABRÁN MUCHOS CASOS EN EL QUE SE REUTILICE EL CÓDIGO, ASI QUE ESTA OPCIÓN ES LA MEJOR.
 *  
 *  ENTONCES, LA MEJOR FORMA ES CREAR COLECCIONES SEPARADAS QUE GUARDEN REFERENCIAS EN ID DE LOS DOCUMENTOS.
 *  EN MI CASO, HE CREADO ADEMAS UNAS CLASES AUXILIARES QUE NOS 
 * 
 * 
 */

/// Obtiene la dieta del día actual para el usuario actual
Future<CompleteDiet> getTodayDiet() async {
  final user = await getCurrentUser();
  final todayDietId = user.assignedDietsMap[getTodayDateFormatted()];
  if (todayDietId == null) {
    throw NoDietDataForTodayException();
  }

  return await getDietWithDetails(todayDietId);
}

/// Obtiene todas las dietas asignadas al usuario actual
Future<List<CompleteDiet>> getAllUserDiets() async {
  final user = await getCurrentUser();

  // Obtener todos los IDs de dietas asignados al usuario
  final dietIds = user.assignedDietsMap.values.toSet().toList();

  if (dietIds.isEmpty) {
    return [];
  }

  // Obtener todas las dietas con sus detalles
  final diets =
      await Future.wait(dietIds.map((dietId) => getDietWithDetails(dietId)));

  return diets;
}

/// Obtiene las dietas asignadas al usuario para una fecha específica
Future<List<CompleteDiet>> getUserDietsForDate(DateTime date) async {
  String day = date.day.toString().padLeft(2, '0');
  String month = date.month.toString().padLeft(2, '0');
  String year = date.year.toString();
  String dateFormatted = '$day-$month-$year';

  final user = await getCurrentUser();

  // Dieta con la fecha especifica
  final dietId = user.assignedDietsMap[dateFormatted];

  if (dietId == null) {
    throw NoDietForDateException();
  }

  // Dieta con sus detalles
  final diet = await getDietWithDetails(dietId);

  return [diet];
}

/// Me da la dieta con sus detalles.
Future<CompleteDiet> getDietWithDetails(String dietId) async {
  try {
    // 1. pillo la dieta
    final dietDoc = await dietRef.doc(dietId).get();
    if (!dietDoc.exists || dietDoc.data == null) {
      throw Exception('Diet not found');
    }
    final diet = dietDoc.data!;

    // 2. pillo las comidas
    final List<MealWithIngredients> mealsWithIngredients = [];

    if (diet.mealsIDs.isNotEmpty) {
      final mealsQuery =
          await mealRef.whereDocumentId(whereIn: diet.mealsIDs).get();

      // 3. ahora trinco todos los ingredientes de todas las comidas
      final Set<String> allIngredientIds = {};
      final Map<String, Meal> mealsById = {};

      for (final mealDoc in mealsQuery.docs) {
        if (mealDoc.exists) {
          final meal = mealDoc.data;
          mealsById[mealDoc.id] = meal;

          // Recopilar todos los IDs de ingredientes
          for (final ingredientsMap in meal.ingredientsIdsWithQuantity) {
            ingredientsMap.forEach((quantity, ingredientId) {
              allIngredientIds.add(ingredientId);
            });
          }
        }
      }

      // 4. Obtener todos los ingredientes en una única consulta
      final Map<String, Ingredient> ingredientsById = {};
      if (allIngredientIds.isNotEmpty) {
        final ingredientsQuery = await ingredientRef
            .whereDocumentId(whereIn: allIngredientIds.toList())
            .get();

        for (final ingredientDoc in ingredientsQuery.docs) {
          if (ingredientDoc.exists) {
            ingredientsById[ingredientDoc.id] = ingredientDoc.data!;
          }
        }
      }

      // 5. Componer las comidas con sus ingredientes
      for (final mealId in diet.mealsIDs) {
        final meal = mealsById[mealId];
        if (meal != null) {
          final List<IngredientWithKcal> ingredientsWithKcal = [];

          // Procesar cada ingrediente con su cantidad y calcular calorías
          for (final ingredientsMap in meal.ingredientsIdsWithQuantity) {
            ingredientsMap.forEach((quantity, ingredientId) {
              final ingredient = ingredientsById[ingredientId];
              if (ingredient != null) {
                // Calcular calorías basadas en cantidad y calorías por 100g
                final kcal = calculateCalories(ingredient, quantity);

                ingredientsWithKcal.add(IngredientWithKcal(
                  ingredient: ingredient,
                  kcal: kcal,
                  quantity: quantity,
                ));
              }
            });
          }

          mealsWithIngredients.add(MealWithIngredients(
            meal: meal,
            ingredients: ingredientsWithKcal,
          ));
        }
      }
    }

    return CompleteDiet(
      diet: diet,
      meals: mealsWithIngredients,
    );
  } catch (e) {
    print('Error getting diet with details: $e');
    rethrow;
  }
}

/// Calcula las calorías basadas en la cantidad del ingrediente
int calculateCalories(Ingredient ingredient, int quantity) {
  // Calorías = (cantidad en gramos / 100) * calorías por 100g
  return ((quantity / 100) * ingredient.caloriesPer100).round();
}

Future<Diet> createDiet(Diet diet) async {
  final dietDoc = await dietRef.add(diet);
  final dietData = await dietDoc.get();
  if (!dietData.exists || dietData.data == null) {
    throw DietDataNotFoundException();
  }

  return dietData.data!;
}

Future<void> assignDietToUser(
    String userId, CompleteDiet compDiet, DateTime date) async {
  try {
    final user = await getUserById(userId);

    final Map<String, String> updatedDietsMap = Map.from(user.assignedDietsMap);

    updatedDietsMap[formatDate(date)] = compDiet.diet.id;

    await u_model.userRef.doc(userId).update(
          assignedDietsMap: updatedDietsMap,
        );
  } catch (e) {
    rethrow;
  }
}

Future<List<CompleteDiet>> getAllAvailableDiets() async {
  try {
    final dietsQuery = await dietRef.get();

    if (dietsQuery.docs.isEmpty) {
      return [];
    }

    final List<CompleteDiet> completeDiets = [];

    for (final dietDoc in dietsQuery.docs) {
      if (dietDoc.exists) {
        final completeDiet = await getDietWithDetails(dietDoc.id);
        completeDiets.add(completeDiet);
      }
    }

    return completeDiets;
  } catch (e) {
    print('Error getting all available diets: $e');
    rethrow;
  }
}

 
/*
Future<void> assignDietToUser(String userId, CompleteDiet completeDiet,
    {DateTime? date}) async {
  try {
    // Si no me dan fecha, uso la fecha actual
    final targetDate = date ?? DateTime.now();

    // formato
    String day = targetDate.day.toString().padLeft(2, '0');
    String month = targetDate.month.toString().padLeft(2, '0');
    String year = targetDate.year.toString();
    String dateFormatted = '$day-$month-$year';

    // miro si existe el usuario

    final userData = await getUserById(userId);

    final Map<String, String> updatedDietsMap =
        Map.from(userData.assignedDietsMap);

    // Con el map, uso la llave dateFormatted que es la fecha.
    updatedDietsMap[dateFormatted] = completeDiet.diet.id;

    // Actualizo el nuevo mapa de dietas del usuario
    await u_model.userRef.doc(userId).update(
          assignedDietsMap: updatedDietsMap,
        );

    // Miro si la dieta ya existe
    final dietDoc = await dietRef.doc(completeDiet.diet.id).get();

    // Si no existe, la creo
    if (!dietDoc.exists) {
      // Primero, asegurémonos de que las comidas existan
      for (final mealWithIngredients in completeDiet.meals) {
        final mealDoc = await mealRef.doc(mealWithIngredients.meal.id).get();
        // final meal = await getMealWithIngredients(mealWithIngredients.meal.id);

        if (!mealDoc.exists) {
          // Si la comida no existe, la creo
          await mealRef
              .doc(mealWithIngredients.meal.id)
              .set(mealWithIngredients.meal);

          // Repito, si no existe el ingrediente, lo creo
          for (final ingredientWithKcal in mealWithIngredients.ingredients) {
            final ingredientDoc =
                await ingredientRef.doc(ingredientWithKcal.ingredient.id).get();

            if (!ingredientDoc.exists) {
              await ingredientRef
                  .doc(ingredientWithKcal.ingredient.id)
                  .set(ingredientWithKcal.ingredient);
            }
          }
        }
      }

      // Crear la dieta
      await dietRef.doc(completeDiet.diet.id).set(completeDiet.diet);
    }
  } catch (e) {
    rethrow;
  }
}


*/

/*



/// Obtiene una comida específica con todos sus ingredientes
Future<MealWithIngredients?> getMealWithIngredients(String mealId) async {
  try {
    final mealDoc = await mealRef.doc(mealId).get();
    if (!mealDoc.exists || mealDoc.data == null) {
      return null;
    }

    final meal = mealDoc.data!;
    final List<IngredientWithKcal> ingredientsWithKcal = [];

    // Recopilar todos los IDs de ingredientes
    final Set<String> ingredientIds = {};
    for (final ingredientsMap in meal.ingredientsIdsWithQuantity) {
      ingredientsMap.forEach((quantity, ingredientId) {
        ingredientIds.add(ingredientId);
      });
    }

    // Obtener todos los ingredientes en una única consulta
    if (ingredientIds.isNotEmpty) {
      final ingredientsQuery = await ingredientRef
          .whereDocumentId(whereIn: ingredientIds.toList())
          .get();

      final Map<String, Ingredient> ingredientsById = {};
      for (final doc in ingredientsQuery.docs) {
        if (doc.exists) {
          ingredientsById[doc.id] = doc.data;
        }
      }

      // Procesar cada ingrediente con su cantidad y calcular calorías
      for (final ingredientsMap in meal.ingredientsIdsWithQuantity) {
        ingredientsMap.forEach((quantity, ingredientId) {
          final ingredient = ingredientsById[ingredientId];
          if (ingredient != null) {
            // Calcular calorías basadas en cantidad y calorías por 100g
            final kcal = calculateCalories(ingredient, quantity);

            ingredientsWithKcal.add(IngredientWithKcal(
              ingredient: ingredient,
              kcal: kcal,
              quantity: quantity,
            ));
          }
        });
      }
    }

    return MealWithIngredients(
      meal: meal,
      ingredients: ingredientsWithKcal,
    );
  } catch (e) {
    print('Error getting meal with ingredients: $e');
    return null;
  }
}

*/