class HealthScores {
  HealthScore stress;
  HealthScore awake;

  HealthScores(this.stress, this.awake);

  Map<String, dynamic> toJson() {
    return {
      "stress": stress,
      "awake": awake,
    };
  }
}

class HealthScore {
  int start;
  int break1;
  int break2;
  int end;

  HealthScore(this.start, this.break1, this.break2, this.end);
  Map<String, dynamic> toJson() {
    return {
      "start": start,
      "break1": break1,
      "break2": break2,
      "end": end,
    };
  }
}
