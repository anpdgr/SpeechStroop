import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/screens/login.dart';
import 'package:speech_stroop/playground/testlib.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speech Stroop Application',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple, fontFamily: 'BaiJamjuree'),
      home: const OverviewWidget(),
    );
  }
}

class OverviewWidget extends StatefulWidget {
  const OverviewWidget({Key key}) : super(key: key);

  @override
  _OverviewWidgetState createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 5),
                child: Text(
                  'Speech Stroop',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    letterSpacing: 1,
                    color: Color(0xFF7364FF),
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 25, 20, 0),
              child: Text(
                '    แอปพลิเคชันนี้สร้างขึ้นเพื่อทดสอบและบ่งชี้ ถึงประสิทธิภาพการทำงานของสมองในผู้สูงอายุ\nด้วยแบบทดสอบ Stroop ในรูปแบบเสียง ซึ่งเป็นการทดสอบที่มีความเกี่ยวข้องกับความจำและการตัดสินใจของผู้ทดสอบ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  letterSpacing: 0.5,
                  height: 2.3,
                  color: Color(0xFF303030),
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0, 1),
                child: Image.asset(
                  'assets/images/Writing_a_letter-pana.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.55,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Align(
                alignment: const AlignmentDirectional(0.9, 0),
                child: TextButton(
                  child: const Text(
                    'ถัดไป >>',
                    style: TextStyle(
                      color: Color(0xFF7364FF),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginWidget()));
                  },
                ))
          ],
        ),
      ),
    );
  }
}
