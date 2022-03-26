import 'package:flutter/material.dart';
import 'package:speech_stroop/components/coustom_bottom_nav_bar.dart';
import 'package:speech_stroop/components/home_screen_appbar.dart';
import 'package:speech_stroop/enums.dart';
import 'package:speech_stroop/screens/profile/components/body.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Map registerReq = {};
var userProfile;

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
  var res = await http.get(
    Uri.parse("http://localhost:3000/user/profile"),
    headers: {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MjNlYjU0ZjUxODg0NTIwYTRkZThlOTUiLCJpYXQiOjE2NDgyNzY4MjZ9.MGGqHkHGBBQps-wzrtTPTHv4lRY4yLatgUE5QNELdLE',
    },
  );
  print(res.body);
  print("res type:" + res.body.runtimeType.toString());
  return res.body;
}
