import 'package:speech_stroop/model/test_module/health_scores.dart';

import './section.dart';
import 'dart:convert';

class History {
  String _id;
  String userId;
  int totalScore;
  List<Section> sections;
  HealthScores healthScores;
  List<String> badge;

  History(this.totalScore, this.sections, [this.healthScores, this.badge]);

  Map<String, dynamic> toJson() {
    return {
      "totalScore": totalScore,
      "sections": sections,
      "healthScores": healthScores,
      "badge": badge
    };
  }
}
