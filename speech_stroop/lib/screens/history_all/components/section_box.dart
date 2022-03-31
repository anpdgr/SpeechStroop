import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';

class SectionBox extends StatelessWidget {
  const SectionBox(this.section, this.score, this.reactionTime, {Key key})
      : super(key: key);
  final int section;
  final int score;
  final double reactionTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 93,
      height: 107,
      margin: const EdgeInsets.fromLTRB(5, 0, 0, 5),
      padding: const EdgeInsets.fromLTRB(5, 20, 5, 2),
      decoration: BoxDecoration(
        color: const Color(0xFF211338).withOpacity(0.03),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              "Section $section",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  .apply(color: Colors.black),
            ),
            const SizedBox(height: 2),
            Text(
              '${reactionTime.toStringAsFixed(2)} วิ', //TODO: วินาที
              style:
                  Theme.of(context).textTheme.labelSmall.apply(color: formText),
            ),
            const SizedBox(height: 10),
            Text(
              '$score',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  .apply(color: secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
