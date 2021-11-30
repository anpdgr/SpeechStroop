import 'package:flutter/material.dart';
import 'package:speech_stroop/screens/register_stress.dart';

class Register2Widget extends StatefulWidget {
  const Register2Widget({Key key}) : super(key: key);

  @override
  _Register2WidgetState createState() => _Register2WidgetState();
}

class _Register2WidgetState extends State<Register2Widget> {
  TextEditingController textController4;
  TextEditingController textController5;
  TextEditingController textController6;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    textController6 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
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
            child: Form(
                key: formGlobalKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: TextFormField(
                          controller: textController4,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'ชื่อผู้ใช้',
                            labelStyle: const TextStyle(
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
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.name,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'โปรดระบุชื่อผู้ใช้';
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: TextFormField(
                        controller: textController5,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'อีเมลล์',
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
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          bool isEmailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val);
                          if (val.isEmpty) {
                            return 'โปรดระบุอีเมลล์';
                          } else if (!isEmailValid) {
                            return 'โปรดระบุอีเมลล์ให้ถูกต้อง';
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
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: TextFormField(
                        controller: textController6,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'เลขบัตรประชาชน 4 ตัวท้าย',
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
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          if (val.length != 4) {
                            return 'โปรดระบุเลขบัตรประชาชน 4 ตัวท้าย';
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
                                                const StressRegisterWidget()));
                                  }
                                },
                                child: const Text('ถัดไป'),
                                style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    primary: Colors.deepPurpleAccent,
                                    textStyle: const TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'BaiJamjuree'))),
                          )),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
