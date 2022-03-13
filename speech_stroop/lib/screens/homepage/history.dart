import 'package:flutter/material.dart';
import 'package:speech_stroop/screens/auth/register2.dart';
import 'package:speech_stroop/screens/auth/register_stress.dart';
import 'package:speech_stroop/screens/components/appbar.dart';
import 'package:speech_stroop/screens/components/button/next_button.dart';

Map registerReq = {};

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({Key key}) : super(key: key);

  @override
  _HistoryWidgetState createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  TextEditingController telController;
  TextEditingController passwordController;
  bool passwordVisibility;
  TextEditingController confirmPasswordController;
  bool confirmPasswordVisibility;
  final formGlobalKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    telController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    confirmPasswordController = TextEditingController();
    confirmPasswordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Text("history");
  }
}
