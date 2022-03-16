import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    useMaterial3: true,
    primarySwatch: primaryColor,
    fontFamily: 'BaiJamjuree',
    textTheme: textTheme(),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder();
  return InputDecorationTheme();
}

TextTheme textTheme() {
  return const TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 115.0,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 45.0,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 36.0,
    ),
    headlineLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 32.0,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 28.0,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 24.0,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 22.0,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
    ),
    labelLarge: TextStyle(
      fontSize: 14.0,
    ),
    labelMedium: TextStyle(
      fontSize: 12.0,
    ),
    labelSmall: TextStyle(
      fontSize: 12.0,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
    ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme();
}
