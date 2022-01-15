import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'login.dart';
import '../utils/speech_lib.dart';

class StroopTestWidget extends StatefulWidget {
  const StroopTestWidget({Key key}) : super(key: key);

  @override
  _StroopTestWidgetState createState() => _StroopTestWidgetState();
}

class _StroopTestWidgetState extends State<StroopTestWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  stt.SpeechToText speech;

  bool isListening = false;
  String text = '';
  // int answered = -1;
  List textArr;
  // bool isCorrect = false;
  // // int score = 0;
  // // int scoreOne = 0;
  // List<SpeechRecognitionWords> valAlternates;

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
          children: [
            GestureDetector(
              onTap: () {
                if (answered < 0) {
                  navigatePage();
                  listen();
                }
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                        // alignment: const AlignmentDirectional(0, 0),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 100, 0, 0),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: answered >= 0
                                ? Text(colorsMap.keys.toList()[answered],
                                    style: TextStyle(
                                        color:
                                            colorsMap.values.toList()[answered],
                                        fontSize: 70,
                                        fontWeight: FontWeight.bold))
                                : const Text('แตะเพื่อเริ่ม',
                                    style: TextStyle(
                                      color: Color(0xFFF5F5F5),
                                      fontSize: 65,
                                      // fontWeight: FontWeight.bold
                                    )),
                          ),
                        )),
                    Text(text)
                  ],
                ),
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
        scoreOne++;
      });
    } else {
      setState(() {
        text = '';
      });
    }
  }

  void navigatePage() {
    if (answered < 6) {
      var durationDelay = (answered == -1)
          ? const Duration(milliseconds: 1000)
          : const Duration(milliseconds: 3000);
      Future.delayed(durationDelay, () {
        setState(() {
          answered++;
          scoreCounting();
          navigatePage();
        });
      });
    } else {
      setState(() {
        isListening = false;
      });
      Future.delayed(const Duration(milliseconds: 3000), () {
        speech.stop();
        scoreCounting();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginWidget()));
      });
    }
  }
}
