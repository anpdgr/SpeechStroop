import 'package:speech_stroop/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth {
  String _id;
  String token;

  Auth(this._id, this.token);
  factory Auth.fromJson(dynamic json) {
    return Auth(json['_id'] as String, json['token'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": _id,
      "token": token,
    };
  }
}

Auth auth;

logout() async {
  if (userProfile == null) {
    String token = auth.token;
    var res = await http.get(
      Uri.parse("http://localhost:3000/auth/logout"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (res.statusCode == 200) {
      print("log out");
      print(res.body);
    } else {
      //TODO: handle
    }
    userProfile = null;
  }
}
