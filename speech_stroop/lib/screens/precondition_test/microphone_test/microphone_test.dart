import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/components/button/mic_button.dart';
import 'package:speech_stroop/theme.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../../components/appbar.dart';

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
  String result = '';
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
      appBar: const CustomAppBar('การทดสอบไมโครโฟน', true),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MicButton(isListening, listen),
      key: scaffoldKey,
      backgroundColor: const Color(0xFFFBFBFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
          child: Column(
            //TODO: padding
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                  'หมายเหตุ* การอยู่ในสถานที่ที่มีเสียงรบกวนน้อยจะยิ่งทำให้การทดสอบได้ประสิทธิภาพมากยิ่งขึ้น',
                  style: textTheme().bodyMedium),
              Align(
                alignment: Alignment.center,
                child:
                    Text('ฟ้า เขียว เหลือง', style: textTheme().displayMedium),
              ),
              Align(
                alignment: Alignment.center,
                child:
                    Text('ส้ม แดง ดำ ม่วง', style: textTheme().displayMedium),
              ),
              Text(
                result,
                style: TextStyle(color: secondaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void listen() async {
    if (!isListening) {
      bool available = await speech.initialize(
          // onStatus: (val) => print('onStatus: $val'),
          onError: (val) => setState(() {
                result = 'โปรดลองใหม่อีกครั้ง';
                text = '';
              }));
      if (available) {
        setState(() => {isListening = true, result = ''});
        speech.listen(
            onResult: onResultListen, localeId: 'th-TH', partialResults: true);
      }
    } else {
      setState(() {
        isListening = false;
      });
      Future.delayed(const Duration(milliseconds: 800), () {
        speech.stop();
        if (text == 'ฟ้าเขียวเหลืองส้มแดงดำม่วง') {
          setState(() {
            result = 'คุณผ่านการทดสอบไมโครโฟน';
            text = '';
          });
          Future.delayed(const Duration(milliseconds: 1500), () {
            //TODO: 321
          });
        } else {
          setState(() {
            result = 'โปรดลองใหม่อีกครั้ง';
            text = '';
          });
        }
      });
    }
  }

  Future<void> onResultListen(val) async {
    valAlternates = val.alternates;

    text = valAlternates[0].recognizedWords;
  }
}
