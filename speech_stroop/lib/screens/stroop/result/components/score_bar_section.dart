import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/model/test_module/history.dart';
import 'package:speech_stroop/theme.dart';
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
  List<ScoreChartData> chartData;
  int avgScorePerWeek = 0;
  int testedDays = 0;

  @override
  void initState() {
    var output = setScoreChartData(widget.historyData);
    chartData = output.item1;
    testedDays = output.item2;
    avgScorePerWeek = calculateAvgScorePerWeek(chartData, testedDays);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 0, 0, 5),
      padding: const EdgeInsets.fromLTRB(5, 20, 5, 2),
      child: Center(
          child: Container(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              'ระดับคะแนนล่าสุด',
              style: textTheme().titleMedium,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SfCartesianChart(
            primaryXAxis: CategoryAxis(
              maximumLabels: 7,
              labelStyle: Theme.of(context).textTheme.labelLarge.apply(
                    color: formText,
                  ),
            ),
            primaryYAxis: NumericAxis(
              minimum: 0,
              maximum: 60,
              interval: 10,
              labelStyle: Theme.of(context).textTheme.labelLarge.apply(
                    color: formText,
                  ),
            ),
            series: <ChartSeries<ScoreChartData, String>>[
              ColumnSeries<ScoreChartData, String>(
                dataSource: chartData,
                xValueMapper: (ScoreChartData data, _) => data.x,
                yValueMapper: (ScoreChartData data, _) => data.y,
                color: secondaryColor,
                width: 0.5,
                borderRadius: BorderRadius.circular(15),
              ),
            ],
            plotAreaBorderWidth: 0,
          ),
        ]),
      )),
    );
  }
}

class ScoreChartData {
  ScoreChartData(this.x, this.y);

  final String x;
  final double y;
}

int calculateAvgScorePerWeek(List<ScoreChartData> data, int testedDays) {
  double sum = 0.0;
  int avg = 0;

  if (data.isNotEmpty && testedDays > 0) {
    for (ScoreChartData d in data) {
      sum += d.y;
    }
    avg = (sum / testedDays).round();
  }
  return avg;
}

Tuple2<List<ScoreChartData>, int> setScoreChartData(List<History> historyData) {
  // init data
  List<ScoreChartData> data = [];
  dateLabel.forEach((key, value) {
    data.add(ScoreChartData(value, 0));
  });

  DateTime now = DateTime.now();
  DateTime startWeekDate = now.subtract(Duration(days: now.weekday - 1));
  DateTime endWeekDate =
      now.add(Duration(days: DateTime.daysPerWeek - now.weekday));

  // filter history of this week
  List<History> historyThisWeek = [];
  if (historyData != null) {
    for (History h in historyData) {
      if (h.createdAt.isAfter(startWeekDate) ||
          h.createdAt.isAfter(endWeekDate.add(const Duration(days: 1)))) {
        historyThisWeek.add(h);
      } else {
        break;
      }
    }
  }

  int currDate = 0;
  int prevDate = 0;
  bool testOnlyOneDate = true;
  double avgScorePerDay = 0.0;
  int sumScorePerDay = 0;
  int countTestPerDay = 0;
  int idx = 0;
  int testedDays = 0;
  if (historyThisWeek.isNotEmpty && historyThisWeek != null) {
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
        data[prevDate - 1] =
            ScoreChartData(dateLabel[prevDate], avgScorePerDay);
        testedDays++;

        // clear
        countTestPerDay = 0;
        sumScorePerDay = 0;

        countTestPerDay++;
        sumScorePerDay += h.totalScore;

        // if last elem
        if (idx == historyThisWeek.length) {
          avgScorePerDay = sumScorePerDay / countTestPerDay;
          data[currDate - 1] =
              ScoreChartData(dateLabel[currDate], avgScorePerDay);
          testedDays++;
        }
      }
      prevDate = currDate;
    }
    // check has test only 1 date
    if (testOnlyOneDate) {
      avgScorePerDay = sumScorePerDay / countTestPerDay;
      data[prevDate - 1] = ScoreChartData(dateLabel[prevDate], avgScorePerDay);
      testedDays++;
    }
  }

  return Tuple2(data, testedDays);
}
