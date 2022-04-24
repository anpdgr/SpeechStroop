import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/components/appbar.dart';
import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/model/test_module/health_scores.dart';
import 'package:speech_stroop/model/test_module/history.dart';
import 'package:speech_stroop/screens/stroop/healthRating/components/health_slider.dart';
import 'package:speech_stroop/screens/stroop/result/result_screen.dart';
import 'package:speech_stroop/screens/stroop/stroop_test/stroop_test.dart';
import 'package:speech_stroop/utils/speech_lib.dart';

class Body extends StatefulWidget {
  Body(this.appbarTitle, {Key key}) : super(key: key);
  String appbarTitle;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      appBar: CustomAppBar(widget.appbarTitle),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          const HealthSlider(),
          const SizedBox(
            height: 60,
          ),
          PrimaryButton('แสดงผลลัพธ์', () async {
            sectionNumber = 0;
            answered = -1;
            stress.end = stressLevel.toInt();
            arousel.end = arouselLevel.toInt();
            healthScores = HealthScores(stress, arousel);

            var res = await setHistory(
              totalScore,
              sections,
              healthScores,
              null,
            );

            Navigator.pushNamed(context, ResultScreen.routeName);

            sections = [];
            totalScore = 0;
          })
        ]),
      ),
    );
  }
}
