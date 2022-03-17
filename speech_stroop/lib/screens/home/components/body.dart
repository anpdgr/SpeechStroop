import 'package:flutter/material.dart';
import 'package:speech_stroop/components/appbar.dart';
import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/components/button/secondary_button.dart';
import 'package:speech_stroop/components/home_screen_appbar.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeScreenAppBar('Speech Stroop', false),
        body: Center(
            child: Container(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: (Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          showSimpleModalDialog(context);
                        },
                        icon: const Icon(
                          Icons.info,
                          color: Color(0xFFC4C4C4),
                        ),
                        iconSize: 37.0,
                      ),
                    ),
                    const Text('สวัสดี, คุณ 👋',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF381E73),
                          fontFamily: 'BaiJamjuree',
                        )),
                    PrimaryButton("เริ่มทดสอบ", () => {print(1)}),
                    SecondaryButton("วิธีการทดสอบ", () => {print(2)})
                  ],
                )))));
  }

  showSimpleModalDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 500),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context, false),
                        icon: const Icon(
                          Icons.close,
                          color: Color(0xFF37265F),
                        ),
                        iconSize: 30,
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: (const Text('เกี่ยวกับเรา',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 28,
                                color: Color(0xFF22005D),
                                fontFamily: 'BaiJamjuree',
                                wordSpacing: 1)))),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 4),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: const TextSpan(
                            text:
                                "    แอปพลิเคชัน Speech Stroop สร้างขึ้นเพื่อทดสอบและบ่งชี้ถึงประสิทธิภาพการทำงานของสมองในผู้สูงอายุ ด้วยแบบทดสอบ Stroop ในรูปแบบเสียง ซึ่งเป็นการทดสอบที่มีความเกี่ยวข้องกับความจำและการตัดสินใจของผู้ทดสอบ",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xFF000000),
                                fontFamily: 'BaiJamjuree',
                                wordSpacing: 1)),
                      ),
                    ),
                    Container(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          'assets/images/aboutUs.png',
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
