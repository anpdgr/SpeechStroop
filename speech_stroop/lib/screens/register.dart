import 'package:flutter/material.dart';
import 'package:speech_stroop/screens/register2.dart';
import 'package:speech_stroop/screens/register_stress.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  bool passwordVisibility1;
  TextEditingController textController3;
  bool passwordVisibility2;
  TextEditingController textController4;
  TextEditingController textController5;
  TextEditingController textController6;
  final formGlobalKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility1 = false;
    textController3 = TextEditingController();
    passwordVisibility2 = false;
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    textController6 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formGlobalKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          iconTheme: const IconThemeData(color: Colors.white),
          automaticallyImplyLeading: true,
          title: const Text(
            'สมัครสมาชิก',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          centerTitle: true,
          elevation: 5,
        ),
        backgroundColor: const Color(0xFFFBFBFF),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: TextFormField(
                      controller: textController1,
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
                    controller: textController2,
                    obscureText: !passwordVisibility1,
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
                          () => passwordVisibility1 = !passwordVisibility1,
                        ),
                        child: Icon(
                          passwordVisibility1
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: const Color(0xFF757575),
                          size: 22,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: TextFormField(
                    controller: textController3,
                    obscureText: !passwordVisibility2,
                    decoration: InputDecoration(
                      labelText: 'ยืนยันรหัสผ่าน',
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
                      suffixIcon: InkWell(
                        onTap: () => setState(
                          () => passwordVisibility2 = !passwordVisibility2,
                        ),
                        child: Icon(
                          passwordVisibility2
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: const Color(0xFF757575),
                          size: 22,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      fontFamily: 'Bai Jamjuree',
                      fontWeight: FontWeight.w300,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (val) {
                      if (val == textController2.text) {
                        return null;
                      } else {
                        return 'ยืนยันรหัสผ่านไม่ถูกต้อง';
                      }
                    },
                    onChanged: (val) {
                      if (formGlobalKey.currentState.validate()) {
                        formGlobalKey.currentState.save();
                      }
                    },
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.9, 0),
                  child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 5),
                      child: SizedBox(
                        width: 90,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              if (formGlobalKey.currentState.validate()) {
                                formGlobalKey.currentState.save();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Register2Widget()));
                              }
                            },
                            child: const Text('ถัดไป'),
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                primary: Colors.deepPurpleAccent,
                                textStyle: const TextStyle(
                                    fontSize: 18, fontFamily: 'BaiJamjuree'))),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}