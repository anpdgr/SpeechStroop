import 'dart:ui';

import 'package:speech_stroop/model/test_module/section.dart';
import 'package:speech_stroop/screens/stroop/stroop_test/stroop_test.dart';
import 'package:speech_stroop/screens/stroop/stroop_test/components/body.dart';
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
  if (answered != -1 && scorePerQuestion != 0) {
    String condition = testTemplate[answered].item3;
    scores[condition]++;

    scorePerQuestion = 0;
  }
  if (answered == QUESTIONS_AMOUNT - 1) {
    var totalScoreThisSection = scores["congruent"] + scores["incongruent"];
    totalScore += totalScoreThisSection;

    var notEmptyReactionTime = questions
        .map((q) => q.reactionTimeMs)
        .where((rt) => rt != null)
        .toList();
    int notEmptyReactionTimeLength = notEmptyReactionTime.length;
    double avgReactionTime = notEmptyReactionTimeLength == 0
        ? null
        : (notEmptyReactionTime.reduce((a, b) => a + b)) /
            notEmptyReactionTimeLength;
    //TODO: fix audioUrl
    var section =
        Section(sectionNumber, scores, avgReactionTime, questions, "audioUrl");
    sections.add(section);
    scores = {"congruent": 0, "incongruent": 0};
  }
}

bool isAnswerCorrect() {
  valAlternates.sort((a, b) => a.confidence.compareTo(b.confidence));
  var userAnswer = valAlternates[0].recognizedWords;

  for (var predictedResult in valAlternates) {
    var predictedWord = predictedResult.recognizedWords;
    if (predictedWord ==
        colorsMapDefault.keys.firstWhere(
            (k) => colorsMapDefault[k] == testTemplate[answered].item2,
            orElse: () => '')) {
      isCorrect = true;
      userAnswer = predictedWord;
      break;
    } else {
      isCorrect = false;
    }
  }

  questions[answered].userAnswer = userAnswer;
  //TODO: fix bug
  // print("userAnswer" + questions[answered].userAnswer);

  return isCorrect;
}
