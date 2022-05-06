import 'dart:convert';

import 'package:speech_stroop/model/auth.dart';
import 'package:speech_stroop/model/test_module/health_scores.dart';
import 'package:http/http.dart' as http;
import 'package:speech_stroop/screens/stroop/stroop_test/stroop_test.dart';
import 'package:speech_stroop/utils/logger.dart';
import 'package:tuple/tuple.dart';
import './section.dart';

class History {
  String _id;
  String userId;
  int totalScore;
  List<Section> sections;
  HealthScores healthScores;
  List<String> badge;
  DateTime createdAt;

  History(
    this.totalScore,
    this.sections, [
    this.healthScores,
    this.badge,
    this.createdAt,
  ]);

  factory History.fromJson(dynamic json) {
    List<Section> sections = List<Section>.from(
        json['sections'].map((data) => Section.fromJson(data)));

    List<String> badge =
        json['badge'] != null ? List<String>.from(json['badge']) : [];

    return History(
      json['totalScore'] as int,
      sections,
      HealthScores.fromJson(json['healthScores']),
      badge,
      DateTime.parse(json['createdAt']).toLocal(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "totalScore": totalScore,
      "sections": sections,
      "healthScores": healthScores,
      "badge": badge
    };
  }
}

List<History> userHistory;

//TODO: navigation
getHistory() async {
  var token = auth.token;
  var res = await http.get(
    Uri.parse("http://localhost:3000/history"),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );
  print("/history ${res.statusCode}");

  if (res.statusCode == 200) {
    Iterable l = json.decode(res.body);
    userHistory = List<History>.from(l.map((data) => History.fromJson(data)));
    userHistory.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  } else {
    logger.e("getHistory failed");
    //TODO: handle
  }
}

List highestScoresList;
List<Tuple2<int, DateTime>> getHighestScores() {
  if (userHistory.isEmpty) {
    return [];
  }
  List<History> userHistorySortedByTotalScore = userHistory;
  userHistorySortedByTotalScore
      .sort((b, a) => a.totalScore.compareTo(b.totalScore));

  highestScoresList = userHistorySortedByTotalScore
      .map((item) => Tuple2(
            item.totalScore,
            item.createdAt,
          ))
      .toList();
  return highestScoresList;
}

List latestScoresList;
List<Tuple2<int, DateTime>> getLatestScores() {
  if (userHistory.isEmpty) {
    return [];
  }
  List<History> userHistorySortedByDate = userHistory;
  userHistorySortedByDate.sort((b, a) => a.createdAt.compareTo(b.createdAt));

  latestScoresList = userHistorySortedByDate
      .map((item) => Tuple2(
            item.totalScore,
            item.createdAt,
          ))
      .toList();
  return latestScoresList;
}

Future<int> setHistory(
  int totalScore,
  List<Section> sections,
  HealthScores healthScores,
  List<String> badge,
) async {
  latestTest = History(totalScore, sections, healthScores, badge);
  var res = await http.post(Uri.parse("http://localhost:3000/history"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${auth.token}',
      },
      body: jsonEncode(latestTest));
  print("post: /history " + res.statusCode.toString());
  return res.statusCode;
}
