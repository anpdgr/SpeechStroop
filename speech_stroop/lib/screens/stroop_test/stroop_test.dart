import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:more/tuple.dart';

import '../auth/login.dart';
import '../../utils/speech_lib.dart';
import 'dart:math';

import 'break.dart';

int section = 1;
int QUESTIONS_AMOUNT = 20;
List<Tuple3<String, Color, String>> testTemplate = [];

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
  List textArr;

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: answered >= 0
                        ? Text(
                            testTemplate[answered].first,
                            style: TextStyle(
                              color: testTemplate[answered].second,
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          )
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
                ),
                Text(text)
              ],
            ),
          ],
        ),
      ),
    );
  }

  void buildTest() {
    print('answered' + answered.toString());
    Random rn = Random();
    int idxName = 0, idxCode = 0, congruent = 0, incongruent = 0;
    List colorsCodeNoName = [];
    Tuple3<String, Color, String> question;
    testTemplate = <Tuple3<String, Color, String>>[];

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
      question = Tuple3(colorsName[idxName], colorsCode[idxName], "congruent");

      testTemplate.add(question);
    }
    for (var i = 0; i < incongruent; i++) {
      idxName = rn.nextInt(colorsName.length);

      colorsCodeNoName = colorsCode
          .where((c) => c != colorsMapDefault[colorsName[idxName]])
          .toList();
      idxCode = rn.nextInt(colorsCodeNoName.length);
      question =
          Tuple3(colorsName[idxName], colorsCodeNoName[idxCode], "incongruent");
      isQuestionExist(question, testTemplate)
          ? (i--)
          : testTemplate.add(question);
    }

    //TODO: avoid same element being next to each other
    testTemplate.shuffle();

    print(testTemplate.toString() + (testTemplate.length).toString());
  }

  bool isQuestionExist(question, testTemplate) {
    for (var elem in testTemplate) {
      print((question == elem).toString() +
          question.toString() +
          "\t" +
          elem.toString());
      if (question == elem) {
        return true;
      }
    }
    return false;
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
        scorePerQuestion++;
      });
    } else {
      setState(() {
        text = '';
      });
    }
  }

  void navigatePage() {
    print('answered' + answered.toString());
    if (answered < QUESTIONS_AMOUNT - 1) {
      //every section, except last Q
      var durationDelay = (answered == -1)
          ? const Duration(milliseconds: 1000)
          //TODO: edit ms
          : const Duration(milliseconds: 3000);
      Future.delayed(durationDelay, () {
        setState(() {
          scoreCounting();
          answered++;
          navigatePage();
        });
      });
    }
    if (answered == QUESTIONS_AMOUNT - 1) {
      Widget nextWidget;
      //TODO: push db

      //TODO: set scores to 0

      setState(() {
        scoreCounting();

        isListening = false;
        if (section < 3) {
          //section 1-2, last Q
          nextWidget = const BreakWidget();
        } else if (section == 3) {
          //section 3, last Q
          nextWidget = const LoginWidget();
        }
      });
      Future.delayed(const Duration(milliseconds: 3000), () {
        speech.stop();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => nextWidget));
      });
    }
  }
}