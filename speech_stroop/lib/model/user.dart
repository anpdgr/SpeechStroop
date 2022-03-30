import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:speech_stroop/model/auth.dart';

class User {
  String _id;
  String tel;
  String password;
  String name;
  String email;
  String hnId;
  String lastFourId;
  DateTime dateOfBirth;
  String gender;
  String education;
  List<String> historyId;
  List<String> badge;
  String preconditionId;
  UserHealthScore healthScores;

  User(
    this.tel,
    this.name,
    this.email,
    this.lastFourId,
    this.dateOfBirth,
    this.gender,
    this.education,
    this.healthScores, [
    this.password,
    this.hnId,
    this.historyId,
    this.badge,
    this.preconditionId,
  ]);

  factory User.fromJson(dynamic json) {
    return User(
        json['tel'] as String,
        json['name'] as String,
        json['email'] as String,
        json['lastFourId'] as String,
        DateTime.parse(json['dateOfBirth'] as String),
        json['gender'] as String,
        json['education'] as String,
        UserHealthScore.fromJson(json['healthScores']),
        json['password'] as String,
        json['hnId'] as String,
        List<String>.from(json['historyId']),
        List<String>.from(json['badge']),
        json['preconditionId'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      "tel": tel,
      "name": name,
      "email": email,
      "lastFourId": lastFourId,
      "dateOfBirth": dateOfBirth.toIso8601String(),
      "gender": gender,
      "education": education,
      "healthScores": healthScores,
      "password": password,
      "hnId": hnId,
      "historyId": historyId,
      "badge": badge,
      "preconditionId": preconditionId,
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

User userProfile;

getUserProfile() async {
  if (userProfile == null) {
    String token = auth.token;
    var res = await http.get(
      Uri.parse("http://localhost:3000/user/profile"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (res.statusCode == 200) {
      print(res.body);
      userProfile = User.fromJson(jsonDecode(res.body));
    } else {
      //TODO: handle
    }
    print(userProfile.toJson());
  }
  return userProfile;
}
