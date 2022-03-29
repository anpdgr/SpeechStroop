import 'package:flutter/material.dart';
import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/model/auth.dart';
import 'package:speech_stroop/model/user.dart';
import 'package:speech_stroop/screens/auth/login.dart';
import 'package:speech_stroop/screens/profile/components/precondition_box.dart';
import 'package:speech_stroop/screens/profile/components/profile_form.dart';
import 'package:speech_stroop/screens/profile/components/profile_pic.dart';
import 'package:speech_stroop/screens/profile/components/profile_save_modal.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Center(
            child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            Text(
              userProfile.name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              ),
            ),
            const SizedBox(height: 5),
            const ProfileForm(),
            PrimaryButton(
                "แก้ไขข้อมูล",
                () => {
                      showSimpleModalDialog(context),
                    }),
            PreconditionBox("ทดสอบการจำแนกสี"),
            PreconditionBox("ทดสอบการอ่าน"),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                print('log out');
                logout();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: Text(
                'ออกจากระบบ',
                style: TextStyle(
                    color: secondaryColor,
                    decoration: TextDecoration.underline),
              ),
            )
          ],
        )));
  }

  showSimpleModalDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const ProfileSaveModal();
        });
  }
}
