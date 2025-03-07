import 'package:flutter/material.dart';
import 'package:fl_examen_final/theme/app_theme.dart';

class ThemeProvider with ChangeNotifier {
  bool _isLightTheme = true;

   bool get isLightTheme => _isLightTheme;

  ThemeData get themeData => isLightTheme ? AppTheme.lightTheme : AppTheme.darkTheme;

  void changeTheme() {
    _isLightTheme = !_isLightTheme; 
    notifyListeners(); 
  }
}
