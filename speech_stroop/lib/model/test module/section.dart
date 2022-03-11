import './question.dart';

class Section {
  int section;
  Map<String, dynamic> score = {"congruent": null, "incongruent": null};
  int avgReactionTimeMs;
  List<Question> questions;
  String audioUrl;

  Section(this.section, this.score, this.avgReactionTimeMs, this.questions,
      this.audioUrl);
}
