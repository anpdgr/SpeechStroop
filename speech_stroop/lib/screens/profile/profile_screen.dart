import 'package:flutter/material.dart';
import 'package:speech_stroop/components/coustom_bottom_nav_bar.dart';
import 'package:speech_stroop/components/home_screen_appbar.dart';
import 'package:speech_stroop/enums.dart';
import 'package:speech_stroop/screens/profile/components/body.dart';

Map registerReq = {};

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
