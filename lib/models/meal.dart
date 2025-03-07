import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
part 'meal.g.dart';

const firestoreSerializable = JsonSerializable(
  converters: firestoreJsonConverters,
  explicitToJson: true,
  createFieldMap: true,
  createPerFieldToJson: true,
);

@firestoreSerializable
class Meal {
  Meal({
    required this.id,
    required this.image,
    required this.name,
    required this.createdAt,
    required this.ingredientsIdsWithQuantity,
  });

  @Id()
  final String id;

  final Uri image;
  final String name;
  final Timestamp createdAt;
  final List<Map<int, String>> ingredientsIdsWithQuantity;
}

@Collection<Meal>('meals')
final mealRef = MealCollectionReference();
