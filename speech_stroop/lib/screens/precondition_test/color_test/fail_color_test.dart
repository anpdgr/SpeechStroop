import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/components/appbar.dart';
import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/screens/precondition_test/color_test/color_test.dart';

class FailColorTestScreen extends StatefulWidget {
  const FailColorTestScreen({Key key}) : super(key: key);
  static String routeName = "/precondition_fail_color";
  @override
  _FailColorTestState createState() => _FailColorTestState();
}

class _FailColorTestState extends State<FailColorTestScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFFBFBFF),
        appBar: AppBarBack('ไม่ผ่านการทดสอบการจำแนกสี'),
        body: Column(
          children: [
            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0, 1),
                child: Image.asset(
                  'assets/images/precondition-failed.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.55,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 80),
              child: PrimaryButton('ทดสอบอีกครั้ง', () {
                Navigator.pushNamed(context, ColorTestScreen.routeName);
              }),
            )
          ],
        ));
  }
}
