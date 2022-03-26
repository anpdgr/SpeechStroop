class User {
  String _id;
  String tel;
  String name;
  String email;
  String hnId;
  String lastFourId;
  DateTime dateOfBirth;
  String gender;
  String education;
  List<String> historyId;
  List<String> badge;
  String peconditionId;
  UserHealthScore healthScores;

  User(
      this.tel,
      this.name,
      this.email,
      this.hnId,
      this.lastFourId,
      this.dateOfBirth,
      this.gender,
      this.education,
      this.historyId,
      this.badge,
      this.peconditionId,
      this.healthScores); //TODO: add this!

  factory User.fromJson(dynamic json) {
    return User(
      json['tel'] as String,
      json['name'] as String,
      json['email'] as String,
      json['hnId'] as String,
      json['lastFourId'] as String,
      json['dateOfBirth'] as DateTime,
      json['gender'] as String,
      json['education'] as String,
      json['historyId'] as List<String>,
      json['badge'] as List<String>,
      json['peconditionId'] as String,
      json['healthScores'] as UserHealthScore,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "tel": tel,
      "name": name,
      "email": email,
      "hnId": hnId,
      "lastFourId": lastFourId,
      "dateOfBirth": dateOfBirth,
      "gender": gender,
      "education": education,
      "historyId": historyId,
      "badge": badge,
      "peconditionId": peconditionId,
      "healthScores": healthScores,
    };
  }
}

class UserHealthScore {
  int stress;
  int sleep;

  UserHealthScore(this.stress, this.sleep);
  factory UserHealthScore.fromJson(dynamic json) {
    return UserHealthScore(json['stress'] as int, json['sleep'] as int);
  }
  Map<String, dynamic> toJson() {
    return {
      "stress": stress,
      "sleep": sleep,
    };
  }
}
