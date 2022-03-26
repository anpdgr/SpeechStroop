import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/components/appbar.dart';
import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/screens/precondition_test/components/precon_box.dart';
import 'package:speech_stroop/screens/precondition_test/microphone_test/microphone_test.dart';
import 'package:speech_stroop/theme.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key key}) : super(key: key);
  static String routeName = "/precondition_introduction";
  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<IntroductionScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFFBFBFF),
        appBar: CustomAppBar('เตรียมความพร้อมก่อนทดสอบ'),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text(
                'แบบทดสอบนี้ทำขึ้นเพื่อให้มั่นใจว่าคุณสามารถที่จะทำแบบทดสอบ Stroop test ได้อย่างไม่มีเงื่อนไขใด ๆ โดยเป็นการทำเพียงครั้งเดียวหลังการสมัครสมาชิก  หากต้องการทำแบบทดสอบอีกครั้งสามารถเลือกทำได้ในหน้าโปรไฟล์',
                style: textTheme().bodyLarge.apply(color: Colors.black),
              ),
              const SizedBox(height: 50),
              Wrap(
                direction: Axis.vertical,
                spacing: 25,
                children: [
                  PreconBox('ทดสอบไมโครโฟน'),
                  PreconBox('ทดสอบทักษะการจำแนกสี'),
                  PreconBox('ทดสอบทักษะการอ่าน')
                ],
              ),
              const SizedBox(height: 50),
              PrimaryButton('เริ่มการเตรียมความพร้อม', () {
                Navigator.pushNamed(context, MicrophoneTestScreen.routeName);
              })
            ],
          ),
        ));
  }
}
