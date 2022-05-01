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

// Tutorial
int tutorialQuestionsAmount = 5;

// Stroop
int stroopQuestionsAmount = 20;
int stroopQuestionDurationMs = 3000; //3000;
int stroopIntervalDurationMs = 3000; //3000;
Map<String, Color> stroopColorsMap = {
  'แดง': const Color(0xFFDA5C54),
  'ดำ': const Color(0xFF000000),
  'เหลือง': const Color(0xFFECD933),
  'เขียว': const Color(0xFF25CF55),
  'ส้ม': const Color(0xFFEC8133),
  'ฟ้า': const Color(0xFF72C4FF),
  'ม่วง': const Color(0xFF8F00FF)
};
List<String> stroopColorsName = stroopColorsMap.keys.toList();
List<Color> stroopColorsCode = stroopColorsMap.values.toList();

// Chart
Map<int, String> dateLabel = {
  1: 'จ.',
  2: 'อ.',
  3: 'พ.',
  4: 'พฤ.',
  5: 'ศ.',
  6: 'ส.',
  7: 'อา.',
};

/// can be used to improve speech-to-text performance
Map<String, List<String>> similarWords = {
  'แดง': ['แดง', 'สีแดง', 'แรง', 'แบ่ง', 'แพง', 'แนง', 'แมง'],
  'ดำ': ['ดำ', 'สีดำ', 'ดาม', 'นำ', 'จำ', 'ดอม'],
  'เหลือง': ['เหลือง', 'สีเหลือง', 'เหลือ', 'เรื่อง', 'หลวง'],
  'เขียว': ['เขียว', 'สีเขียว', 'เดี๋ยว'],
  'ส้ม': ['ส้ม', 'สีส้ม', 'ส่ง', 'ซ่อม'],
  'ฟ้า': ['ฟ้า', 'สีฟ้า', 'ป๊า', 'สา', 'ฝา'],
  'ม่วง': ['ม่วง', 'สีม่วง', 'ง่วง', 'มั่ว'],
};

List<Tuple2<String, String>> allSimilarWords = similarWords.values
    .toList()
    .map((arr) => arr.map((word) => Tuple2(arr[0], word)).toList())
    .toList()
    .expand((element) => element)
    .toList();
