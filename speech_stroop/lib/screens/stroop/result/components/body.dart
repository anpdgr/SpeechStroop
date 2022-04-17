import 'package:flutter/material.dart';
import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/enums.dart';
import 'package:speech_stroop/model/test_module/history.dart';
import 'package:speech_stroop/screens/home/home_screen.dart';
import 'package:speech_stroop/theme.dart';

class Body extends StatefulWidget {
  Body(this.latestTest, {Key key}) : super(key: key);
  History latestTest;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  History latestTest;
  @override
  void initState() {
    latestTest = widget.latestTest;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
            child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              '${latestTest.totalScore}',
              style: textTheme().bodyLarge,
            ),
            PrimaryButton(
                "เข้าสู่หน้าหลัก",
                () => Navigator.pushNamed(context, HomeScreen.routeName),
                ButtonType.medium)
          ],
        )));
  }
}
