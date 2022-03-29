import 'package:flutter/material.dart';
import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/components/button/secondary_button.dart';
import 'package:speech_stroop/components/home_screen_appbar.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/enums.dart';
import 'package:speech_stroop/model/user.dart';
import 'package:speech_stroop/screens/stroop/healthRating/break_screen.dart';

var bestScore = 58;
var recentScore = 44;
var userName = "มะลิ";

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

bool wantTutorial = false;

class _BodyState extends State<Body> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeScreenAppBar('Speech Stroop', false),
        body: Center(
            child: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: (Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    showSimpleModalDialogAboutUs(context);
                  },
                  icon: const Icon(
                    Icons.info,
                    color: Color(0xFFC4C4C4),
                  ),
                  iconSize: 37.0,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.topLeft,
                child: Text(
                  'สวัสดี, คุณ${userProfile.name} 👋',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryColor),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(40),
                      margin: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/score_best.png'),
                          Text(
                            bestScore.toString(),
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 64.0,
                            ),
                          ),
                          Text(
                            "คะแนนสูงสุด",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryColor),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(40),
                      margin: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/score_recent.png'),
                          Text(
                            recentScore.toString(),
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 64.0,
                            ),
                          ),
                          Text(
                            "คะแนนล่าสุด",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              PrimaryButton(
                "เริ่มทดสอบ",
                () => {showSimpleModalDialogTutorial(context)},
                ButtonType.medium,
              ),
              SecondaryButton(
                "วิธีการทดสอบ",
                () => {print("tutorial")},
                ButtonType.medium,
              )
            ],
          )),
        )));
  }

  showSimpleModalDialogTutorial(context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return const Color(0xFFEB8D8D);
      }
      return const Color(0xFF525252);
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 300),
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
                        child: Text('คุณต้องการดูวิธีการทดสอบหรือไม่',
                            style: Theme.of(context).textTheme.titleMedium)),
                    Container(
                      alignment: Alignment.center,
                      child: Column(children: [
                        PrimaryButton("ต้องการ", () => {print('save')}),
                        SecondaryButton(
                            "ไม่ต้องการ",
                            () => Navigator.pushNamed(
                                context, BreakScreen.routeName))
                      ]),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          value: wantTutorial,
                          onChanged: (bool value) {
                            setState(() {
                              wantTutorial = value;
                            });
                          },
                        ),
                        Flexible(
                          child: Text("ไม่ต้องแสดงอีก",
                              style: Theme.of(context).textTheme.labelMedium),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  showSimpleModalDialogAboutUs(context) {
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
                      child: (Text('เกี่ยวกับเรา',
                          style: Theme.of(context).textTheme.headlineMedium)),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 4),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            text:
                                "    แอปพลิเคชัน Speech Stroop สร้างขึ้นเพื่อทดสอบและบ่งชี้ถึงประสิทธิภาพการทำงานของสมองในผู้สูงอายุ ด้วยแบบทดสอบ Stroop ในรูปแบบเสียง ซึ่งเป็นการทดสอบที่มีความเกี่ยวข้องกับความจำและการตัดสินใจของผู้ทดสอบ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                .apply(color: Colors.black)),
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
