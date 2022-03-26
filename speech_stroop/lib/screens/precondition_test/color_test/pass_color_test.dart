import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/components/appbar.dart';
import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/screens/precondition_test/reading_test/reading_test.dart';

class PassColorTestScreen extends StatefulWidget {
  const PassColorTestScreen({Key key}) : super(key: key);
  static String routeName = "/precondition_pass_color";
  @override
  _PassColorTestState createState() => _PassColorTestState();
}

class _PassColorTestState extends State<PassColorTestScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFFBFBFF),
        appBar: CustomAppBar('ผ่านการทดสอบการจำแนกสี'),
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
                Navigator.pushNamed(context, ReadingTestScreen.routeName);
              }),
            )
          ],
        ));
  }
}
