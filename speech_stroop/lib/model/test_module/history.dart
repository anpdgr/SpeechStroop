import 'dart:convert';

import 'package:speech_stroop/model/auth.dart';
import 'package:speech_stroop/model/test_module/health_scores.dart';
import 'package:http/http.dart' as http;
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
      DateTime.parse(json['createdAt']),
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
  if (true) {
    //userHistory == null
    var token = auth.token;
    var res = await http.get(
      Uri.parse("http://localhost:3000/history"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print("/history ${res.statusCode}");
    if (res.statusCode == 200) {
      print(res.body);
      Iterable l = json.decode(res.body);
      userHistory = List<History>.from(l.map((data) => History.fromJson(data)));
    } else {
      //TODO: handle
    }
  }
}

List highestScoresList;
List<int> getHighestScores() {
  List<History> userHistorySortedByTotalScore = userHistory;
  userHistorySortedByTotalScore
      .sort((b, a) => a.totalScore.compareTo(b.totalScore));

  highestScoresList =
      userHistorySortedByTotalScore.map((item) => item.totalScore).toList();
  return highestScoresList;
}

List latesScoresList;
List<int> getlatesScores() {
  List<History> userHistorySortedByDate = userHistory;
  userHistorySortedByDate.sort((b, a) => a.createdAt.compareTo(b.createdAt));

  latesScoresList =
      userHistorySortedByDate.map((item) => item.totalScore).toList();
  return latesScoresList;
}
