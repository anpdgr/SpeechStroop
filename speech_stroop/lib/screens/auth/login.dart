import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:speech_stroop/screens/auth/register.dart';
import 'package:speech_stroop/screens/auth/terms_conditions.dart';
import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/components/button/secondary_button.dart';
import 'package:speech_stroop/screens/stroop/stroop_test/stroop_test.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  static String routeName = "/login";

  @override
  _LoginScreenWidgetState createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreen> {
  TextEditingController telController;
  TextEditingController passwordController;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    telController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: const Color(0xFFFBFBFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Form(
              key: formGlobalKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: Image.asset(
                      'assets/images/login.png',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      child: Text(
                        'เข้าสู่ระบบ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF37265F)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: TextFormField(
                        controller: telController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'เบอร์โทรศัพท์',
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFA7A5A5),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFA7A5A5),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.phone,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'โปรดระบุเบอร์โทรศัพท์';
                          }
                          if (val.length != 10) {
                            return 'เบอร์โทรศัพท์ประกอบไปด้วย 10 ตัวอักษร';
                          }
                          return null;
                        },
                        onChanged: (val) {
                          if (formGlobalKey.currentState.validate()) {
                            formGlobalKey.currentState.save();
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: !passwordVisibility,
                      decoration: InputDecoration(
                        labelText: 'รหัสผ่าน',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFA7A5A5),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFA7A5A5),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => passwordVisibility = !passwordVisibility,
                          ),
                          child: Icon(
                            passwordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xFF757575),
                            size: 22,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      validator: (val) {
                        if (val.length >= 8) {
                          return null;
                        } else {
                          return 'รหัสผ่านต้องมีความยาวอย่างน้อย 8 ตัวอักษร';
                        }
                      },
                      onChanged: (val) {
                        if (formGlobalKey.currentState.validate()) {
                          formGlobalKey.currentState.save();
                        }
                      },
                    ),
                  ),
                  PrimaryButton('เข้าสู่ระบบ', () async {
                    if (formGlobalKey.currentState.validate()) {
                      formGlobalKey.currentState.save();
                      var res = await http.post(
                          Uri.parse("http://localhost:3000/auth/login"),
                          headers: {'Content-Type': 'application/json'},
                          body: jsonEncode({
                            "tel": telController.text,
                            "password": passwordController.text,
                          }));
                      print(res.body);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             const ColorTestScreen()));
                    }
                  }),
                  SecondaryButton(
                      'สมัครสมาชิก',
                      () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TermsConditionsScreen()))
                          }),
                  Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: TextButton(
                          onPressed: () {
                            print('Forget password');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const StroopTestScreen()));
                          },
                          child: const Text('ลืมรหัสผ่าน'),
                          style: TextButton.styleFrom(
                              shape: const StadiumBorder(),
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'BaiJamjuree',
                                  color: Color(0xFF838383)))))
                ],
              )),
        ),
      ),
    );
  }

  showBottomModal(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0, // has the effect of softening the shadow
                    spreadRadius: 0.0, // has the effect of extending the shadow
                  )
                ],
              ),
              alignment: Alignment.topLeft,
              child: ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 5, left: 10),
                        child: const Text(
                          "Terms and conditions",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.deepPurpleAccent),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 5, right: 5),
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterScreen()));
                                  },
                                  child: const Text(
                                    "ยอมรับ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  )))),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color(0xfff8f8f8),
                          width: 1,
                        ),
                      ),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.justify,
                            text: const TextSpan(
                                text: """Terms and conditions body""",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.black,
                                    wordSpacing: 0.5)),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
