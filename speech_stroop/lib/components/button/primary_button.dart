import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/enums.dart';

// typedef void HandleFunc();

class PrimaryButton extends StatelessWidget {
  final String text;
  final ButtonType buttonType;
  final void Function() handler;

  PrimaryButton(this.text, this.handler, [this.buttonType = ButtonType.small]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
          ],
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            colors: [Color(0xff503B7F), Color(0xffEB8D8D)],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            minimumSize:
                MaterialStateProperty.all(buttonStyle[buttonType].item1),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
            handler();
          },
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Text(
              text,
              style: buttonStyle[buttonType].item2.apply(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
