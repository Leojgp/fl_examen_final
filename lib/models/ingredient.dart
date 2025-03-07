import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'ingredient.g.dart';

const firestoreSerializable = JsonSerializable(
  converters: firestoreJsonConverters,
  explicitToJson: true,
  createFieldMap: true,
  createPerFieldToJson: true,
);

@firestoreSerializable
class Ingredient {
  Ingredient({
    required this.name,
    required this.unit,
    required this.caloriesPer100,
    required this.imageUrl,
    required this.id,
  });

  @Id()
  final String id;

  final String name;
  final String unit;
  final double caloriesPer100;
  final String imageUrl;
}

@Collection<Ingredient>('ingredients')
final ingredientRef = IngredientCollectionReference();
