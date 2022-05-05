import 'package:flutter/material.dart';
import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/enums.dart';
import 'package:speech_stroop/model/test_module/history.dart';
import 'package:speech_stroop/model/test_module/section.dart';
import 'package:speech_stroop/screens/home/home_screen.dart';
import 'package:speech_stroop/screens/stroop/result/components/section_badge.dart';
import 'package:speech_stroop/screens/stroop/result/components/section_high_score.dart';
import 'package:speech_stroop/screens/stroop/result/components/section_latest_score_chart.dart';
import 'package:speech_stroop/screens/stroop/result/components/section_score.dart';
import 'package:speech_stroop/screens/stroop/result/components/total_score.dart';
import 'package:speech_stroop/screens/stroop/result/components/type_score.dart';
import 'package:speech_stroop/screens/stroop/stroop_test/stroop_test.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formGlobalKey = GlobalKey<FormState>();
  History latestTestData;
  List<History> history;
  int sumCongruentScore = 0;
  int sumIncongruentScore = 0;

  void calculateTypeScore() {
    for (Section s in latestTestData.sections) {
      sumCongruentScore = sumCongruentScore + s.score["congruent"];
      sumIncongruentScore = sumIncongruentScore + s.score["incongruent"];
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getHistory();
      setState(() {
        history = userHistory;
      });
    });

    latestTestData = latestTest;
    calculateTypeScore();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
            child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              TotalScore(latestTestData.totalScore, sumCongruentScore,
                  sumIncongruentScore),
              SectionScore(latestTestData.sections),
              const SizedBox(height: 20),
              TypeScore(sumCongruentScore, sumIncongruentScore),
              const SizedBox(height: 20),
              SectionLatesScoreChart(history, 7),
              const SizedBox(height: 5),
              SectionHighScore(),
              const SizedBox(height: 5),
              SectionBadge(),
              const SizedBox(height: 5),
              PrimaryButton(
                  "เข้าสู่หน้าหลัก",
                  () => Navigator.pushNamed(context, HomeScreen.routeName),
                  ButtonType.medium)
            ],
          ),
        )));
  }
}
