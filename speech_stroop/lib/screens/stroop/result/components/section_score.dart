import 'package:flutter/material.dart';
import 'package:speech_stroop/model/test_module/section.dart';
import 'package:speech_stroop/screens/stroop/result/components/section_score_box.dart';
import 'package:speech_stroop/theme.dart';

class SectionScore extends StatelessWidget {
  const SectionScore(this.sections, {Key key}) : super(key: key);
  final List<Section> sections;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 0, 0, 5),
      padding: const EdgeInsets.fromLTRB(5, 20, 5, 2),
      child: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'คะแนนแต่ละส่วน',
                  style: textTheme().titleMedium,
                ),
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  for (var s in sections)
                    Expanded(
                      child: SectionScoreBox(
                          s.section,
                          s.score["congruent"] + (s.score["incongruent"] ?? 0),
                          s.avgReactionTimeMs ?? 0),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
