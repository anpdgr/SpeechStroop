import 'package:flutter/material.dart';
import 'package:speech_stroop/screens/login.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechLib {
  bool isListening = false;
  String text = 'กดปุ่มเพื่อพูด';
  double confidence = 1.0;

  void listen(context, stt.SpeechToText speech) async {
    if (!isListening) {
      bool available = await speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        isListening = true;
        speech.listen(
          onResult: (val) => {
            text = val.recognizedWords,
            if (val.hasConfidenceRating && val.confidence > 0)
              {confidence = val.confidence}
          },
          localeId: 'th-TH',
        );
      }
    } else {
      isListening = false;
      speech.stop();
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginWidget()));
      });
    }
  }
}
