import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
// import 'package:permission_handler/permission_handler.dart';

import '../auth/login.dart';
import '../../utils/speech_lib.dart';

class MicrophoneTestWidget extends StatefulWidget {
  const MicrophoneTestWidget({Key key}) : super(key: key);

  @override
  _MicrophoneTestWidgetState createState() => _MicrophoneTestWidgetState();
}

class _MicrophoneTestWidgetState extends State<MicrophoneTestWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  stt.SpeechToText speech;

  bool isListening = false;
  String text = '';
  double confidence = 1.0;
  int answered = 0;
  List textArr;
  bool isCorrect = false;
  List<SpeechRecognitionWords> valAlternates;

  Icon micButton() {
    // Future<Icon> micButton() async {
    if (isListening) {
      // var status = await Permission.microphone.request();
      // if (status.isGranted) {
      return const Icon(Icons.mic, size: 100);
      // }
    }
    return const Icon(Icons.mic_none, size: 100);
  }

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
      floatingActionButton: AvatarGlow(
        animate: isListening,
        glowColor: Colors.orangeAccent[100],
        endRadius: 100.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: SizedBox(
            height: 130,
            width: 130,
            child: FloatingActionButton(
              onPressed: () {
                listen();
              },
              child: micButton(),
              backgroundColor: Colors.orange[700],
            )),
      ),
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Align(
                    alignment: AlignmentDirectional(-0.9, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        'ทดสอบไมโครโฟน',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color(0xFFD5B5FF),
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  Align(
                      // alignment: const AlignmentDirectional(0, 0),
                      alignment: Alignment.center,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text(colorsMapDefault.keys.toList()[answered],
                              style: TextStyle(
                                  color: colorsMapDefault.values
                                      .toList()[answered],
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold)),
                          // SizedBox(
                          //   width: 200,
                          //   height: 200,
                          //   child: DecoratedBox(
                          //     decoration: BoxDecoration(
                          //       color: colorsMapDefault.values.toList()[answered],
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
        text = valAlternates.last.toString();
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
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginWidget()));
      });
    }
  }
}