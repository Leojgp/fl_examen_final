// diet.dart

import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
part 'diet.g.dart';

const firestoreSerializable = JsonSerializable(
  converters: firestoreJsonConverters,
  explicitToJson: true,
  createFieldMap: true,
  createPerFieldToJson: true,
);

@firestoreSerializable
class Diet {
  Diet({
    required this.type,
    required this.mealsIDs,
    required this.id,
  });

  @Id()
  final String id;

  final String type;
  final List<String> mealsIDs;
}

@Collection<Diet>('diet')
final dietRef = DietCollectionReference();
