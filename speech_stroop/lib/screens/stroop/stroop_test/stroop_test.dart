import 'package:flutter/material.dart';
import 'package:speech_stroop/model/auth.dart';
import 'package:speech_stroop/model/test_module/health_scores.dart';
import 'package:speech_stroop/model/test_module/history.dart';
import 'package:speech_stroop/model/test_module/question.dart';
import 'package:speech_stroop/model/test_module/section.dart';
import 'package:speech_stroop/screens/stroop/stroop_test/components/body.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

History latestTest;
int totalScore = 0;
List<Section> sections = [];
List<Question> questions = [];
HealthScores healthScores;
HealthScore stress = HealthScore(0, 0, 0, 0);
HealthScore arousel = HealthScore(0, 0, 0, 0);

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

Future<http.Response> setHistory() async {
  latestTest = History(totalScore, sections, healthScores, null);
  var res = await http.post(Uri.parse("http://localhost:3000/history"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${auth.token}',
      },
      body: jsonEncode(latestTest));
  return res;
}
