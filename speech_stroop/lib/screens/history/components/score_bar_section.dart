import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/model/test_module/history.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ScoreBarSection extends StatelessWidget {
  ScoreBarSection(this.scoreHistory, {Key key}) : super(key: key);
  final List<History> scoreHistory;
  var data = setScoreChartData();
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
              "คะแนนของสัปดาห์นี้",
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
                      "คะแนนเฉลี่ย",
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
                    SizedBox(
                      height: 20,
                    ),
                    SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        primaryYAxis:
                            NumericAxis(minimum: 0, maximum: 60, interval: 10),
                        series: <ChartSeries<_ChartData, String>>[
                          ColumnSeries<_ChartData, String>(
                              dataSource: data,
                              xValueMapper: (_ChartData data, _) => data.x,
                              yValueMapper: (_ChartData data, _) => data.y,
                              name: 'Gold',
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(15))
                        ])
                  ]),
            )
          ]),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

List<_ChartData> setScoreChartData() {
  List<_ChartData> list = [];
  // List<String> DateLabel = [
  //   'วันจันทร์',
  //   'วันอังคาร',
  //   'วันพุธ',
  //   'วันพฤหัส',
  //   'วันศุกร์',
  //   'วันเสาร์',
  //   'วันอาทิตย์',
  // ];

  List<String> DateLabel = [
    'จ.',
    'อ.',
    'พ.',
    'พฤ.',
    'ศ.',
    'ส.',
    'อา.',
  ];

  for (String d in DateLabel) {
    list.add(_ChartData(d, 0));
  }

  DateTime now = DateTime.now();
  DateTime startWeekDate = now.subtract(Duration(days: now.weekday - 1));
  DateTime endWeekDate =
      now.add(Duration(days: DateTime.daysPerWeek - now.weekday));

  double avgScorePerDay = 0.0;
  int sumScorePerDay = 0;
  int countTestPerDay = 0;
  int currDate = endWeekDate.weekday;

  for (History h in userHistory) {
    if (h.createdAt.isBefore(startWeekDate) ||
        h.createdAt.isAfter(endWeekDate)) {
      print("end--------------------");
      break;
    } else {
      int testDate = h.createdAt.weekday;
      print('currDate $currDate \t testDate $testDate');
      if (testDate == currDate) {
        sumScorePerDay = sumScorePerDay + h.totalScore;
        countTestPerDay++;
      } else {
        // set prev date
        avgScorePerDay = sumScorePerDay / countTestPerDay;
        print("&&&&&&&&&&&&&&&&&&& testDate: $testDate");
        list[testDate - 1] =
            _ChartData(DateLabel[testDate - 1], avgScorePerDay);

        // clear date
        currDate = testDate;
        sumScorePerDay = 0;
        countTestPerDay = 0;
        avgScorePerDay = 0.0;

        // prepare curr date
        sumScorePerDay = sumScorePerDay + h.totalScore;
        countTestPerDay++;
      }
    }
  }
  print(list[1].x + list[1].y.toString() + DateLabel[5]);

  return list;
}
