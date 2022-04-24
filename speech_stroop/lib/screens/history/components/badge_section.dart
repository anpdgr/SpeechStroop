import 'package:flutter/material.dart';
import 'package:speech_stroop/model/test_module/history.dart';
import 'package:speech_stroop/screens/history/components/badge_box.dart';

class BadgeSection extends StatelessWidget {
  const BadgeSection(this.scoreHistory, {Key key}) : super(key: key);
  final List<History> scoreHistory;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(30.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "รางวัลที่ได้รับ",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            BadgeBox(scoreHistory, "ทดสอบต่อเนื่อง"),
            const SizedBox(height: 20),
            BadgeBox(scoreHistory, "คะแนนยอดเยี่ยม"),
          ]),
    );
  }
}
