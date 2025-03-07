import "package:cloud_firestore/cloud_firestore.dart";
import "package:fl_examen_final/models/user.dart";

registerUser(User user) {
  FirebaseFirestore.instance
      .collection("users")
      .doc(user.uid)
      .set(user.toMap());
}
