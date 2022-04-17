import 'package:flutter/material.dart';
import 'package:speech_stroop/enums.dart';
import 'package:speech_stroop/theme.dart';
import 'package:tuple/tuple.dart';

// Color
Map<int, Color> color = {
  50: const Color.fromRGBO(4, 131, 184, .1),
  100: const Color.fromRGBO(4, 131, 184, .2),
  200: const Color.fromRGBO(4, 131, 184, .3),
  300: const Color.fromRGBO(4, 131, 184, .4),
  400: const Color.fromRGBO(4, 131, 184, .5),
  500: const Color.fromRGBO(4, 131, 184, .6),
  600: const Color.fromRGBO(4, 131, 184, .7),
  700: const Color.fromRGBO(4, 131, 184, .8),
  800: const Color.fromRGBO(4, 131, 184, .9),
  900: const Color.fromRGBO(4, 131, 184, 1),
};

MaterialColor primaryColorMaterial = MaterialColor(0xFF37265F, color);
Color primaryColor = const Color(0xFF37265F);

Color secondaryColor = const Color(0xFFEB8D8D);

Color softPrimaryColor = const Color(0xFFF4F4F9);

Color tertiaryColor = const Color(0xFFFFE7E2);

Color backgroundColor = const Color(0xFFFBFBFF);

Color formText = const Color(0xFF525252);
Color formBorder = const Color(0xFFA7A5A5);

// Button
Map<ButtonType, Tuple2<Size, TextStyle>> buttonStyle = {
  ButtonType.small: Tuple2(const Size(350, 42), textTheme().titleMedium),
  ButtonType.medium: Tuple2(const Size(350, 60), textTheme().titleLarge),
  ButtonType.large: Tuple2(const Size(350, 72), textTheme().titleLarge)
};

// API path
class APIPath {
  final baseUrl = "http://localhost:3000";
  final user = "/user";
}

// Stroop
int stroopQuestionsAmount = 20;
int stroopQuestionDurationMs = 3000;
int stroopIntervalDurationMs = 3000;
