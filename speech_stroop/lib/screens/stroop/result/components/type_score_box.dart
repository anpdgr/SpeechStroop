import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';

class TypeScoreBox extends StatelessWidget {
  TypeScoreBox(this.questionType, this.label, this.score);

  final String questionType;
  final String label;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 93,
      height: 120,
      margin: const EdgeInsets.fromLTRB(5, 0, 0, 5),
      padding: const EdgeInsets.fromLTRB(5, 20, 5, 2),
      decoration: BoxDecoration(
        color: const Color(0xFF211338).withOpacity(0.03),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              questionType,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  .apply(color: Colors.black),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style:
                  Theme.of(context).textTheme.labelSmall.apply(color: formText),
            ),
            const SizedBox(height: 10),
            Text(
              '$score',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  .apply(color: secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
