import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:speech_stroop/model/auth.dart';

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
      this.healthScores);

  factory User.fromJson(dynamic json) {
    return User(
      json['tel'] as String,
      json['name'] as String,
      json['email'] as String,
      json['hnId'] as String,
      json['lastFourId'] as String,
      DateTime.parse(json['dateOfBirth']),
      json['gender'] as String,
      json['education'] as String,
      List<String>.from(json['historyId']),
      List<String>.from(json['badge']),
      json['peconditionId'] as String,
      UserHealthScore.fromJson(json['healthScores']),
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
      print(res.body);
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
