import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/components/appbar.dart';
import 'package:speech_stroop/components/button/floating_button.dart';
import 'package:speech_stroop/screens/stroop/tutorial/components/example_box.dart';
import 'package:speech_stroop/screens/stroop/tutorial/introduction/tutorial_intro2.dart';
import 'package:speech_stroop/theme.dart';

class TutorialIntroduction1Screen extends StatefulWidget {
  const TutorialIntroduction1Screen({Key key}) : super(key: key);
  static String routeName = "/tutorial_introduction_1";
  @override
  _TutorialIntroduction1State createState() => _TutorialIntroduction1State();
}

class _TutorialIntroduction1State extends State<TutorialIntroduction1Screen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFFBFBFF),
        appBar: const CustomAppBar('วิธีการทดสอบ', true),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'พูดชื่อสีของตัวอักษร',
                style: textTheme().titleMedium.apply(
                    color: Colors.black, fontWeightDelta: 1, fontSizeDelta: 2),
                textAlign: TextAlign.center,
              ),
              Text(
                '(ไม่ใช่อ่านคำที่ปรากฏ)',
                style: textTheme().titleMedium.apply(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              Text(
                'โดยไม่ต้องพูดคำว่า ‘สี’ ออกมา',
                style: textTheme()
                    .titleMedium
                    .apply(color: Colors.red[700], fontSizeDelta: 2),
                textAlign: TextAlign.center,
              ),
              Wrap(
                direction: Axis.vertical,
                spacing: 25,
                children: [
                  ExampleBox('ฟ้า', 'ฟ้า'),
                  ExampleBox('แดง', 'เขียว'),
                  ExampleBox('เขียว', 'เหลือง'),
                ],
              ),
              FloatingButton(() {
                Navigator.pushNamed(
                    context, TutorialIntroduction2Screen.routeName);
              }, false),
            ],
          ),
        ));
  }
}
