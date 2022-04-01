import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/model/test_module/history.dart';

class ScoreBarSection extends StatelessWidget {
  const ScoreBarSection(this.scoreHistory, {Key key}) : super(key: key);
  final List<History> scoreHistory;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.all(30.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "คะแนนล่าสุด",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Container(
              width: 350,
              decoration: BoxDecoration(
                  color: softPrimaryColor,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(40),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "คะแนนเฉลี่ยต่อสัปดาห์",
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          .apply(color: Color(0xFF525252)),
                    ),
                    Text(
                      "27",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ]),
            )
          ]),
    );
  }
}
