import 'package:fl_examen_final/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_examen_final/theme/theme_provider.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return IconButton(
      icon: Icon(
        themeProvider.isLightTheme 
            ? Icons.dark_mode 
            : Icons.light_mode,
      ),
      onPressed: () {
        themeProvider.changeTheme(); 
      },
    );
  }
}