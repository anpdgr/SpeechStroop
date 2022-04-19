import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/model/test_module/history.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReactionTimeBarSection extends StatefulWidget {
  ReactionTimeBarSection(this.historyData, {Key key}) : super(key: key);
  List<History> historyData;
  @override
  _ReactionTimeBarSectionState createState() => _ReactionTimeBarSectionState();
}

class _ReactionTimeBarSectionState extends State<ReactionTimeBarSection> {
  final formGlobalKey = GlobalKey<FormState>();
  List<_ChartData> chartData;
  double avgReactionTimePerWeek = 0.0;

  @override
  void initState() {
    chartData = setReactionTimeChartData();
    avgReactionTimePerWeek = calculateAvgReactionTimePerWeek(chartData);
    //TODO: count testedDay
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
              "เวลาตอบสนองของสัปดาห์นี้",
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
                      "เวลาตอบสนองเฉลี่ยต่อสัปดาห๋",
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
                      '${(avgReactionTimePerWeek).toStringAsFixed(2)} วิ',
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
                        maximum: 3, //TODO: use const
                        interval: 0.1,
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

double calculateAvgReactionTimePerWeek(List<_ChartData> data) {
  double sum = 0.0;
  double avg = 0.0;
  for (_ChartData d in data) {
    sum += d.y;
  }
  avg = sum / data.length;
  return avg;
}

List<_ChartData> setReactionTimeChartData() {
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
  double avgReactionTimePerDay = 0.0;
  double sumReactionTimePerDay = 0.0;
  int countTestPerDay = 0;
  double rtPerTest = 0.0;
  double sumPerTest = 0.0;
  List<double> rtList = [];
  for (History h in historyThisWeek) {
    currDate = h.createdAt.weekday;
    // only first round
    if (prevDate == 0) {
      prevDate = currDate;
    }
    // other round
    if (currDate == prevDate) {
      rtList = h.sections
          .where((s) => s.avgReactionTimeMs > 0.0)
          .map((s) => s.avgReactionTimeMs)
          .toList();
      if (rtList.isEmpty) {
        continue;
      }

      countTestPerDay++;
      sumPerTest = rtList.reduce((value, element) => value + element);
      rtPerTest = sumPerTest / rtList.length;
      sumReactionTimePerDay += rtPerTest;
    } else {
      // set testOnlyOneDate flag
      testOnlyOneDate = false;

      // cal avg ReactionTime
      avgReactionTimePerDay = (sumReactionTimePerDay / countTestPerDay) / 1000;
      data[prevDate] = _ChartData(dateLabel[prevDate], avgReactionTimePerDay);

      // clear
      countTestPerDay = 0;
      sumReactionTimePerDay = 0;
    }
    prevDate = currDate;
  }
  // check has test only 1 date
  if (testOnlyOneDate) {
    avgReactionTimePerDay = sumReactionTimePerDay / countTestPerDay / 1000;
    data[prevDate] = _ChartData(dateLabel[prevDate], avgReactionTimePerDay);
  }

  return data;
}
