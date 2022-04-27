import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/components/button/mic_button.dart';
import 'package:speech_stroop/components/microphone_test/fail_microphone_test.dart';
import 'package:speech_stroop/screens/auth/register.dart';
import 'package:speech_stroop/screens/precondition_test/reading_test/fail_reading_test.dart';
import 'package:speech_stroop/screens/precondition_test/reading_test/pass_reading_test.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../../components/appbar.dart';
import '../../../utils/speech_lib.dart';

class ReadingTestScreen extends StatefulWidget {
  const ReadingTestScreen({Key key}) : super(key: key);
  static String routeName = "/precondition_reading_test";

  @override
  _ReadingTestScreenState createState() => _ReadingTestScreenState();
}

class _ReadingTestScreenState extends State<ReadingTestScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  stt.SpeechToText speech;

  bool isListening = false;
  String text = '';
  double confidence = 1.0;
  int answered = 0;
  List textArr;
  bool isCorrect = false;
  List<SpeechRecognitionWords> valAlternates;
  int score = 0;

  @override
  void initState() {
    super.initState();
    speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      appBar: const CustomAppBar('การทดสอบการอ่าน'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MicButton(isListening, listen),
      key: scaffoldKey,
      backgroundColor: const Color(0xFFFBFBFF),
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
                    child: Text(
                      '${answered + 1}/7',
                      style: const TextStyle(
                        color: Color(0xFF8F8F8F),
                        fontSize: 36,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Align(
                      // alignment: const AlignmentDirectional(0, 0),
                      alignment: Alignment.center,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text(colorsMapDefault.keys.toList()[answered],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold)),
                        ),
                      )),
                  Text(text)
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
            onResult: onResultListen, localeId: 'th-TH', partialResults: true);
      }
    } else {
      setState(() {
        isListening = false;
      });
      Future.delayed(const Duration(milliseconds: 800), () {
        speech.stop();
      });
      navigatePage();
    }
  }

  Future<void> onResultListen(val) async {
    valAlternates = val.alternates;
    if (isAnswerCorrect()) {
      setState(() {
        text = 'Correct!';
      });
    } else {
      setState(() {
        text = '';
      });
    }
  }

  bool isAnswerCorrect() {
    for (var predictedResult in valAlternates) {
      var predictedWord = predictedResult.recognizedWords;
      if (predictedWord == colorsMapDefault.keys.toList()[answered]) {
        isCorrect = true;
        return isCorrect;
      } else {
        isCorrect = false;
      }
    }
    return false;
  }

  void navigatePage() {
    isCorrect ? score++ : null;
    isCorrect = false;
    if (answered < 6) {
      Future.delayed(const Duration(milliseconds: 800), () {
        setState(() {
          text = '';
          answered++;
        });
      });
    } else {
      if (score < 7) {
        Navigator.pushNamed(context, FailReadingTestScreen.routeName);
      } else {
        precondition.readingAbilityTest.score = score;
        precondition.readingAbilityTest.date = DateTime.now();
        Navigator.pushNamed(context, PassReadingTestScreen.routeName);
      }
    }
  }
}
