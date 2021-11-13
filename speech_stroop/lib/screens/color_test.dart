import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_stroop/main.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../providers/speech_lib.dart';

import 'login.dart';

class ColorTestWidget extends StatefulWidget {
  const ColorTestWidget({Key key}) : super(key: key);

  @override
  _ColorTestWidgetState createState() => _ColorTestWidgetState();
}

class _ColorTestWidgetState extends State<ColorTestWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final Map<String, HighlightedWord> _highlights = {
    'flutter': HighlightedWord(
      onTap: () => print('flutter'),
      textStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    ),
    'voice': HighlightedWord(
      onTap: () => print('voice'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
    'subscribe': HighlightedWord(
      onTap: () => print('subscribe'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'like': HighlightedWord(
      onTap: () => print('like'),
      textStyle: const TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.bold,
      ),
    ),
    'comment': HighlightedWord(
      onTap: () => print('comment'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
  };

  stt.SpeechToText speech;
  var sp = SpeechLib();

  Icon micButton() {
    if (sp.isListening) {
      return const Icon(Icons.mic, size: 100);
    } else {
      return const Icon(Icons.mic_none, size: 100);
    }
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
        animate: sp.isListening,
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
                //TODO: ทำไมรอบแรกเออเร่อตลอดเยย
                sp.listen(context, speech);
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
                        'ทดสอบการมองเห็นสี',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color(0xFFD5B5FF),
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child: Text(
                      '1/7',
                      style: TextStyle(
                        color: Color(0xFF8F8F8F),
                        fontSize: 36,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: const Color(0xFFDA5C54),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
            //   child: TextHighlight(
            //     text: _text,
            //     words: _highlights,
            //     textStyle: const TextStyle(
            //       fontSize: 32.0,
            //       color: Colors.black,
            //       fontWeight: FontWeight.w400,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
