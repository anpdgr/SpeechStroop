import 'package:flutter/material.dart';
import 'package:speech_stroop/components/appbar.dart';
import 'package:speech_stroop/screens/stroop/healthRating/components/body_start.dart'
    as start;
import 'package:speech_stroop/screens/stroop/healthRating/components/body_break.dart'
    as testBreak;
import 'package:speech_stroop/screens/stroop/healthRating/components/body_end.dart'
    as end;
import 'package:speech_stroop/screens/stroop/stroop_test/components/body.dart';

class BreakScreen extends StatelessWidget {
  BreakScreen({Key key}) : super(key: key);
  static String routeName = "/break";

  final Map<int, dynamic> mapBody = {
    0: start.Body('จะเริ่มแบบทดสอบแล้ว'),
    1: testBreak.Body('พัก'),
    2: testBreak.Body('พัก'),
    3: end.Body('เสร็จสิ้น'),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mapBody[sectionNumber],
    );
  }
}
