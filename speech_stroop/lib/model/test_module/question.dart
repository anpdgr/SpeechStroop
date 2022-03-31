class Question {
  int questionNumber;
  Map<String, String> problem = {"color": null, "word": null};
  String condition;
  String expectedAnswer;
  String userAnswer;
  int startAt;
  int answerAt;
  int reactionTimeMs;

  Question(
      this.questionNumber,
      this.problem,
      this.condition,
      this.expectedAnswer,
      this.userAnswer,
      this.startAt,
      this.answerAt,
      this.reactionTimeMs);

  factory Question.fromJson(dynamic json) {
    return Question(
      json['questionNumber'] as int,
      Map<String, String>.from(json['problem']),
      json['condition'] as String,
      json['expectedAnswer'] as String,
      json['userAnswer'] as String,
      json['startAt'] as int,
      json['answerAt'] as int,
      json['reactionTimeMs'] as int,
    );
  }

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
