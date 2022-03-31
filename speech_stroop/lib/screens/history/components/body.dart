import 'package:flutter/material.dart';
import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/model/test_module/history.dart';
import 'package:speech_stroop/screens/history/components/badge_section.dart';
import 'package:speech_stroop/screens/history/components/score_bar_section.dart';
import 'package:speech_stroop/screens/history_all/history_all_screen.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formGlobalKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(children: [
      Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              Image.asset('assets/images/his_trophy.png'),
              PrimaryButton(
                  "ดูประวัติทั้งหมด",
                  () async => {
                        await getHistory(),
                        Navigator.pushNamed(context, HistoryAllScreen.routeName)
                      }),
              ScoreBarSection(userHistory),
              BadgeSection(userHistory),
            ],
          ))
    ])));
  }
}
