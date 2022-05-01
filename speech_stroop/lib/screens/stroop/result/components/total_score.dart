import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ScoreData {
  ScoreData(this.x, this.y);
  final String x;
  final int y;
}

class TotalScore extends StatefulWidget {
  const TotalScore(this.totalScore, {Key key}) : super(key: key);
  final int totalScore;

  @override
  TotalScoreState createState() => TotalScoreState();
}

class TotalScoreState extends State<TotalScore> {
  List<ScoreData> scoreData;
  TooltipBehavior _tooltipBehavior;
  int totalScore = 0;
  List<ScoreData> getChartData() {
    final List<ScoreData> scoreData = [
      ScoreData('คะแนนรวม', totalScore),
      ScoreData('คะแนนที่เหลือ', stroopTotalQuestionsAmount - totalScore),
    ];
    return scoreData;
  }

  @override
  void initState() {
    totalScore = widget.totalScore;
    scoreData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SfCircularChart(
                palette: <Color>[secondaryColor, Colors.indigo[50]],
                //tooltipBehavior: TooltipBehavior(enable: true),
                // legend: Legend(
                //   isVisible: true,
                // ),
                tooltipBehavior: _tooltipBehavior,
                series: <CircularSeries>[
                  DoughnutSeries<ScoreData, String>(
                    cornerStyle: totalScore == 0 ||
                            totalScore == stroopTotalQuestionsAmount
                        ? CornerStyle.bothFlat
                        : CornerStyle.bothCurve,
                    radius: "120",
                    innerRadius: "100.0",
                    dataSource: scoreData,
                    xValueMapper: (ScoreData data, _) => data.x,
                    yValueMapper: (ScoreData data, _) => data.y,
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      'คะแนนรวม',
                      style: textTheme().headlineSmall,
                    ),
                    Text(
                      '${totalScore}',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
