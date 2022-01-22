import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/providers/models/connectdb.dart';
import 'package:speech_stroop/screens/auth/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
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
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
              child: Text(
                '    แอปพลิเคชันนี้สร้างขึ้นเพื่อทดสอบและบ่งชี้ถึงประสิทธิภาพการทำงานของสมองในผู้สูงอายุ เพื่อนำไปเก็บเป็นข้อมูลสถิติภายในประเทศไทย ด้วยแบบทดสอบ Stroop ในรูปแบบเสียง ซึ่งมีความเกี่ยวข้องกับความจำและการตัดสินใจของผู้ทดสอบ',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  letterSpacing: 0.5,
                  height: 2.3,
                  color: Color(0xFF303030),
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
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
                  fit: BoxFit.fitHeight,
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
                  onPressed: () async {
                    // const user = User(
                    //   name: 'name',
                    //   age: 1,
                    //   phone: 2,
                    // );
                    // await MongoDatabase.insert(user);
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
