import 'package:flutter/material.dart';
import 'package:speech_stroop/components/coustom_bottom_nav_bar.dart';
import 'package:speech_stroop/components/home_screen_appbar.dart';
import 'package:speech_stroop/enums.dart';
import 'package:speech_stroop/model/auth.dart';
import 'package:speech_stroop/model/user.dart';
import 'package:speech_stroop/screens/auth/login.dart';
import 'package:speech_stroop/screens/profile/components/body.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Map registerReq = {};
User userProfile;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppBar('ข้อมูลส่วนตัว', true),
      body: const Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}

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
      userProfile = User.fromJson(jsonDecode(res.body));
    } else {
      //TODO: handle
    }
    print(userProfile);
  }
  return userProfile;
}
