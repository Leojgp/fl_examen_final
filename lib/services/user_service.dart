import 'package:cloud_firestore_odm/annotation.dart';
import 'package:fl_examen_final/models/user.dart' as umodel;
import 'package:fl_examen_final/utils/errors.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future<void> updateUser(
  String? age,
  String? weight,
  String? height,
  String? dietFocus,
  List<String>? allergies,
  Map<String, String>? assignedDiets,
) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  final user_id = auth.currentUser!.uid;
  @Collection<umodel.User>('users')
  final usersRef = umodel.UserCollectionReference();

  if (user_id.isNotEmpty) {
    await usersRef.doc(user_id).update(
          age: int.parse(age!),
          weight: int.parse(weight!),
          height: int.parse(height!),
          dietFocus: dietFocus,
          allergies: allergies,
          assignedDietsMap: assignedDiets ?? {},
        );
  } else {
    throw Exception("User ID is empty");
  }
}

Future<umodel.User> getCurrentUser() async {
  final userFirebase = FirebaseAuth.instance.currentUser;
  if (userFirebase == null) {
    throw UserNotLoggedInException();
  }

  final userId = userFirebase.uid;
  final user = await umodel.userRef.doc(userId).get();
  if (!user.exists || user.data == null) {
    throw UserDataNotFoundException();
  }

  return user.data!;
}

Future<umodel.User> getUserById(String userId) async {
  final user = await umodel.userRef.doc(userId).get();
  if (!user.exists || user.data == null) {
    throw UserDataNotFoundException();
  }

  return user.data!;
}

Future<bool> userExists(String userId) async {
  final user = await umodel.userRef.doc(userId).get();
  return user.exists;
}

Future<bool> isOnboard() async {
  final userData = await getUserById(FirebaseAuth.instance.currentUser!.uid);

  bool onboardingComplete = userData.age != null &&
      userData.height != null &&
      userData.weight != null &&
      userData.dietFocus != null;

  return onboardingComplete;
}

Future<List<umodel.User>> getUsers() async {
  final users = await umodel.userRef.get();
  return users.docs.map((e) => e.data).toList();
}
