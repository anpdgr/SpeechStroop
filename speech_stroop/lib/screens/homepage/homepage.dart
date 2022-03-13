import 'package:flutter/material.dart';
import 'package:speech_stroop/screens/auth/register2.dart';
import 'package:speech_stroop/screens/auth/register_stress.dart';
import 'package:speech_stroop/screens/components/appbar.dart';
import 'package:speech_stroop/screens/components/button/next_button.dart';
import 'package:speech_stroop/screens/components/button/primary_button.dart';

Map registerReq = {};

class MainWidget extends StatefulWidget {
  const MainWidget({Key key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        PrimaryButton("เริ่มทดสอบ", () => {print(1)})
      ],
    )));
  }
}
