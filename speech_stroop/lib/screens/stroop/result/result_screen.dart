import 'package:flutter/material.dart';
import 'package:speech_stroop/components/appbar.dart';
import 'package:speech_stroop/screens/stroop/result/components/body.dart';
import 'package:speech_stroop/screens/stroop/stroop_test/stroop_test.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key key}) : super(key: key);
  static String routeName = "/result";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('ผลการทดสอบ'),
      body: Body(latestTest),
    );
  }
}
