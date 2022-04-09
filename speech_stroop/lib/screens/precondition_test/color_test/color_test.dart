import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/components/appbar.dart';
import 'package:speech_stroop/screens/auth/register.dart';
import 'package:speech_stroop/screens/precondition_test/color_test/fail_color_test.dart';
import 'package:speech_stroop/screens/precondition_test/color_test/pass_color_test.dart';
import 'package:speech_stroop/components/button/mic_button.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../../utils/speech_lib.dart';

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
  String text = '';
  double confidence = 1.0;
  int answered = 0;
  List textArr;
  bool isCorrect = false;
  int score = 0;
  List<SpeechRecognitionWords> valAlternates;

  @override
  void initState() {
    super.initState();
    speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      appBar: const CustomAppBar('การทดสอบการจำแนกสี'),
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
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: colorsMapDefault.values.toList()[answered],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
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
          // onError: (val) => print('onError: $val'),
          );
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
    if (answered < 6) {
      Future.delayed(const Duration(milliseconds: 800), () {
        setState(() {
          answered++;
        });
      });
    } else {
      // TODO: change to fail
      if (score < 7) {
        Navigator.pushNamed(context, PassColorTestScreen.routeName);
      } else {
        precondition.colorVisibilityTest.score = score;
        precondition.colorVisibilityTest.date = DateTime.now();
        Navigator.pushNamed(context, PassColorTestScreen.routeName);
      }
    }
  }
}
