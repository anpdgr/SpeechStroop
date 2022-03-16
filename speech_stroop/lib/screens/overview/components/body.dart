import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/screens/auth/login.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF5F5F5),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => {
          Navigator.pushNamed(context, LoginScreen.routeName),
        },
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                  child: Text(
                    'Speech Stroop',
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                child: Text(
                  '    แอปพลิเคชันนี้สร้างขึ้นเพื่อทดสอบและบ่งชี้ถึงประสิทธิภาพการทำงานของสมองในผู้สูงอายุ เพื่อนำไปเก็บเป็นข้อมูลสถิติภายในประเทศไทย ด้วยแบบทดสอบ Stroop ในรูปแบบเสียง ซึ่งมีความเกี่ยวข้องกับความจำและการตัดสินใจของผู้ทดสอบ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    letterSpacing: 0.5,
                    height: 2.3,
                    color: Color(0xFF37265F),
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0, 1),
                  child: Image.asset(
                    'assets/images/overview-pink.png',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.55,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
