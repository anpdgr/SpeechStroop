import './question.dart';

class Section {
  int section;
  Map<String, dynamic> score = {"congruent": null, "incongruent": null};
  double avgReactionTimeMs;
  List<Question> questions;
  String audioUrl;

  Section(this.section, this.score, this.avgReactionTimeMs, this.questions,
      this.audioUrl);

  Map<String, dynamic> toJson() {
    return {
      "section": section,
      "score": score,
      "avgReactionTimeMs": avgReactionTimeMs,
      "questions": questions,
      "audioUrl": audioUrl
    };
  }
}
