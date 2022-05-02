import 'package:flutter/material.dart';

import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/components/button/secondary_button.dart';

import 'package:speech_stroop/model/auth.dart';

import 'package:speech_stroop/screens/auth/components/text_form_field.dart';
import 'package:speech_stroop/screens/auth/terms_conditions.dart';
import 'package:speech_stroop/screens/home/home_screen.dart';
import 'package:speech_stroop/theme.dart';
import 'package:speech_stroop/constants.dart';

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
  String authText = '';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Form(
              key: formGlobalKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      child: TextFormFieldCustom(
                        telController,
                        'เบอร์โทรศัพท์',
                        TextInputType.phone,
                        (val) {
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
                          borderRadius: BorderRadius.circular(10),
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
                    ),
                  ),
                  Text(
                    authText,
                    style: textTheme().bodyMedium.apply(
                          color: const Color(0xFFDA4F2C),
                        ),
                  ),
                  PrimaryButton('เข้าสู่ระบบ', () async {
                    if (formGlobalKey.currentState.validate()) {
                      formGlobalKey.currentState.save();
                      var res = await login(
                          telController.text, passwordController.text);
                      if (res.statusCode == 200) {
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      } else if (res.statusCode == 404) {
                        setState(() {
                          authText = 'เบอร์โทรศัพท์นี้ยังไม่ถูกลงทะเบียน';
                        });
                      } else if (res.statusCode == 401) {
                        setState(() {
                          authText = 'เบอร์โทรศัพท์หรือรหัสผ่านไม่ถูกต้อง';
                        });
                      } else {
                        setState(() {
                          authText = 'โปรดลองอีกครั้ง';
                        });
                      }
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
                          },
                          child: const Text('ลืมรหัสผ่าน'),
                          style: TextButton.styleFrom(
                              shape: const StadiumBorder(),
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'BaiJamjuree',
                                  color: Color(0xFF838383))))),

                  //TODO: DELETE ME!!!! (for admin)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          var res = await login("0000000001", "00000000");
                          if (res.statusCode == 200) {
                            Navigator.pushNamed(context, HomeScreen.routeName);
                          } else {
                            print('รหัสผ่านไม่ตรง');
                          }
                        },
                        child: Text(
                          "Developer",
                          style: textTheme()
                              .labelLarge
                              .apply(color: secondaryColor),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          var res = await login("0900000000", "00000000");
                          if (res.statusCode == 200) {
                            Navigator.pushNamed(context, HomeScreen.routeName);
                          } else {
                            print('รหัสผ่านไม่ตรง');
                          }
                        },
                        child: Text("มานะ",
                            style: textTheme()
                                .labelLarge
                                .apply(color: secondaryColor)),
                      ),
                      TextButton(
                        onPressed: () async {
                          var res = await login("0000000090", "00000000");
                          if (res.statusCode == 200) {
                            Navigator.pushNamed(context, HomeScreen.routeName);
                          } else {
                            print('รหัสผ่านไม่ตรง');
                          }
                        },
                        child: Text("มารวย ไม่เคยทำ test",
                            style: textTheme()
                                .labelLarge
                                .apply(color: secondaryColor)),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
