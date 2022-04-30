import 'package:flutter/material.dart';

List<Color> setBackgroundColor(int answered, String feedback) {
  List<Color> stroopBackgroundColor = [];
  if (answered >= 0) {
    switch (feedback) {
      case '':
        stroopBackgroundColor = [
          const Color(0xFFF5F5F5),
          const Color(0xFFF5F5F5)
        ];
        break;
      case 'ถูกต้อง':
        stroopBackgroundColor = [
          const Color(0xFF6FC2A0),
          const Color(0xFF6FC2A0)
        ];
        break;
      case 'ผิด':
        stroopBackgroundColor = [
          const Color(0xFFDA4F2C),
          const Color(0xFFDA4F2C)
        ];
        break;
    }
  } else {
    stroopBackgroundColor = [const Color(0xff503B7F), const Color(0xffEB8D8D)];
  }
  return stroopBackgroundColor;
}
