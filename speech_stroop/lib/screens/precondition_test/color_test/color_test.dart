import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/model/precondition.dart';
import 'package:speech_stroop/model/update_user.dart';
import 'package:speech_stroop/model/user.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'package:speech_stroop/screens/auth/register.dart';
import 'package:speech_stroop/screens/precondition_test/color_test/fail_color_test.dart';
import 'package:speech_stroop/screens/precondition_test/color_test/pass_color_test.dart';

import 'package:speech_stroop/components/appbar.dart';
import 'package:speech_stroop/components/microphone_test/fail_microphone_test.dart';
import 'package:speech_stroop/components/button/mic_button.dart';

import 'package:speech_stroop/theme.dart';
import '../../stroop/stroop_test/stroopHelper/speech_check.dart';

class ColorTestScreen extends StatefulWidget {
  const ColorTestScreen({Key key}) : super(key: key);
  static String routeName = "/precondition_color_test";

  @override
  _ColorTestScreenState createState() => _ColorTestScreenState();
}

class _ColorTestScreenState extends State<ColorTestScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  stt.SpeechToText speech;

  bool isListening = false;
  int answeredColorTest = 0;
  int score = 0;

  bool isInterval = false;
  String feedback = '';
  String feedbackImg = '';
  // String correctAnswerText = '';
  String recogWordColorTest = '';
  Color stroopBackgroundColor;
  Color problemColor = stroopColorsMap.values.toList()[0];

  void setBackgroundColor() {
    if (answeredColorTest >= 0) {
      switch (feedback) {
        case '':
          stroopBackgroundColor = const Color(0xFFF5F5F5);
          break;
        case 'ถูกต้อง':
          stroopBackgroundColor = const Color(0xFF6FC2A0);
          break;
        case 'ผิด':
          stroopBackgroundColor = const Color(0xFFDA4F2C);
          break;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    setBackgroundColor();
    speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      appBar: isInterval ? null : const CustomAppBar('การทดสอบการจำแนกสี'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: isInterval ? null : MicButton(isListening, listen),
      key: scaffoldKey,
      backgroundColor: stroopBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child: isInterval
                        ? null
                        : Text(
                            '${answeredColorTest + 1}/7',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: problemColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  feedback != ''
                      ? Image.asset(
                          feedbackImg,
                          width: 100,
                          height: 100,
                        )
                      : Text(feedbackImg),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    feedback,
                    style: textTheme().headlineSmall.apply(color: Colors.white),
                  ),
                  // Text(
                  //   correctAnswerText,
                  //   style: textTheme().headlineMedium,
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void listen() async {
    if (!isListening) {
      bool available = await speech.initialize(
          // onStatus: (val) => print('onStatus: $val'),
          onError: (val) => {
                Navigator.pushNamed(
                    context, FailMicrophoneTestScreen.routeName),
                print('onError: $val'),
              });
      if (available) {
        setState(() => isListening = true);
        speech.listen(
            onResult: (val) => setState(() {
                  recogWordColorTest = val.recognizedWords;
                }),
            localeId: 'th-TH',
            partialResults: true);
      }
    } else {
      setState(() {
        isListening = false;
      });
      speech.stop();
      navigatePage();
    }
  }

  void resetQuestion() {
    problemColor = stroopBackgroundColor;
  }

  void setNextQuestionValue() {
    recogWordColorTest = '';
    // correctAnswerText = '';
    feedback = '';
    feedbackImg = '';
    answeredColorTest++;
    problemColor = stroopColorsMap.values.toList()[answeredColorTest];
  }

  void checkAnswer() {
    if (answeredColorTest >= 0) {
      // check answer
      String correctAnswer = stroopColorsMap.keys.toList()[answeredColorTest];
      // correctAnswerText = 'เฉลย: $correctAnswer';

      // correct answer
      if (recogWordColorTest == correctAnswer) {
        setState(() {
          score++;
          feedback = 'ถูกต้อง';
          feedbackImg = 'assets/images/correct.png';
          setBackgroundColor();
        });
      }

      // wrong answer
      else {
        setState(() {
          feedback = 'ผิด';
          feedbackImg = 'assets/images/wrong.png';
          setBackgroundColor();
        });
      }
    }
    isInterval = true;
  }

  void navigatePage() {
    var durationDelayInterval = (answeredColorTest == -1)
        ? const Duration(milliseconds: 0)
        : const Duration(milliseconds: 1500);

    checkAnswer();
    resetQuestion();

    if (answeredColorTest < 6) {
      Future.delayed(durationDelayInterval, () {
        setState(() {
          isInterval = false;
          setNextQuestionValue();
          setBackgroundColor();
        });
      });
    } else {
      Future.delayed(durationDelayInterval, () {
        if (score < 7) {
          Navigator.pushNamed(context, FailColorTestScreen.routeName);
        } else {
          setPreconditionScore(score);
          Navigator.pushNamed(context, PassColorTestScreen.routeName);
        }
      });
    }
  }

  setPreconditionScore(int score) async {
    if (userProfile != null) {
      PreconditionScore updatedColorAbilityTest =
          PreconditionScore(score, DateTime.now());
      Precondition update = Precondition(
          userProfile.precondition.isColorBlind,
          updatedColorAbilityTest,
          userProfile.precondition.readingAbilityTest,
          userProfile.precondition.isPassAll);

      await updateUserPrecondition(update);
    } else {
      precondition.colorVisibilityTest.score = score;
      precondition.colorVisibilityTest.date = DateTime.now();
    }
  }
}
