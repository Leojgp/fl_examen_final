import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'user.g.dart';

const firestoreSerializable = JsonSerializable(
  converters: firestoreJsonConverters,
  explicitToJson: true,
  createFieldMap: true,
  createPerFieldToJson: true,
);

@firestoreSerializable
class User {
  User({
    required this.uid,
    required this.admin,
    required this.name,
    this.createdDiets,
    this.age,
    this.height,
    this.weight,
    this.dietFocus,
    this.allergies,
    this.assignedDietsMap = const {},
  });

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "name": name,
      "admin": admin,
      "created_diets": createdDiets,
      "age": age,
      "height": height,
      "weight": weight,
      "diet_focus": dietFocus,
      "allergies": allergies,
      "assigned_diets": assignedDietsMap,
      "created_at": FieldValue.serverTimestamp(),
    };
  }

  @Id()
  final String uid;

  final String name;

  final bool admin;
  final List<String>? createdDiets;

  @Min(0)
  final int? age;

  @Min(0)
  final int? height;

  @Min(0)
  final int? weight;

  final String? dietFocus;
  final List<String>? allergies;
  final Map<String, String> assignedDietsMap;
}

@Collection<User>('users')
final userRef = UserCollectionReference();
