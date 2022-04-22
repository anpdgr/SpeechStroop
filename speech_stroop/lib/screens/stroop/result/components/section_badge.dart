import 'package:flutter/material.dart';
import 'package:speech_stroop/theme.dart';

class SectionBadge extends StatelessWidget {
  const SectionBadge({Key key}) : super(key: key);

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
                  'รางวัลที่ได้รับ',
                  style: textTheme().titleMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
