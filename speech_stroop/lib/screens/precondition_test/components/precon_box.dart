import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/theme.dart';

class PreconBox extends StatelessWidget {
  final String text;
  PreconBox(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          text,
          style: textTheme().bodyLarge.apply(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      )),
      width: 165,
      height: 95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: tertiaryColor,
      ),
    );
  }
}
