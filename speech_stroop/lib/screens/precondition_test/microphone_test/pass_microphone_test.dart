import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/components/appbar.dart';
import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/screens/precondition_test/color_test/color_test.dart';

class PassMicrophoneTestScreen extends StatefulWidget {
  const PassMicrophoneTestScreen({Key key}) : super(key: key);
  static String routeName = "/precondition_pass_microphone";
  @override
  _PassMicrophoneTestState createState() => _PassMicrophoneTestState();
}

class _PassMicrophoneTestState extends State<PassMicrophoneTestScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFFBFBFF),
        appBar: CustomAppBar('ผ่านการทดสอบไมโครโฟน'),
        body: Column(
          children: [
            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0, 1),
                child: Image.asset(
                  'assets/images/precondition-passed.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.55,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 80),
              child: PrimaryButton('ทำแบบทดสอบต่อไป', () {
                Navigator.pushNamed(context, ColorTestScreen.routeName);
              }),
            )
          ],
        ));
  }
}