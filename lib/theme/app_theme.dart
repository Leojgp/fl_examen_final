import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightBackground = Color(0xFFDAD7CD);
  static const Color softGreen = Color(0xFFA3B18A);
  static const Color mediumGreen = Color(0xFF588157);
  static const Color darkGreen = Color(0xFF3A5A40);
  static const Color deeperGreen = Color(0xFF344E41);
  static const Color white = Colors.white;
  static const Color inputBackground = Color.fromARGB(55, 241, 221, 199); // Color para los inputs
  static const Color iconGrey = Color.fromARGB(216, 52, 78, 65);
  
  // Colores oscuros
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSoftGreen = Color(0xFF4A6E4A); 
  static const Color darkMediumGreen = Color(0xFF3A5A40);
  static const Color darkDeeperGreen = Color(0xFF2A3A30); 
  static const Color darkInputBackground = Color.fromARGB(55, 30, 30, 30); 
  static const Color darkIconGrey = Color.fromARGB(216, 200, 200, 200);
  static const Color inputBackgroundDark = Color.fromARGB(154, 255, 255, 255);
  static const Color black = Colors.black;
  
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: mediumGreen,
      scaffoldBackgroundColor: white,
      fontFamily: 'Inter',
      appBarTheme: const AppBarTheme(
        backgroundColor: white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: deeperGreen,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: deeperGreen),
        displayMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: mediumGreen),
        displaySmall: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: darkGreen),
        headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: white),
        headlineSmall: TextStyle(fontSize: 16, color: white),
        labelMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
        bodyLarge: TextStyle(fontSize: 18, color: deeperGreen),
        bodyMedium: TextStyle(fontSize: 16, color: darkGreen),
        bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
        titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
        labelLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: mediumGreen),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: mediumGreen,
          foregroundColor: white,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        suffixIconColor: Colors.grey,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: mediumGreen,
          textStyle: const TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: white,
      ),
    );
  }

static ThemeData get darkTheme {
  return ThemeData(
    primaryColor: darkGreen,
    scaffoldBackgroundColor: darkBackground, 
    fontFamily: 'Inter',
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBackground,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white, 
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      displayMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
      displaySmall: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white70),
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
      headlineSmall: TextStyle(fontSize: 16, color: Colors.white),
      labelMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
      bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white70),
      titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
      labelLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: mediumGreen,
        foregroundColor: Colors.white, 
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: inputBackgroundDark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      suffixIconColor: white,
        hintStyle: const TextStyle(
        color: Colors.white70, 
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: mediumGreen,
        textStyle: const TextStyle(
          decoration: TextDecoration.underline,
        ),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.grey[870],
    ),
  );
}

  static final plannerStyles = _PlannerStyles();
}

class _PlannerStyles {
  final dayButtonSelected = BoxDecoration(
    color: AppTheme.mediumGreen,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(
      color: AppTheme.mediumGreen,
      width: 1,
    ),
  );

  final dayButtonUnselected = BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(
      color: Colors.black12,
      width: 1,
    ),
  );

  final profileButtonStyle = const BoxDecoration(
    color: AppTheme.mediumGreen,
    shape: BoxShape.circle,
  );

  final mealCardImageStyle = const BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(16),
      bottomRight: Radius.circular(16),
    ),
  );
}