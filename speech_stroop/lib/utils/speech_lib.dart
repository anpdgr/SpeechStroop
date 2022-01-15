import 'dart:ui';

import 'package:speech_stroop/screens/stroop_test/stroop_test.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

int answered = -1;
List textArr;
bool isCorrect = false;
int score = 0;
int scoreOne = 0;
List<SpeechRecognitionWords> valAlternates;
List scores = [];

Map colorsMapDefault = {
  'แดง': const Color(0xFFDA5C54),
  'ดำ': const Color(0xFF000000),
  'เหลือง': const Color(0xFFECD933),
  'เขียว': const Color(0xFF25CF55),
  'ส้ม': const Color(0xFFEC8133),
  'ฟ้า': const Color(0xFF72C4FF),
  'ม่วง': const Color(0xFF8F00FF)
};

List colorsName = ['แดง', 'ดำ', 'เหลือง', 'เขียว', 'ส้ม', 'ฟ้า', 'ม่วง'];
List colorsCode = const [
  Color(0xFFDA5C54),
  Color(0xFF000000),
  Color(0xFFECD933),
  Color(0xFF25CF55),
  Color(0xFFEC8133),
  Color(0xFF72C4FF),
  Color(0xFF8F00FF)
];

void scoreCounting() {
  if (scoreOne != 0) {
    score++;
    scoreOne = 0;
  }
  if (answered == QUESTIONS_AMOUNT - 1) {
    scores.add(score);
  }

  // print(answered);
  print("score: " + score.toString());
  print("scores: " + scores.toString());
}

bool isAnswerCorrect() {
  for (var predictedResult in valAlternates) {
    var predictedWord = predictedResult.recognizedWords;
    if (predictedWord == colorsMapDefault.keys.toList()[answered]) {
      isCorrect = true;
      return isCorrect;
    } else {
      isCorrect = false;
    }
  }
  return isCorrect;
}
