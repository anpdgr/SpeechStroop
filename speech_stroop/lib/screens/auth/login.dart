import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:speech_stroop/model/auth.dart';
import 'package:speech_stroop/screens/auth/terms_conditions.dart';
import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/components/button/secondary_button.dart';
import 'package:speech_stroop/screens/home/home_screen.dart';
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
                          if (int.tryParse(val) == null) {
                            return 'โปรดกรอกตัวเลขเท่านั้น';
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

                      if (res.statusCode == 200) {
                        auth = Auth.fromJson(jsonDecode(res.body));
                        print("login success");
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      } else {} //TODO: handle failed login
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
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             RecordToStreamExample()));
                            // builder: (context) => AudioRecorderPage()));
                          },
                          child: const Text('ลืมรหัสผ่าน'),
                          style: TextButton.styleFrom(
                              shape: const StadiumBorder(),
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'BaiJamjuree',
                                  color: Color(0xFF838383))))),

                  //TODO: DELETE ME!!!! (for admin)
                  SecondaryButton('Developer', () async {
                    formGlobalKey.currentState.save();
                    var res = await http.post(
                        Uri.parse("http://localhost:3000/auth/login"),
                        headers: {'Content-Type': 'application/json'},
                        body: jsonEncode({
                          "tel": "0000000001",
                          "password": "00000000",
                        }));

                    if (res.statusCode == 200) {
                      auth = Auth.fromJson(jsonDecode(res.body));
                      print("login dev success");
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    } else {} //TODO: handle failed login
                  }),
                ],
              )),
        ),
      ),
    );
  }
}
