import 'dart:ui';

import 'package:speech_stroop/model/test%20module/section.dart';
import 'package:speech_stroop/screens/stroop/stroop_test/stroop_test.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

int answered = -1;
List textArr;
bool isCorrect = false;
int scorePerSection = 0;
int scorePerQuestion = 0;
List<SpeechRecognitionWords> valAlternates;
var scores = {"congruent": 0, "incongruent": 0};
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
    String condition = testTemplate[answered].item3;
    scores[condition]++;

    scorePerQuestion = 0;
  }
  if (answered == QUESTIONS_AMOUNT - 1) {
    var totalScoreThisSection = scores["congruent"] + scores["incongruent"];
    var section = Section(sectionNumber, scores, 0, questions, "test");
    print(section);
    // sections.add(section);
  }
  print(scores);
}

bool isAnswerCorrect() {
  for (var predictedResult in valAlternates) {
    var predictedWord = predictedResult.recognizedWords;
    if (predictedWord ==
        colorsMapDefault.keys.firstWhere(
            (k) => colorsMapDefault[k] == testTemplate[answered].item2,
            orElse: () => '')) {
      isCorrect = true;
      questions[answered].userAnswer = predictedWord;
      return isCorrect;
    } else {
      isCorrect = false;
    }
  }
  return isCorrect;
}
