import 'package:flutter/material.dart';
import 'package:speech_stroop/model/test_module/health_scores.dart';
import 'package:speech_stroop/model/test_module/history.dart';
import 'package:speech_stroop/model/test_module/question.dart';
import 'package:speech_stroop/model/test_module/section.dart';
import 'package:speech_stroop/screens/stroop/stroop_test/components/body.dart';

import 'package:speech_stroop/screens/stroop/stroop_test/components/flutter_sound.dart';
import 'package:tuple/tuple.dart';

// latest test
History latestTest;
// section
int sectionNumber = 0;
List<Section> sections = [];
// health scores
HealthScores healthScores;
HealthScore stress = HealthScore(0, 0, 0, 0);
HealthScore arousel = HealthScore(0, 0, 0, 0);

List<Question> questions = [];
int totalScore = 0;
// build test
List<Tuple3<String, Color, String>> testTemplate;
int level = 0;
List<int> prevLevel = [];
String recogWord = '';
// stopwatch
Stopwatch stopwatchRT = Stopwatch();
Stopwatch stopwatchAudio = Stopwatch();
// audio
RecordAudio recordAudio;
DateTime recordAudioDataTime = DateTime.now();

class StroopTestScreen extends StatelessWidget {
  const StroopTestScreen({Key key}) : super(key: key);
  static String routeName = "/stroop_test";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
