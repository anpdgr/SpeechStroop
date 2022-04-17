import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/components/appbar.dart';
import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/model/auth.dart';
import 'package:speech_stroop/model/test_module/history.dart';
import 'package:speech_stroop/model/user.dart';
import 'package:speech_stroop/screens/auth/register.dart';
import 'package:speech_stroop/screens/home/home_screen.dart';
import 'package:speech_stroop/theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PassReadingTestScreen extends StatefulWidget {
  const PassReadingTestScreen({Key key}) : super(key: key);
  static String routeName = "/precondition_pass_reading";
  @override
  _PassReadingTestState createState() => _PassReadingTestState();
}

class _PassReadingTestState extends State<PassReadingTestScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFFBFBFF),
        appBar: const CustomAppBar('ผ่านการทดสอบการอ่าน'),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('ยินดีด้วย!',
                  style:
                      textTheme().displayMedium.apply(color: secondaryColor)),
            ),
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
              padding: const EdgeInsets.all(10.0),
              child:
                  Text('ลงทะเบียนเสร็จสิ้น', style: textTheme().headlineMedium),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 80),
              child: PrimaryButton('เข้าสู่หน้าหลัก', () async {
                precondition.isPassAll = true;
                registerReq.precondition = precondition;

                var res = await http.post(
                    Uri.parse("http://localhost:3000/auth/register"),
                    headers: {'Content-Type': 'application/json'},
                    body: jsonEncode(registerReq));

                //TODO: login with this user
                if (res.statusCode == 200) {
                  auth = Auth.fromJson(jsonDecode(res.body));
                  await getUserProfile();
                  await getHistory();
                  print("login success");
                  Navigator.pushNamed(context, HomeScreen.routeName);
                }

                Navigator.pushNamed(context, HomeScreen.routeName);
              }),
            )
          ],
        ));
  }
}
