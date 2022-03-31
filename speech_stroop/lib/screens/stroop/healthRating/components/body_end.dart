import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/components/appbar.dart';
import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/model/test_module/health_scores.dart';
import 'package:speech_stroop/screens/home/home_screen.dart';
import 'package:speech_stroop/screens/stroop/healthRating/components/health_slider.dart';
import 'package:speech_stroop/screens/stroop/stroop_test/stroop_test.dart';
import 'package:speech_stroop/screens/stroop/stroop_test/components/body.dart';
import 'package:speech_stroop/utils/speech_lib.dart';

class Body extends StatefulWidget {
  final String appbarTitle;
  Body(this.appbarTitle, {Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState(appbarTitle);
}

class _BodyState extends State<Body> {
  final String appbarTitle;
  _BodyState(this.appbarTitle);

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      appBar: CustomAppBar(appbarTitle),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          const HealthSlider(),
          const SizedBox(
            height: 60,
          ),
          PrimaryButton('ดูผลลัพธ์', () async {
            sectionNumber = 0;
            answered = -1;
            stress.end = stressLevel.toInt();
            awake.end = awakeLevel.toInt();
            healthScores = HealthScores(stress, awake);

            print(
                '${healthScores.stress.start}, ${healthScores.stress.break1}, ${healthScores.stress.break2}, ${healthScores.stress.end}');
            print(
                '${healthScores.awake.start}, ${healthScores.awake.break1}, ${healthScores.awake.break2}, ${healthScores.awake.end}');

            var res = await setHistory();
            print(res.body);
            Navigator.pushNamed(context, HomeScreen.routeName);
          })
        ]),
      ),
    );
  }
}
