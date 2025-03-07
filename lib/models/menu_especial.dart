import 'package:cloud_firestore/cloud_firestore.dart';

class MenuEspecial {
  final String? id;
  final String nombre;
  final String ingredientes;
  final String preparacion;
  final DateTime? createdAt;

  MenuEspecial({
    this.id,
    required this.nombre,
    required this.ingredientes,
    required this.preparacion,
    this.createdAt,
  });

  factory MenuEspecial.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MenuEspecial(
      id: doc.id,
      nombre: data['nombre'] ?? '',
      ingredientes: data['ingredientes'] ?? '',
      preparacion: data['preparacion'] ?? '',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nombre': nombre,
      'ingredientes': ingredientes,
      'preparacion': preparacion,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : FieldValue.serverTimestamp(),
    };
  }
}