import 'dart:ui';

import 'package:speech_stroop/constants.dart';
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

void scoreCounting(bool isCorrect) {
  // count score for each questions
  if (answered >= 0 && isCorrect) {
    String condition = testTemplate[answered].item3;
    scores[condition]++;
  }
  // count score for each sections
  if (answered == stroopQuestionsAmount - 1) {
    var totalScoreThisSection = scores["congruent"] + scores["incongruent"];
    totalScore += totalScoreThisSection;

    // culculate average reaction time
    var notEmptyReactionTime = questions
        .map((q) => q.reactionTimeMs)
        .where((rt) => rt != null)
        .toList();
    int notEmptyReactionTimeLength = notEmptyReactionTime.length;
    double avgReactionTime = notEmptyReactionTimeLength == 0
        ? null
        : (notEmptyReactionTime.reduce((a, b) => a + b)) /
            notEmptyReactionTimeLength;

    //TODO: add audioUrl
    var section =
        Section(sectionNumber, scores, avgReactionTime, questions, "audioUrl");
    sections.add(section);
  }
}
