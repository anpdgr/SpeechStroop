import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/components/button/mic_button.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/model/test_module/question.dart';
import 'package:speech_stroop/screens/stroop/healthRating/break_screen.dart';
import 'package:speech_stroop/utils/speech_lib.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:tuple/tuple.dart';
import 'package:speech_stroop/screens/stroop/stroop_test/stroop_test.dart';
import 'dart:math';
import 'dart:core';
import 'package:animated_text_kit/animated_text_kit.dart';

int sectionNumber = 0;
int level = 0;
List<int> prevLevel = [];
int QUESTIONS_AMOUNT = 20;
List<Tuple3<String, Color, String>> testTemplate;
Stopwatch stopwatchRT = Stopwatch();
Stopwatch stopwatchAudio = Stopwatch();

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  stt.SpeechToText speech;

  bool isListening = false;
  String text = 'w';
  List textArr;
  String problem = '';
  Color problemColor = backgroundColor;

  @override
  void initState() {
    super.initState();
    speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          answered >= 0 ? MicButton(isListening, () => {}, true) : null,
      key: scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: answered >= 0
                    ? [const Color(0xFFF5F5F5), const Color(0xFFF5F5F5)]
                    : [const Color(0xff503B7F), const Color(0xffEB8D8D)])),
        child: SafeArea(
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
                    child: Center(
                        child: answered >= 0
                            ? Text(
                                problem,
                                style: TextStyle(
                                  color: problemColor,
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              )
                            : AnimatedTextKit(
                                pause: const Duration(milliseconds: 150),
                                isRepeatingAnimation: false,
                                animatedTexts: [
                                  ScaleAnimatedText('3',
                                      textStyle: const TextStyle(
                                          fontSize: 144,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                      duration:
                                          const Duration(milliseconds: 1500)),
                                  ScaleAnimatedText('2',
                                      textStyle: const TextStyle(
                                          fontSize: 144,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                      duration:
                                          const Duration(milliseconds: 1500)),
                                  ScaleAnimatedText('1',
                                      textStyle: const TextStyle(
                                          fontSize: 144,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                      duration:
                                          const Duration(milliseconds: 1500)),
                                ],
                                onFinished: () {
                                  buildTest();
                                  stopwatchAudio.reset();
                                  stopwatchAudio.start();
                                  //TODO: record audio
                                  navigatePage();
                                },
                              )),
                  ),
                  Text(text)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void buildTest() {
    Random rn = Random();
    int idxName = 0, idxCode = 0, congruent = 0, incongruent = 0;
    List colorsCodeNoName = [];
    Tuple3<String, Color, String> questionTemplate;

    testTemplate = [];
    questions = [];

    // random level
    do {
      level = rn.nextInt(4);
    } while (prevLevel.contains(level) || level == 0);
    prevLevel.add(level);
    if (sectionNumber == 3) {
      prevLevel.clear();
    }

    switch (level) {
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

    // Congruent
    for (var i = 0; i < congruent; i++) {
      condition = "congruent";
      // random index for WORD
      idxName = rn.nextInt(colorsName.length);
      // get WORD and COLOR code
      String colorWord = colorsName[idxName];
      Color colorCode = colorsCode[idxName];

      questionTemplate = Tuple3(colorWord, colorCode, condition);
      testTemplate.add(questionTemplate);
    }

    // Incongruent
    for (var i = 0; i < incongruent; i++) {
      condition = "incongruent";
      // random index for WORD
      idxName = rn.nextInt(colorsName.length);
      // get WORD
      String colorWord = colorsName[idxName];
      // build list of color without WORD (only for incongruent)
      colorsCodeNoName = colorsCode
          .where((code) => code != colorsMapDefault[colorsName[idxName]])
          .toList();

      // random index for COLOR code
      idxCode = rn.nextInt(colorsCodeNoName.length);
      // get COLOR code
      Color colorCode = colorsCodeNoName[idxCode];

      questionTemplate = Tuple3(colorWord, colorCode, condition);
      isQuestionExist(questionTemplate, testTemplate)
          ? (i--)
          : testTemplate.add(questionTemplate);
    }

    //TODO: avoid same element being next to each other
    testTemplate.shuffle();

    var i = 0;
    testTemplate.forEach((q) {
      i++;
      int displayColorCodeIdx = colorsCode.indexOf(q.item2);
      String displayColor = colorsName[displayColorCodeIdx];
      String displayWord = q.item1;
      questions.add(Question(i, {"color": displayColor, "word": displayWord},
          q.item3, displayColor, null, null, null, null));
    });
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
      }
    }
  }

  Future<void> onResultListen(val) async {
    stopwatchRT.stop();
    // check if answerAt and reactionTimeMs exists for avoiding override

    if (answered >= 0 &&
        questions[answered].answerAt == null &&
        questions[answered].reactionTimeMs == null) {
      questions[answered].answerAt = stopwatchAudio.elapsedMilliseconds;
      questions[answered].reactionTimeMs = stopwatchRT.elapsedMilliseconds;
    }

    valAlternates = val.alternates;
    if (isAnswerCorrect()) {
      setState(() {
        if (text == 'w' || text == 'Wrong!') {
          text = 'Correct!';
          print(text);
        }
        scorePerQuestion++;
      });
    } else {
      setState(() {
        if (text == 'w' || text == 'Correct!') {
          text = 'Wrong!';
        }
        ;
      });
    }
  }

  void navigatePage() {
    if (answered < QUESTIONS_AMOUNT - 1) {
      //every section, except last Q
      var durationDelay = (answered == -1)
          ? const Duration(milliseconds: 500)
          : const Duration(milliseconds: 3000); //TODO: 3000
      var durationDelayInterval = (answered == -1)
          ? const Duration(milliseconds: 0)
          : const Duration(milliseconds: 1000); //TODO: 3000

      Future.delayed(durationDelay, () {
        setState(() {
          scoreCounting();
          text = '';
          problem = '';
          problemColor = backgroundColor;
          speech.stop();
          isListening = false;
          stopwatchRT.reset();
        });

        Future.delayed(durationDelayInterval, () {
          setState(() {
            text = 'w';
            answered++; //เปลี่ยนข้อ
            problem = testTemplate[answered].item1;
            problemColor = testTemplate[answered].item2;
          });
          if (answered >= 0) {
            questions[answered].startAt = stopwatchAudio.elapsedMilliseconds;
          }
          listen();
          stopwatchRT.start();
          navigatePage();
        });
      });
    }
    if (answered == QUESTIONS_AMOUNT - 1) {
      Widget nextWidget;
      scoreCounting();
      Future.delayed(const Duration(milliseconds: 3000), () {
        stopwatchAudio.stop();
        speech.stop();
        setState(() {
          isListening = false;
        });
        Navigator.pushNamed(context, BreakScreen.routeName);
      });
    }
  }
}
