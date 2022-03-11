import 'package:flutter/material.dart';

class TextHeadlineLarge extends StatelessWidget {
  final String value;
  TextHeadlineLarge(this.value);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      textAlign: TextAlign.start,
      style: const TextStyle(
        letterSpacing: 1,
        color: Color(0xFF37265F),
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
