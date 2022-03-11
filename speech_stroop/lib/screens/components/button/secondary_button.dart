import 'package:flutter/material.dart';

// typedef void HandleFunc();

class SecondaryButton extends StatelessWidget {
  final String text;
  // final HandleFunc handler;
  final void Function() handler;
  SecondaryButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
        child: SizedBox(
            width: 350,
            height: 42,
            child: OutlinedButton(
                onPressed: () {
                  handler();
                },
                child: Text(
                  text,
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: Color(0xff503B7F)),
                  shape: const StadiumBorder(),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF37265F),
                    fontFamily: 'BaiJamjuree',
                  ),
                ))));
  }
}
