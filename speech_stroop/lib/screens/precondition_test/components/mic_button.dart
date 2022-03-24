import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';

List<Widget> micButton(isListening) {
  if (isListening) {
    return <Widget>[const Icon(Icons.mic, size: 100), Text("กดเพื่อหยุด")];
  } else {
    return <Widget>[const Icon(Icons.mic_none, size: 100), Text("กดเพื่อพูด")];
  }
}

class MicButton extends StatelessWidget {
  final bool isListening;
  final void Function() handler;

  MicButton(this.isListening, this.handler);

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      animate: isListening,
      glowColor: Color.fromARGB(157, 255, 143, 199),
      endRadius: 100.0,
      duration: const Duration(milliseconds: 1000),
      repeatPauseDuration: const Duration(milliseconds: 100),
      repeat: true,
      child: SizedBox(
          height: 130,
          width: 130,
          child: FloatingActionButton.extended(
            label: Column(
              children: micButton(isListening),
            ),
            onPressed: () {
              handler();
            },
            icon: Container(),
            backgroundColor: isListening ? secondaryColor : primaryColor,
          )),
    );
  }
}
