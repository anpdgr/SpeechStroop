import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:more/tuple.dart';

import '../auth/login.dart';
import '../../utils/speech_lib.dart';
import 'dart:math';

int section = 0;
// ignore: non_constant_identifier_names
int QUESTIONS_AMOUNT = 20;
List<Tuple2<String, Color>> testTemplate = [];

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
                  buildTest();
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
                                ? Text(colorsMapDefault.keys.toList()[answered],
                                    style: TextStyle(
                                        color: colorsMapDefault.values
                                            .toList()[answered],
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

  void buildTest() {
    section = section == 0 ? 1 : section;
    Random rn = Random();
    int idxName = 0, idxCode = 0, congruent = 0, incongruent = 0;
    List colorsCodeNoName = [];
    testTemplate = <Tuple2<String, Color>>[];

    switch (section) {
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

    for (var i = 0; i < congruent; i++) {
      idxName = rn.nextInt(colorsName.length);
      testTemplate.add(Tuple2(colorsName[idxName], colorsCode[idxName]));
    }
    for (var i = 0; i < incongruent; i++) {
      idxName = rn.nextInt(colorsName.length);
      colorsCodeNoName = colorsCode.removeAt(idxName);
      idxCode = rn.nextInt(colorsCodeNoName.length);
      testTemplate.add(Tuple2(colorsName[idxName], colorsCodeNoName[idxCode]));
    }
    testTemplate.shuffle();

    section++;
    answered = 0;

    print(testTemplate);
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
    if (answered < QUESTIONS_AMOUNT - 1) {
      //every section, except last Q
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
    } else if (section < 3 && answered == QUESTIONS_AMOUNT) {
      //section 1-2, last Q

      //break
    }

    if (section == 3 && answered == QUESTIONS_AMOUNT) {
      //section 3, last Q
      setState(() {
        isListening = false;
      });
      Future.delayed(const Duration(milliseconds: 3000), () {
        speech.stop();
        Navigator.push(
            context,
            //TODO: break page
            MaterialPageRoute(builder: (context) => const LoginWidget()));
      });
    }
  }
}
