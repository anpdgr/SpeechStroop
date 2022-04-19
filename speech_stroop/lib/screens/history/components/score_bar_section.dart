import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/model/test_module/history.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tuple/tuple.dart';

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
  int testedDatys = 0;

  @override
  void initState() {
    var output = setScoreChartData();
    chartData = output.item1;
    testedDatys = output.item2;
    avgScorePerWeek = calculateAvgScorePerWeek(chartData, testedDatys);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.all(30),
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
                      "คะแนนเฉลี่ยต่อสัปดาห๋",
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          .apply(color: const Color(0xFF525252)),
                    ),
                    const SizedBox(
                      height: 5,
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
                      primaryXAxis: CategoryAxis(
                        labelStyle:
                            Theme.of(context).textTheme.labelLarge.apply(
                                  color: formText,
                                ),
                      ),
                      primaryYAxis: NumericAxis(
                        minimum: 0,
                        maximum: 60,
                        interval: 10,
                        labelStyle:
                            Theme.of(context).textTheme.labelLarge.apply(
                                  color: formText,
                                ),
                      ),
                      series: <ChartSeries<_ChartData, String>>[
                        ColumnSeries<_ChartData, String>(
                          dataSource: chartData,
                          xValueMapper: (_ChartData data, _) => data.x,
                          yValueMapper: (_ChartData data, _) => data.y,
                          color: secondaryColor,
                          width: 0.5,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ],
                      plotAreaBorderWidth: 0,
                    ),
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

int calculateAvgScorePerWeek(List<_ChartData> data, int testedDatys) {
  double sum = 0.0;
  int avg = 0;
  for (_ChartData d in data) {
    sum += d.y;
  }
  avg = (sum / testedDatys).round();
  return avg;
}

Tuple2<List<_ChartData>, int> setScoreChartData() {
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
  int idx = 0;
  int testedDatys = 0;
  for (History h in historyThisWeek) {
    idx++;
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
      testedDatys++;

      // clear
      countTestPerDay = 0;
      sumScorePerDay = 0;

      countTestPerDay++;
      sumScorePerDay += h.totalScore;

      // if last elem
      if (idx == historyThisWeek.length - 1) {
        avgScorePerDay = sumScorePerDay / countTestPerDay;
        data[currDate] = _ChartData(dateLabel[currDate], avgScorePerDay);
        testedDatys++;
      }
    }
    prevDate = currDate;
  }
  // check has test only 1 date
  if (testOnlyOneDate) {
    avgScorePerDay = sumScorePerDay / countTestPerDay;
    data[prevDate] = _ChartData(dateLabel[prevDate], avgScorePerDay);
    testedDatys++;
  }

  for (_ChartData d in data) {
    print("${d.x} :  ${d.y}");
  }

  return Tuple2(data, testedDatys);
}
