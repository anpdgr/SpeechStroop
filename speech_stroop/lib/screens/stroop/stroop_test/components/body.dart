import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/model/test%20module/history.dart';
import 'package:speech_stroop/model/test%20module/question.dart';
import 'package:speech_stroop/screens/auth/login.dart';
import 'package:speech_stroop/screens/stroop/healthRating/break_screen.dart';
import 'package:speech_stroop/utils/speech_lib.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:tuple/tuple.dart';
import 'package:speech_stroop/screens/stroop/stroop_test/stroop_test.dart';
import 'dart:math';

int sectionNumber = 0;
int QUESTIONS_AMOUNT = 20;
List<Tuple3<String, Color, String>> testTemplate = [];

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  stt.SpeechToText speech;

  bool isListening = false;
  String text = '';
  List textArr;

  @override
  void initState() {
    super.initState();
    speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor:
          answered >= 0 ? const Color(0xFFF5F5F5) : const Color(0xFF6750A4),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: answered >= 0
                        ? Text(
                            testTemplate[answered].item1,
                            style: TextStyle(
                              color: testTemplate[answered].item2,
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          )
                        : ElevatedButton(
                            onPressed: () {
                              if (answered < 0) {
                                buildTest();
                                navigatePage();
                                listen();
                              }
                            },
                            child: const Text('แตะเพื่อเริ่ม'),
                          ),
                  ),
                ),
                Text(text)
              ],
            ),
          ],
        ),
      ),
    );
  }

  void buildTest() {
    print('answered' + answered.toString());
    Random rn = Random();
    int idxName = 0, idxCode = 0, congruent = 0, incongruent = 0;
    List colorsCodeNoName = [];
    Tuple3<String, Color, String> questionTemplate;
    Question question;
    testTemplate = <Tuple3<String, Color, String>>[];

    switch (sectionNumber) {
      case 1:
        congruent = 14;
        incongruent = 6;
        break;
      case 2:
        congruent = 10;
        incongruent = 10;
        break;
      case 3:
        congruent = 6;
        incongruent = 14;
        break;
      default:
    }

    String condition;
    String expectedAnswer;
    for (var i = 0; i < congruent; i++) {
      condition = "congruent";
      idxName = rn.nextInt(colorsName.length);
      expectedAnswer = colorsName[idxName];
      questionTemplate =
          Tuple3(colorsName[idxName], colorsCode[idxName], condition);

      question = Question(
          i + 1,
          {"color": expectedAnswer, "word": colorsName[idxName]},
          condition,
          expectedAnswer,
          null,
          null,
          null,
          null);
      questions.add(question);

      testTemplate.add(questionTemplate);
    }
    for (var i = 0; i < incongruent; i++) {
      condition = "incongruent";
      idxName = rn.nextInt(colorsName.length);
      colorsCodeNoName = colorsCode
          .where((c) => c != colorsMapDefault[colorsName[idxName]])
          .toList();

      idxCode = rn.nextInt(colorsCodeNoName.length);
      var colorNameNoName = colorsMapDefault.keys
          .firstWhere((k) => colorsMapDefault[k] == colorsCodeNoName[idxCode]);

      expectedAnswer = colorNameNoName;
      questionTemplate =
          Tuple3(colorsName[idxName], colorsCodeNoName[idxCode], condition);

      question = Question(
          i + 1,
          {"color": expectedAnswer, "word": colorsName[idxName]},
          condition,
          expectedAnswer,
          null,
          null,
          null,
          null);
      questions.add(question);

      isQuestionExist(questionTemplate, testTemplate)
          ? (i--)
          : testTemplate.add(questionTemplate);
    }

    //TODO: avoid same element being next to each other
    testTemplate.shuffle();

    print(testTemplate.toString() + (testTemplate.length).toString());
  }

  bool isQuestionExist(question, testTemplate) {
    for (var elem in testTemplate) {
      if (question == elem) {
        return true;
      }
    }
    return false;
  }

  void listen() async {
    if (!isListening) {
      bool available = await speech.initialize(
          // onStatus: (val) => print('onStatus: $val'),
          // onError: (val) => print('onError: $val'),
          );
      if (available) {
        setState(() => isListening = true);
        speech.listen(
          onResult: onResultListen,
          localeId: 'th-TH',
          partialResults: true,
        );
        //listenFor: const Duration(seconds: 23));
      }
    }
  }

  Future<void> onResultListen(val) async {
    valAlternates = val.alternates;
    if (isAnswerCorrect()) {
      setState(() {
        text = 'Correct!';
        scorePerQuestion++;
      });
    } else {
      setState(() {
        text = '';
      });
    }
  }

  void navigatePage() {
    print('answered' + answered.toString());
    if (answered < QUESTIONS_AMOUNT - 1) {
      //every section, except last Q
      var durationDelay = (answered == -1)
          ? const Duration(milliseconds: 1000)
          : const Duration(milliseconds: 30); //TODO: 3000
      Future.delayed(durationDelay, () {
        setState(() {
          scoreCounting();
          answered++;
          navigatePage();
        });
      });
    }
    if (answered == QUESTIONS_AMOUNT - 1) {
      Widget nextWidget;
      //TODO: db

      //TODO: set scores to 0

      setState(() {
        scoreCounting();

        isListening = false;
        // if (sectionNumber < 3) {
        //   //section 1-2, last Q
        //   // nextWidget = const LoginScreen();
        //   nextWidget = BreakScreen();
        // } else if (sectionNumber == ) {
        //   //section 3, last Q
        //   nextWidget = const LoginScreen();
        // }
      });

      Future.delayed(const Duration(milliseconds: 3000), () {
        speech.stop();
        Navigator.pushNamed(context, BreakScreen.routeName);
      });
    }
  }
}
