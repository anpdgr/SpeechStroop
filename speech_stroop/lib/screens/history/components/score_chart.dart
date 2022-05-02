import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/model/test_module/history.dart';
import 'package:speech_stroop/utils/date_format.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ScoreChartSection extends StatefulWidget {
  const ScoreChartSection(this.historyData, this.range, {Key key})
      : super(key: key);
  final List<History> historyData;
  final int range;

  @override
  _ScoreChartSectionState createState() => _ScoreChartSectionState();
}

class _ScoreChartSectionState extends State<ScoreChartSection> {
  final formGlobalKey = GlobalKey<FormState>();
  List<ScoreChartData> chartData;
  int avgScorePerWeek = 0;
  int testedDays = 0;
  List<ScoreChartData> scoreChartData;
  TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    scoreChartData = getScoreChartData(widget.historyData, widget.range);
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
              "กราฟคะแนนย้อนหลัง",
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
                        tooltipBehavior: TooltipBehavior(enable: true),
                        primaryXAxis: CategoryAxis(
                          labelRotation: 60,
                          maximumLabels: widget.range,
                          labelStyle:
                              Theme.of(context).textTheme.labelLarge.apply(
                                    color: formText,
                                  ),
                        ),
                        primaryYAxis: NumericAxis(
                          minimum: 0,
                          maximum: 100,
                          interval: 10,
                          labelStyle:
                              Theme.of(context).textTheme.labelLarge.apply(
                                    color: formText,
                                  ),
                        ),
                        series: scoreChartData.isNotEmpty
                            ? <ChartSeries<ScoreChartData, String>>[
                                ColumnSeries<ScoreChartData, String>(
                                  dataSource: scoreChartData,
                                  xValueMapper: (ScoreChartData data, _) =>
                                      data.x,
                                  yValueMapper: (ScoreChartData data, _) =>
                                      data.y,
                                  color: secondaryColor,
                                  width: 0.5,
                                  borderRadius: BorderRadius.circular(20),
                                  enableTooltip: true,
                                ),
                              ]
                            : null,
                        plotAreaBorderWidth: 0,
                      ),
                    ),
                  ]),
            )
          ]),
    );
  }
}

class ScoreChartData {
  ScoreChartData(this.x, this.y);

  final String x; // date
  final double y; // percent score
}

List<ScoreChartData> getScoreChartData(List<History> historyData, int range) {
  List<ScoreChartData> data = [];
  bool testOnlyOneDate = true;
  double percentAvgScorePerDay = 0.0;
  int sumScorePerDay = 0;
  int countTestPerDay = 0;
  int idx = 1;
  if (historyData.isNotEmpty) {
    String currDate = convertDateTime(historyData[0].createdAt);
    String prevDate = currDate;

    for (History h in historyData) {
      if (data.length == range) {
        break;
      }

      currDate = convertDateTime(h.createdAt);

      if (prevDate == currDate) {
        countTestPerDay++;
        sumScorePerDay += h.totalScore;
      } else {
        idx++;
        // set testOnlyOneDate flag
        testOnlyOneDate = false;

        // if last elem
        if (idx == range + 1) {
          percentAvgScorePerDay = _calPercentAvgScore(
              sumScorePerDay, countTestPerDay, stroopTotalQuestionsAmount);
          data.add(ScoreChartData(currDate, percentAvgScorePerDay));
        } else {
          // cal avg score of prev
          percentAvgScorePerDay = _calPercentAvgScore(
              sumScorePerDay, countTestPerDay, stroopTotalQuestionsAmount);
          data.add(ScoreChartData(prevDate, percentAvgScorePerDay));

          // clear
          countTestPerDay = 0;
          sumScorePerDay = 0;

          countTestPerDay++;
          sumScorePerDay += h.totalScore;
        }
      }
      prevDate = currDate;
    }
    // check has test only 1 date
    if (testOnlyOneDate) {
      percentAvgScorePerDay = _calPercentAvgScore(
          sumScorePerDay, countTestPerDay, stroopTotalQuestionsAmount);
      data.add(ScoreChartData(prevDate, percentAvgScorePerDay));
    }
  }
  data = data.reversed.toList();
  return data;
}

double _calPercentAvgScore(int sum, int count, int max) {
  double percentAvg = 0.0;
  double avg = 0.0;
  avg = (sum / count);
  percentAvg = avg / max * 100;
  return percentAvg;
}
