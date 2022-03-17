import 'package:flutter/material.dart';
import 'package:speech_stroop/components/coustom_bottom_nav_bar.dart';
import 'package:speech_stroop/components/home_screen_appbar.dart';
import 'package:speech_stroop/enums.dart';
import 'package:speech_stroop/screens/history/components/body.dart';

Map registerReq = {};

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key key}) : super(key: key);
  static String routeName = "/history";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      appBar: HomeScreenAppBar('ประวัติการทดสอบ', true),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.history),
    );
  }
}
