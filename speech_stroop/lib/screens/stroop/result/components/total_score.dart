import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/theme.dart';

class TotalScore extends StatelessWidget {
  const TotalScore(this.totalScore, {Key key}) : super(key: key);
  final int totalScore;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 190,
      padding: const EdgeInsets.fromLTRB(5, 20, 5, 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xFF211338).withOpacity(0.03),
          shape: BoxShape.circle),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'คะแนนรวม',
            style: textTheme().headlineSmall,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '$totalScore',
            style: TextStyle(
              color: secondaryColor,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
