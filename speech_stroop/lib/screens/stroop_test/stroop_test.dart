import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:more/tuple.dart';

import '../auth/login.dart';
import '../../utils/speech_lib.dart';
import 'dart:math';

import 'break.dart';

int section = 1;
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
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                      // alignment: const AlignmentDirectional(0, 0),
                      alignment: Alignment.center,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: answered >= 0
                              ? Text(testTemplate[answered].first,
                                  style: TextStyle(
                                      color: testTemplate[answered].last,
                                      fontSize: 70,
                                      fontWeight: FontWeight.bold))
                              : ElevatedButton(
                                  onPressed: () {
                                    if (answered < 0) {
                                      buildTest();
                                      navigatePage();
                                      listen();
                                    }
                                  },
                                  child: const Text('แตะเพื่อเริ่ม'),
                                ),
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

  void buildTest() {
    Random rn = Random();
    int idxName = 0, idxCode = 0, congruent = 0, incongruent = 0;
    List colorsCodeNoName = [];
    Tuple2 question;
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

    idxName = rn.nextInt(colorsName.length);
    for (var i = 0; i < congruent; i++) {
      question = Tuple2(colorsName[idxName], colorsCode[idxName]);
      if (question == testTemplate.last) {
        i--;
        continue;
      }
      testTemplate.add(question);
    }
    for (var i = 0; i < incongruent; i++) {
      colorsCodeNoName = colorsCode
          .where((c) => c != colorsMapDefault[colorsName[idxName]])
          .toList();
      idxCode = rn.nextInt(colorsCodeNoName.length);
      question = Tuple2(colorsName[idxName], colorsCodeNoName[idxCode]);
      if (question == testTemplate.last) {
        i--;
        continue;
      }
      testTemplate.add(question);
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
    } else if (answered == QUESTIONS_AMOUNT) {
      //Widget nextWidget;
      setState(() {
        isListening = false;
        if (section < 3) {
          //section 1-2, last Q
          //nextWidget = const BreakWidget();
          Future.delayed(const Duration(milliseconds: 3000), () {
            speech.stop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BreakWidget()));
          });
        } else if (section == 3) {
          //section 3, last Q
          //nextWidget = const LoginWidget();

        }
      });

      // Future.delayed(const Duration(milliseconds: 3000), () {
      //   speech.stop();
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => nextWidget()));
      // });
    }
  }
}
