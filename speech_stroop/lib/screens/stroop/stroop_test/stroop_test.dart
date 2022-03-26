import 'package:flutter/material.dart';
import 'package:speech_stroop/model/test_module/health_scores.dart';
import 'package:speech_stroop/model/test_module/history.dart';
import 'package:speech_stroop/model/test_module/question.dart';
import 'package:speech_stroop/model/test_module/section.dart';
import 'package:speech_stroop/screens/stroop/stroop_test/components/body.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

int totalScore = 0;
List<Section> sections = [];
List<Question> questions = [];
HealthScores healthScores;
HealthScore stress = HealthScore(0, 0, 0, 0);
HealthScore awake = HealthScore(0, 0, 0, 0);

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
  var history = History(totalScore, sections, healthScores, null);
  var res = await http.post(Uri.parse("http://localhost:3000/history"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MjNlYjU0ZjUxODg0NTIwYTRkZThlOTUiLCJpYXQiOjE2NDgyNzY4MjZ9.MGGqHkHGBBQps-wzrtTPTHv4lRY4yLatgUE5QNELdLE',
      },
      body: jsonEncode(history.toJson()));
  return res;
}
