import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/model/test_module/history.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ScoreBarSection extends StatefulWidget {
  ScoreBarSection(this.historyData, {Key key}) : super(key: key);
  List<History> historyData;
  @override
  _ScoreBarSectionState createState() => _ScoreBarSectionState();
}

class _ScoreBarSectionState extends State<ScoreBarSection> {
  final formGlobalKey = GlobalKey<FormState>();
  List<_ChartData> chartData;
  int avgScorePerWeek = 0;

  @override
  void initState() {
    chartData = setScoreChartData();
    avgScorePerWeek = calculateAvgScorePerWeek(chartData);
    super.initState();
  }

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
                          .apply(color: const Color(0xFF525252)),
                    ),
                    Text(
                      avgScorePerWeek.toString(),
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        primaryYAxis:
                            NumericAxis(minimum: 0, maximum: 60, interval: 10),
                        series: <ChartSeries<_ChartData, String>>[
                          ColumnSeries<_ChartData, String>(
                              dataSource: chartData,
                              xValueMapper: (_ChartData data, _) => data.x,
                              yValueMapper: (_ChartData data, _) => data.y,
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

int calculateAvgScorePerWeek(List<_ChartData> data) {
  double sum = 0.0;
  int avg = 0;
  for (_ChartData d in data) {
    sum += d.y;
  }
  avg = (sum / data.length).round();
  return avg;
}

List<_ChartData> setScoreChartData() {
  // init data
  List<_ChartData> data = [];
  dateLabel.forEach((key, value) {
    data.add(_ChartData(value, 0));
  });

  DateTime now = DateTime.now();
  DateTime startWeekDate = now.subtract(Duration(days: now.weekday - 1));
  DateTime endWeekDate =
      now.add(Duration(days: DateTime.daysPerWeek - now.weekday));

  // filter history of this week
  List<History> historyThisWeek = [];
  for (History h in userHistory) {
    if (h.createdAt.isAfter(startWeekDate) ||
        h.createdAt.isAfter(endWeekDate.add(const Duration(days: 1)))) {
      historyThisWeek.add(h);
    } else {
      break;
    }
  }

  int currDate = 0;
  int prevDate = 0;
  bool testOnlyOneDate = true;
  double avgScorePerDay = 0.0;
  int sumScorePerDay = 0;
  int countTestPerDay = 0;
  for (History h in historyThisWeek) {
    currDate = h.createdAt.weekday;
    // only first round
    if (prevDate == 0) {
      prevDate = currDate;
    }
    // other round
    if (currDate == prevDate) {
      countTestPerDay++;
      sumScorePerDay += h.totalScore;
    } else {
      // set testOnlyOneDate flag
      testOnlyOneDate = false;

      // cal avg score
      avgScorePerDay = sumScorePerDay / countTestPerDay;
      data[prevDate] = _ChartData(dateLabel[prevDate], avgScorePerDay);

      // clear
      countTestPerDay = 0;
      sumScorePerDay = 0;
    }
    prevDate = currDate;
  }
  // check has test only 1 date
  if (testOnlyOneDate) {
    avgScorePerDay = sumScorePerDay / countTestPerDay;
    data[prevDate] = _ChartData(dateLabel[prevDate], avgScorePerDay);
  }

  return data;
}
