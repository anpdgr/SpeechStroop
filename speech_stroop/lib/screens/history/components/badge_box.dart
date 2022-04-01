import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/model/test_module/history.dart';

class BadgeBox extends StatelessWidget {
  const BadgeBox(this.scoreHistory, this.title, {Key key}) : super(key: key);
  final List<History> scoreHistory;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
          color: softPrimaryColor, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(30.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  .apply(color: Color(0xFF464D59)),
            ),
            const Spacer(),
            Text("0/6",
                textAlign: TextAlign.right,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    .apply(color: secondaryColor)),
          ],
        ),
        Divider(
          color: primaryColor.withOpacity(0.3),
          height: 25,
          thickness: 1,
        ),
      ]),
    );
  }
}
