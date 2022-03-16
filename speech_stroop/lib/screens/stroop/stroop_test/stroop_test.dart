import 'package:flutter/material.dart';
import 'package:speech_stroop/model/test%20module/question.dart';
import 'package:more/tuple.dart';
import 'package:speech_stroop/screens/stroop/stroop_test/components/body.dart';

int sectionNumber = 1;
int QUESTIONS_AMOUNT = 20;
List<Tuple3<String, Color, String>> testTemplate = [];
List sections = [];
List<Question> questions = [];
var historyTest = {};

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
