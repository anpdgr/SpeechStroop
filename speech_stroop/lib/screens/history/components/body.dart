import 'package:flutter/material.dart';
import 'package:speech_stroop/components/button/primary_button.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
    return Scaffold(
        appBar: AppBar(
          title: const Text('ประวัติการทดสอบ'),
        ),
        body: Center(
            child: Container(
                child: (Column(
          children: [
            PrimaryButton("ดูประวัติทั้งหมด", () => {print(1)}),
          ],
        )))));
  }
}
