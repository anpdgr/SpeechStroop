import 'package:flutter/material.dart';
import 'package:speech_stroop/screens/color_test.dart';
import 'package:speech_stroop/screens/register.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetWidgetState createState() => _LoginWidgetWidgetState();
}

class _LoginWidgetWidgetState extends State<LoginWidget> {
  TextEditingController emailController;
  TextEditingController telController;
  TextEditingController passwordController;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
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
                      'assets/images/Hongkong-pana.png',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(-0.9, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      child: Text(
                        'เข้าสู่ระบบ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 28,
                        ),
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
                            fontFamily: 'Bai Jamjuree',
                            fontWeight: FontWeight.w300,
                          ),
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
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Bai Jamjuree',
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.phone,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Phone number is required';
                          }
                          if (val.length != 10) {
                            return 'Phone number requires 10 numbers.';
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
                          borderRadius: BorderRadius.circular(10),
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
                          return 'Password is required at least 8 characters';
                        }
                      },
                    ),
                  ),
                  Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                      child: SizedBox(
                        width: 350,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              if (formGlobalKey.currentState.validate()) {
                                formGlobalKey.currentState.save();
                                print(passwordController.text);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const RegisterWidget()));
                              }
                            },
                            child: const Text('เข้าสู่ระบบ'),
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                primary: Colors.deepPurpleAccent,
                                textStyle: const TextStyle(
                                    fontSize: 18, fontFamily: 'BaiJamjuree'))),
                      )),
                  Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                      child: SizedBox(
                          width: 350,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterWidget()));
                            },
                            child: const Text(
                              'สมัครสมาชิก',
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'BaiJamjuree',
                                    color: Colors.deepPurpleAccent)),
                          ))),
                  TextButton(
                      onPressed: () {
                        print('Login as guest');
                      },
                      child: const Text('เข้าสู่ระบบแบบ guest'),
                      style: TextButton.styleFrom(
                          shape: const StadiumBorder(),
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'BaiJamjuree',
                              color: Colors.deepPurpleAccent)))
                ],
              )),
        ),
      ),
    );
  }
}
