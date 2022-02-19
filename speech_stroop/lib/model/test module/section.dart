import './question.dart';

class Section {
  int section;
  Map<String, dynamic> score = {"congruent": null, "incongruent": null};
  int avgReactionTime;
  List<Question> questions;
  String audioUrl;

  Section(this.section, this.score, this.avgReactionTime, this.questions,
      this.audioUrl);
}
