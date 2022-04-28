import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/model/test_module/history.dart';
import 'dart:async';

import 'package:speech_stroop/screens/history_all/components/section_box.dart';
import 'package:speech_stroop/utils/date_format.dart';

class ScoreBox extends StatefulWidget {
  const ScoreBox(this.historyData, {Key key}) : super(key: key);
  final History historyData;

  @override
  _ScoreBoxState createState() => _ScoreBoxState();
}

class _ScoreBoxState extends State<ScoreBox> {
  final formGlobalKey = GlobalKey<FormState>();
  bool expanded;
  bool canExpaned;
  History historyData;

  @override
  void initState() {
    expanded = false;
    canExpaned = false;
    historyData = widget.historyData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.all(30.0),
      width: 800,
      height: expanded ? 420.0 : 130.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      decoration: BoxDecoration(
          color: softPrimaryColor, borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Row(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "${historyData.totalScore}",
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    .apply(color: secondaryColor),
              ),
              Text(
                "คะแนนรวม",
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    .apply(color: formText),
              ),
            ]),
            const Spacer(),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(
                convertDateTime(historyData.createdAt),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    expanded = !expanded;

                    Future.delayed(
                        !expanded
                            ? const Duration(milliseconds: 0)
                            : const Duration(milliseconds: 400),
                        () => {
                              setState(() {
                                canExpaned = !canExpaned;
                              }),
                            });
                  });
                },
                icon: expanded
                    ? Image.asset("assets/images/up.png")
                    : Image.asset("assets/images/down.png"),
              ),
            ]),
          ],
        ),
        if (canExpaned == true)
          Column(children: [
            Divider(
              color: primaryColor.withOpacity(0.3),
              height: 25,
              thickness: 1,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "คะแนนแต่ละส่วน",
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    .apply(color: formText),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  for (var s in historyData.sections)
                    Expanded(
                      child: SectionBox(
                          s.section,
                          s.score["congruent"] + (s.score["incongruent"] ?? 0),
                          s.avgReactionTimeMs),
                    ),
                  //if (s.section != 3) const SizedBox(width: 5),
                ],
              ),
            ),
            Divider(
              color: primaryColor.withOpacity(0.3),
              height: 25,
              thickness: 1,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "รางวัลที่ได้รับ",
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    .apply(color: formText),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Image.asset(
                    "assets/images/badges/badge-1-1-raw.png",
                    width: 56,
                    height: 56,
                  ),
                  const SizedBox(width: 20),
                  Image.asset(
                    "assets/images/badges/badge-1-3-raw.png",
                    width: 56,
                    height: 56,
                  ),
                ],
              ),
            ),
          ])
        else
          const SizedBox(
            width: 0,
          ),
      ]),
    );
  }
}
