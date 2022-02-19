import 'package:mongo_dart/mongo_dart.dart';

import './section.dart';

class History {
  String _id;
  String userId;
  int totalScore;
  List<Section> sections;
  Map<String, Map<String, int>> healthScores;

  History(this.userId, this.totalScore, this.sections, this.healthScores);
}
