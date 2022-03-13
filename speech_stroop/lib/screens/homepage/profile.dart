import 'package:flutter/material.dart';
import 'package:speech_stroop/screens/auth/login.dart';
import 'package:speech_stroop/screens/auth/register2.dart';
import 'package:speech_stroop/screens/auth/register_stress.dart';
import 'package:speech_stroop/screens/components/appbar.dart';
import 'package:speech_stroop/screens/components/button/next_button.dart';
import 'package:speech_stroop/screens/components/button/primary_button.dart';
import 'package:speech_stroop/screens/components/button/secondary_button.dart';

Map registerReq = {};

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
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
          title: const Text('ข้อมูลส่วนตัว'),
        ),
        body: Center(
            child: Column(
          children: [
            PrimaryButton(
                "แก้ไขข้อมูล",
                () => {
                      showSimpleModalDialog(context),
                    }),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                print('log out');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginWidget()));
              },
              child: const Text('ออกจากระบบ'),
            )
          ],
        )));
  }

  showSimpleModalDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 270),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context, false),
                        icon: const Icon(
                          Icons.close,
                          color: Color(0xFF37265F),
                        ),
                        iconSize: 30,
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: (const Text('ต้องการบันทึกหรือไม่',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xFF22005D),
                                fontFamily: 'BaiJamjuree',
                                wordSpacing: 1)))),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Column(children: [
                        PrimaryButton("บันทึก", () => {print('save')}),
                        SecondaryButton("ยกเลิก", () => {print('cancle')})
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
