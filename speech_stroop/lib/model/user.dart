import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:speech_stroop/model/auth.dart';
import 'package:speech_stroop/model/precondition.dart';

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
  Precondition precondition;
  UserHealthScore healthScores;

  User(
    this.tel,
    this.name,
    this.email,
    this.lastFourId,
    this.dateOfBirth,
    this.gender,
    this.education,
    this.healthScores,
    this.precondition, [
    this.password,
    this.hnId,
    this.historyId,
    this.badge,
  ]);

  factory User.fromJson(dynamic json) {
    List<String> historyId =
        json['historyId'] != null ? List<String>.from(json['historyId']) : [];

    List<String> badge =
        json['badge'] != null ? List<String>.from(json['badge']) : [];

    return User(
      json['tel'] as String,
      json['name'] as String,
      json['email'] as String,
      json['lastFourId'] as String,
      DateTime.parse(json['dateOfBirth'] as String),
      json['gender'] as String,
      json['education'] as String,
      UserHealthScore.fromJson(json['healthScores']),
      Precondition.fromJson(json['precondition']),
      json['password'] as String,
      json['hnId'] as String,
      historyId,
      badge,
    );
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
      "precondition": precondition,
      "password": password,
      "hnId": hnId,
      "historyId": historyId,
      "badge": badge,
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
    print("/user/profile " + res.statusCode.toString());
    if (res.statusCode == 200) {
      userProfile = User.fromJson(jsonDecode(res.body));
    } else {
      //TODO: handle
    }
    print(userProfile.toJson());
  }
  return userProfile;
}

updateUserProfile() async {
  String token = auth.token;
  var res = await http.post(Uri.parse("http://localhost:3000/user/profile"),
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(userProfile));

  print("/user/profile " + res.statusCode.toString());

  //TODO: handle
  if (res.statusCode == 200) {
    print(res.body);
  } else {}
  print(userProfile.toJson());

  return userProfile;
}
