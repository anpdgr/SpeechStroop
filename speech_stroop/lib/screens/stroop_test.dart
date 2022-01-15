import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'login.dart';
import 'components/color_code.dart';

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
  double confidence = 1.0;
  int answered = -1;
  List textArr;
  bool isCorrect = false;
  List<SpeechRecognitionWords> valAlternates;
  // Color backgroundColor = answered == 0 ? Color(0xFFF5F5F5) : ;

  // Icon micButton() {
  //   if (isListening) {
  //     return const Icon(Icons.mic, size: 100);
  //   } else {
  //     return const Icon(Icons.mic_none, size: 100);
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
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton:
      // AvatarGlow(
      //   animate: isListening,
      //   glowColor: Colors.orangeAccent[100],
      //   endRadius: 100.0,
      //   duration: const Duration(milliseconds: 2000),
      //   repeatPauseDuration: const Duration(milliseconds: 100),
      //   repeat: true,
      //   child: SizedBox(
      //       height: 130,
      //       width: 130,
      //       child: FloatingActionButton(
      //         onPressed: () {
      //           // listen();
      //           // navigatePage();
      //         },
      //         child: micButton(),
      //         backgroundColor: Colors.orange[700],
      //       )),
      // ),
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
                            // SizedBox(
                            //   width: 200,
                            //   height: 200,
                            //   child: DecoratedBox(
                            //     decoration: BoxDecoration(
                            //       color: colorsMap.values.toList()[answered],
                            //       borderRadius: BorderRadius.circular(10),
                            //     ),
                            //   ),
                            // ),
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
    print(answered);

    if (!isListening) {
      print('if isListening');
      bool available = await speech.initialize(
          // onStatus: (val) => print('onStatus: $val'),
          // onError: (val) => print('onError: $val'),
          );
      if (available) {
        print('if available');
        setState(() => isListening = true);
        speech.listen(
            onResult: onResultListen,
            localeId: 'th-TH',
            partialResults: true,
            listenFor: const Duration(seconds: 24));
      }
    }
    // else {
    //   print('else');
    //   setState(() {
    //     isListening = false;
    //     // text = '';
    //   });
    //   Future.delayed(const Duration(milliseconds: 800), () {
    //     speech.stop();
    //   });
    //   // navigatePage();
    // }
  }

  Future<void> onResultListen(val) async {
    var textRec = val.recognizedWords;
    valAlternates = val.alternates;
    print('textRec: ' + textRec);
    // if (val.hasConfidenceRating && val.confidence > 0) {
    //   confidence = val.confidence;
    // }
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
      print(predictedWord);
      if (predictedWord == colorsMap.keys.toList()[answered]) {
        isCorrect = true;
        return isCorrect;
      } else {
        isCorrect = false;
      }
    }
    return isCorrect;
  }

  void navigatePage() {
    print(answered);
    if (answered < 6) {
      Future.delayed(const Duration(milliseconds: 3000), () {
        setState(() {
          answered++;
          navigatePage();
        });
      });
    } else {
      setState(() {
        isListening = false;
      });
      Future.delayed(const Duration(milliseconds: 800), () {
        speech.stop();
      });
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginWidget()));
      });
    }
  }
}
