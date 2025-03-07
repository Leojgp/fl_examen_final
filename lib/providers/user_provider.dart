import 'package:flutter/material.dart';
import 'package:fl_examen_final/models/user.dart' as u_model;
import 'package:fl_examen_final/services/user_service.dart';

class UserProvider extends ChangeNotifier {
  u_model.User? _user;
  bool _loading = true;
  String? _error;

  u_model.User? get user => _user;
  bool get loading => _loading;
  String? get error => _error;

  UserProvider() {
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      _loading = true;
      notifyListeners();

      _user = await getCurrentUser();
      _error = null;
    } catch (e) {
      print(e);
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> refreshUser() async {
    await _fetchUserData();
  }

  Future<void> updateUserData({
    int? age,
    int? weight,
    int? height,
    String? dietFocus,
    List<String>? allergies,
    Map<String, String>? assignedDietsMap,
  }) async {
    try {
      _loading = true;
      notifyListeners();

      await updateUser(
        age?.toString(),
        weight?.toString(),
        height?.toString(),
        dietFocus,
        allergies,
        assignedDietsMap,
      );

      await _fetchUserData();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
}
