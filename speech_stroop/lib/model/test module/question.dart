class Question {
  int questionNumber;
  Map<String, String> problem = {"color": null, "word": null};
  String condition;
  String expectedAnswer;
  String userAnswer;
  DateTime startAt;
  DateTime answerAt;
  double reactionTimeMs;

  Question(
      this.questionNumber,
      this.problem,
      this.condition,
      this.expectedAnswer,
      this.userAnswer,
      this.startAt,
      this.answerAt,
      this.reactionTimeMs);

  Map<String, dynamic> toJson() {
    return {
      "questionNumber": questionNumber,
      "problem": problem,
      "condition": condition,
      "expectedAnswer": expectedAnswer,
      "userAnswer": userAnswer,
      "startAt": startAt,
      "answerAt": answerAt,
      "reactionTimeMs": reactionTimeMs,
    };
  }
}
