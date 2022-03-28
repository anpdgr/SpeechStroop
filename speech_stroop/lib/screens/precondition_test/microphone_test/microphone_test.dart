import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/components/button/mic_button.dart';
import 'package:speech_stroop/screens/precondition_test/microphone_test/fail_microphone_test.dart';
import 'package:speech_stroop/screens/precondition_test/microphone_test/pass_microphone_test.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../../components/appbar.dart';
import '../../auth/login.dart';
import '../../../utils/speech_lib.dart';

class MicrophoneTestScreen extends StatefulWidget {
  const MicrophoneTestScreen({Key key}) : super(key: key);
  static String routeName = "/precondition_microphone_test";

  @override
  _MicrophoneTestScreenState createState() => _MicrophoneTestScreenState();
}

class _MicrophoneTestScreenState extends State<MicrophoneTestScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  stt.SpeechToText speech;

  bool isListening = false;
  String text = '';
  double confidence = 1.0;
  List textArr;
  bool isCorrect = false;
  List<SpeechRecognitionWords> valAlternates;
  String word = '';

  @override
  void initState() {
    super.initState();
    speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      appBar: CustomAppBar('การทดสอบไมโครโฟน'),
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
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                        child: Text(word,
                            style: TextStyle(
                                fontSize: 70, fontWeight: FontWeight.bold)),
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
      });
      Future.delayed(const Duration(milliseconds: 800), () {
        speech.stop();
      });
      // navigatePage();
      Navigator.pushNamed(context, PassMicrophoneTestScreen.routeName);
      // Navigator.pushNamed(context, FailMicrophoneTestScreen.routeName);
    }
  }

  Future<void> onResultListen(val) async {
    valAlternates = val.alternates;

    text = valAlternates[0].recognizedWords;
  }

  //TODO: if throw aany error -> fail, else -> pass
  // void navigatePage() {
  //   if (answered < 6) {
  //     Future.delayed(const Duration(milliseconds: 800), () {
  //       setState(() {
  //         answered++;
  //       });
  //     });
  //   } else {
  //     Future.delayed(const Duration(milliseconds: 1500), () {
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => const LoginScreen()));
  //     });
  //   }
  // }
}
