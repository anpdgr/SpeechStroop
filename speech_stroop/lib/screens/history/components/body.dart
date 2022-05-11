import 'package:flutter/material.dart';
import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/model/test_module/history.dart';
import 'package:speech_stroop/screens/history/components/badge_section.dart';
import 'package:speech_stroop/screens/history/components/reaction_time_chart.dart';
import 'package:speech_stroop/screens/history/components/score_chart.dart';
import 'package:speech_stroop/screens/history_all/history_all_screen.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formGlobalKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    getHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                child: Column(
                  children: [
                    Image.asset('assets/images/his_trophy.png'),
                    PrimaryButton(
                        "ดูประวัติทั้งหมด",
                        () => {
                              Navigator.pushNamed(
                                  context, HistoryAllScreen.routeName)
                            }),
                    ScoreChartSection(userHistory, 7), //TODO: filter date
                    ReactionTimeChartSection(userHistory, 7),
                    BadgeSection(userHistory),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
