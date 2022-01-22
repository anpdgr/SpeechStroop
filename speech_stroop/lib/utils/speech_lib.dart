import 'dart:ui';

import 'package:speech_stroop/screens/stroop_test/stroop_test.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

int answered = -1;
List textArr;
bool isCorrect = false;
int scorePerSection = 0;
int scorePerQuestion = 0;
List<SpeechRecognitionWords> valAlternates;
List scoresAllSection = [];
var scores = {"congruent": 0, "incongruent": 0, "sectionScore": 0};
var countTest = 0;

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
  if (scorePerQuestion != 0) {
    //if it's correct
    String condition = testTemplate[answered].last;
    scores[condition]++;

    scorePerQuestion = 0;
  }
  if (answered == QUESTIONS_AMOUNT - 1) {
    scores["sectionScore"] = scores["congruent"] + scores["incongruent"];
    scoresAllSection.add(scores["sectionScore"]);
  }
  print("scoresAllSection: " + scoresAllSection.toString());
  print(scores);
}

bool isAnswerCorrect() {
  for (var predictedResult in valAlternates) {
    var predictedWord = predictedResult.recognizedWords;
    if (predictedWord ==
        colorsMapDefault.keys.firstWhere(
            (k) => colorsMapDefault[k] == testTemplate[answered].second,
            orElse: () => '')) {
      isCorrect = true;
      return isCorrect;
    } else {
      isCorrect = false;
    }
  }
  return isCorrect;
}
