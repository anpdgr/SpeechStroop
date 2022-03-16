import 'package:flutter/material.dart';
import 'package:speech_stroop/screens/stroop/break/components/body.dart';

class BreakScreen extends StatelessWidget {
  const BreakScreen({Key key}) : super(key: key);
  static String routeName = "/break";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
