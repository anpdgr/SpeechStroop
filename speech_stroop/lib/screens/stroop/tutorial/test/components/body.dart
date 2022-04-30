import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/components/button/mic_button.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/screens/stroop/tutorial/done_screen.dart';
import 'package:speech_stroop/theme.dart';
import 'package:speech_stroop/utils/loggger.dart';
import 'package:speech_stroop/utils/speech_lib.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:tuple/tuple.dart';
import 'package:speech_stroop/screens/stroop/stroop_test/stroop_test.dart';
import 'dart:math';
import 'dart:core';
import 'package:animated_text_kit/animated_text_kit.dart';

List<Tuple3<String, Color, String>> testTemplateTutorial;
int answeredTutorial = -1;

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  stt.SpeechToText speech;

  bool isListening = false;
  String correctAnswerText = '';
  String feedback = '';
  String feedbackImg = '';
  List textArr;
  String problem = '';
  Color problemColor = backgroundColor;
  List<Color> stroopBackgroundColor;

  @override
  void initState() {
    super.initState();
    setBackgroundColor();
    speech = stt.SpeechToText();
  }

  void setBackgroundColor() {
    if (answeredTutorial >= 0) {
      switch (feedback) {
        case '':
          stroopBackgroundColor = [
            const Color(0xFFF5F5F5),
            const Color(0xFFF5F5F5)
          ];
          break;
        case 'ถูกต้อง':
          stroopBackgroundColor = [
            const Color(0xFF6FC2A0),
            const Color(0xFF6FC2A0)
          ];
          break;
        case 'ผิด':
          stroopBackgroundColor = [
            const Color(0xFFDA4F2C),
            const Color(0xFFDA4F2C)
          ];
          break;
      }
    } else {
      stroopBackgroundColor = [
        const Color(0xff503B7F),
        const Color(0xffEB8D8D)
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: answeredTutorial >= 0 && isListening == true
          ? MicButton(isListening, () => {}, true)
          : null,
      key: scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: stroopBackgroundColor)),
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
                        child: answeredTutorial >= 0
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
                                  navigatePage();
                                },
                              )),
                  ),
                  feedback != ''
                      ? Image.asset(
                          feedbackImg,
                          width: 100,
                          height: 100,
                        )
                      : Text(feedbackImg),
                  Text(feedback, style: textTheme().headlineSmall,),
                  Text(
                    correctAnswerText,
                    style: textTheme().headlineMedium,
                  )
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

    testTemplateTutorial = [];
    questions = [];

    congruent = 2;
    incongruent = 3;

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
      testTemplateTutorial.add(questionTemplate);
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
      isQuestionExist(questionTemplate, testTemplateTutorial)
          ? (i--)
          : testTemplateTutorial.add(questionTemplate);
    }

    //TODO: avoid same element being next to each other
    testTemplateTutorial.shuffle();
  }

  bool isQuestionExist(question, testTemplateTutorial) {
    for (var elem in testTemplateTutorial) {
      if (question == elem) {
        return true;
      }
    }
    return false;
  }

  Future<void> listen() async {
    if (!isListening) {
      bool available = await speech.initialize(
          // onStatus: (val) => print('onStatus: $val'),
          // onError: (val) => print('onError: $val'),
          );
      if (available) {
        setState(() => isListening = true);
        speech.listen(
          onResult: (val) => setState(() {
            recogWord = val.recognizedWords;
          }),
          localeId: 'th-TH',
          partialResults: true,
        );
      }
    }
  }

  void resetQuestion() {
    problem = '';
    problemColor = backgroundColor;
  }

  void setNextQuestionValue() {
    recogWord = '';
    correctAnswerText = '';
    feedback = '';
    feedbackImg = '';
    answeredTutorial++;
    problem = testTemplateTutorial[answeredTutorial].item1;
    problemColor = testTemplateTutorial[answeredTutorial].item2;
  }

  void startNextQuestion() {
    listen();
    navigatePage();
  }

  void checkAnswer() {
    bool isCorrect = false;
    if (answeredTutorial >= 0) {
      // check answer
      String correctAnswer = colorsMapDefault.keys.firstWhere(
          (k) =>
              colorsMapDefault[k] ==
              testTemplateTutorial[answeredTutorial].item2,
          orElse: () => '');
      correctAnswerText = 'เฉลย: $correctAnswer';

      // correct answer
      if (recogWord == correctAnswer) {
        setState(() {
          isCorrect = true;
          feedback = 'ถูกต้อง';
          feedbackImg = 'assets/images/correct.png';
          setBackgroundColor();
        });
      }

      // wrong answer
      else {
        setState(() {
          isCorrect = false;
          feedback = 'ผิด';
          feedbackImg = 'assets/images/wrong.png';
          setBackgroundColor();
        });
      }

      loggerNoStack.d(
        {
          'answeredTutorial': answeredTutorial,
          'feedback': feedback,
          'recogWord': recogWord,
          'correctAnswer': correctAnswer
        },
      );
    }
  }

  void navigatePage() {
    var durationDelay = (answeredTutorial == -1)
        ? const Duration(milliseconds: 500)
        : Duration(milliseconds: stroopQuestionDurationMs);
    var durationDelayInterval = (answeredTutorial == -1)
        ? const Duration(milliseconds: 0)
        : Duration(milliseconds: stroopIntervalDurationMs);

    Future.delayed(durationDelay, () {
      // end of each questions
      speech.stop();
      setState(() {
        isListening = false;
      });
      checkAnswer();
      resetQuestion();
      // prepare for the next question
      if (answeredTutorial < 5 - 1) {
        Future.delayed(durationDelayInterval, () async {
          setState(() {
            setNextQuestionValue();
            setBackgroundColor();
          });
          startNextQuestion();
        });
      }
      // end of each sections
      else if (answeredTutorial == 5 - 1) {
        Future.delayed(durationDelayInterval, () async {
          Navigator.pushNamed(context, TutorialDoneScreen.routeName);
        });
      }
    });
  }
}