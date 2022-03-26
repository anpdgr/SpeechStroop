import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/components/appbar.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/screens/precondition_test/color_test/fail_color_test.dart';
import 'package:speech_stroop/screens/precondition_test/color_test/pass_color_test.dart';
import 'package:speech_stroop/screens/precondition_test/components/mic_button.dart';
import 'package:speech_stroop/theme.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
// import '../providers/speech_lib.dart';
import 'package:speech_stroop/constants.dart';

import '../../auth/login.dart';
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

  // List<Widget> micButton() {
  //   if (isListening) {
  //     return <Widget>[const Icon(Icons.mic, size: 100), Text("กดเพื่อหยุด")];
  //   } else {
  //     return <Widget>[
  //       const Icon(Icons.mic_none, size: 100),
  //       Text("กดเพื่อพูด")
  //     ];
  //   }
  // }

  @override
  void initState() {
    super.initState();
    speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      appBar: AppBarBack('การทดสอบการจำแนกสี'),
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
        // text = '';
      });
      Future.delayed(const Duration(milliseconds: 800), () {
        speech.stop();
      });
      navigatePage();
    }
  }

  Future<void> onResultListen(val) async {
    // text = val.recognizedWords;
    valAlternates = val.alternates;
    // if (val.hasConfidenceRating && val.confidence > 0) {
    //   confidence = val.confidence;
    // }
    if (isAnswerCorrect()) {
      setState(() {
        text = 'Correct!';
        score++;
      });
      print(text);
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
        Navigator.pushNamed(context, PassColorTestScreen.routeName);
      }
    }
  }
}
