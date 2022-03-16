import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
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
    // TODO: add our text style
    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme();
}
