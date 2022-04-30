import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:speech_stroop/model/auth.dart';
import 'package:speech_stroop/model/precondition.dart';
import 'package:speech_stroop/model/user.dart';

class UpdateUser {
  String tel;
  String name;
  String email;
  DateTime dateOfBirth;
  String gender;
  String education;
  Precondition precondition;

  UpdateUser({
    this.tel,
    this.name,
    this.email,
    this.dateOfBirth,
    this.gender,
    this.education,
    this.precondition,
  });

  factory UpdateUser.fromJson(dynamic json) {
    return UpdateUser(
      tel: json['tel'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      gender: json['gender'] as String,
      education: json['education'] as String,
      precondition: Precondition.fromJson(json['precondition']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "tel": tel,
      "name": name,
      "email": email,
      "dateOfBirth": dateOfBirth.toIso8601String(),
      "gender": gender,
      "education": education,
      "precondition": precondition,
    };
  }
}

updateUserProfile(UpdateUser updatedUser) async {
  String token = auth.token;
  print("jsonEncode(updatedUser):" + jsonEncode(updatedUser));
  var res = await http.patch(Uri.parse("http://localhost:3000/user/profile"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(updatedUser));

  print("patch: /user/profile " + res.statusCode.toString());

  //TODO: handle
  if (res.statusCode == 200) {
    print(res.body);
    await getUserProfile(true);
  } else {}

  return updatedUser;
}
