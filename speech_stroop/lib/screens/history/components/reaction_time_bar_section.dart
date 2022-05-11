import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/model/test_module/history.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tuple/tuple.dart';

class ReactionTimeBarSection extends StatefulWidget {
  const ReactionTimeBarSection(this.historyData, {Key key}) : super(key: key);
  final List<History> historyData;

  @override
  _ReactionTimeBarSectionState createState() => _ReactionTimeBarSectionState();
}

class _ReactionTimeBarSectionState extends State<ReactionTimeBarSection> {
  final formGlobalKey = GlobalKey<FormState>();
  List<ReactionTimeChartData> chartData;
  double avgReactionTimePerWeek = 0.0;
  int testedDays = 0;

  @override
  void initState() {
    var output = setReactionTimeChartData(widget.historyData);
    chartData = output.item1;
    testedDays = output.item2;
    avgReactionTimePerWeek =
        calculateAvgReactionTimePerWeek(chartData, testedDays);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "กราฟเวลาตอบสนอง",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: softPrimaryColor,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 25),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 400,
                      child: SfCartesianChart(
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
                        series: <ChartSeries<ReactionTimeChartData, String>>[
                          ColumnSeries<ReactionTimeChartData, String>(
                            dataSource: chartData,
                            xValueMapper: (ReactionTimeChartData data, _) =>
                                data.x,
                            yValueMapper: (ReactionTimeChartData data, _) =>
                                data.y,
                            color: secondaryColor,
                            width: 0.5,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ],
                        plotAreaBorderWidth: 0,
                      ),
                    ),
                  ]),
            )
          ]),
    );
  }
}

class ReactionTimeChartData {
  ReactionTimeChartData(this.x, this.y);

  final String x;
  final double y;
}

double calculateAvgReactionTimePerWeek(
    List<ReactionTimeChartData> data, int testedDays) {
  double sum = 0.0;
  double avg = 0.0;
  if (data.isNotEmpty && testedDays > 0) {
    for (ReactionTimeChartData d in data) {
      sum += d.y;
    }
    avg = sum / testedDays;
  }
  return avg;
}

Tuple2<List<ReactionTimeChartData>, int> setReactionTimeChartData(
  List<History> historyData,
) {
  // init data
  List<ReactionTimeChartData> data = [];
  dateLabel.forEach((key, value) {
    data.add(ReactionTimeChartData(value, 0));
  });

  DateTime now = DateTime.now();
  DateTime startWeekDate = now.subtract(Duration(days: now.weekday - 1));
  DateTime endWeekDate =
      now.add(Duration(days: DateTime.daysPerWeek - now.weekday));

  // filter history of this week
  List<History> historyThisWeek = [];
  if (historyData != null || historyData.isNotEmpty) {
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
  double avgAvgReactionTimePerDay = 0.0;
  double sumAvgReactionTimePerDay = 0.0;
  double avgAvgReactionTimePerTest = 0.0;
  double sumAvgReactionTimePerTest = 0.0;
  List<double> nonZeroReactionTime = [];

  int countTestPerDay = 0;
  int idx = 0;
  int testedDays = 0;
  if (historyThisWeek.isNotEmpty) {
    for (History h in historyThisWeek) {
      idx++;
      currDate = h.createdAt.weekday;

      // cal total avg reaction time per test
      nonZeroReactionTime = h.sections
          .map((s) => s.avgReactionTimeMs)
          .where((rt) => rt > 0 || rt != null)
          .toList();
      sumAvgReactionTimePerTest =
          nonZeroReactionTime.reduce((value, element) => value + element) /
              1000;
      avgAvgReactionTimePerTest =
          sumAvgReactionTimePerTest / nonZeroReactionTime.length;

      // only first round
      if (prevDate == 0) {
        prevDate = currDate;
      }
      // other round
      if (currDate == prevDate) {
        countTestPerDay++;
        sumAvgReactionTimePerDay += avgAvgReactionTimePerTest;
      } else {
        // set testOnlyOneDate flag
        testOnlyOneDate = false;

        // cal avg ReactionTime
        avgAvgReactionTimePerDay = sumAvgReactionTimePerDay / countTestPerDay;
        data[prevDate - 1] = ReactionTimeChartData(
            dateLabel[prevDate], avgAvgReactionTimePerDay);
        testedDays++;

        // clear
        countTestPerDay = 0;
        sumAvgReactionTimePerDay = 0;

        countTestPerDay++;
        sumAvgReactionTimePerDay += avgAvgReactionTimePerTest;

        // if last elem
        if (idx == historyThisWeek.length) {
          avgAvgReactionTimePerDay = sumAvgReactionTimePerDay / countTestPerDay;
          data[currDate - 1] = ReactionTimeChartData(
              dateLabel[currDate], avgAvgReactionTimePerDay);
          testedDays++;
        }
      }
      prevDate = currDate;
    }
    // check has test only 1 date
    if (testOnlyOneDate) {
      avgAvgReactionTimePerDay = sumAvgReactionTimePerDay / countTestPerDay;
      data[prevDate - 1] =
          ReactionTimeChartData(dateLabel[prevDate], avgAvgReactionTimePerDay);
      testedDays++;
    }
  }

  return Tuple2(data, testedDays);
}
