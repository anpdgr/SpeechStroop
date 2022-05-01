import 'package:flutter/material.dart';
import 'package:speech_stroop/components/custom_appbar.dart';
import 'package:speech_stroop/components/coustom_bottom_nav_bar.dart';
import 'package:speech_stroop/enums.dart';
import 'package:speech_stroop/screens/history/components/body.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key key}) : super(key: key);
  static String routeName = "/history";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      appBar: const CustomAppBar('ประวัติการทดสอบ', false),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.history),
    );
  }
}
