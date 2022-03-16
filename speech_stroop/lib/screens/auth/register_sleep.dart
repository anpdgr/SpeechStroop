import 'package:flutter/material.dart';
import 'package:speech_stroop/screens/auth/register.dart';
import 'package:speech_stroop/screens/precondition_test/color_test.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class SleepRegisterScreen extends StatefulWidget {
  const SleepRegisterScreen({Key key}) : super(key: key);
  static String routeName = "/register_sleep";

  @override
  _SleepRegisterScreenState createState() => _SleepRegisterScreenState();
}

class _SleepRegisterScreenState extends State<SleepRegisterScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formGlobalKey = GlobalKey<FormState>();

  double _radioValue1 = 1;
  double _radioValue2 = 1;
  double _radioValue3 = 1;
  double _radioValue4 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
        title: const Text(
          'แบบสอบถามการนอนหลับ',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 21),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 5,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
              child: SingleChildScrollView(
                child: Form(
                    key: formGlobalKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: Text(
                            'โปรดตอบความรู้สึกของคุณในรอบ 1 เดือนที่ผ่านมา ',
                            style: TextStyle(
                              color: Color(0xFF9489FA),
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text(
                            '1 = ไม่เคย, 2 = บางครั้ง, 3 = บ่อยครั้ง, 4 = ทุกครั้ง',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFD5B5FF),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              '1. ฉันรู้สึกหลับยาก',
                              style: TextStyle(
                                color: Color(0xFF3F3F3F),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Slider(
                          value: _radioValue1,
                          min: 1,
                          max: 4,
                          divisions: 3,
                          label: _radioValue1.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _radioValue1 = value;
                            });
                          },
                        ),
                        // Row(
                        //   mainAxisSize: MainAxisSize.max,
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: const [
                        //     Text(
                        //       'ไม่เคย',
                        //       style: TextStyle(
                        //         color: Color(0xFF3F3F3F),
                        //         fontSize: 15,
                        //       ),
                        //     ),
                        //     Text(
                        //       'บางครั้ง',
                        //       style: TextStyle(
                        //         color: Color(0xFF3F3F3F),
                        //         fontSize: 15,
                        //       ),
                        //     ),
                        //     Text(
                        //       'บ่อยครั้ง',
                        //       style: TextStyle(
                        //         color: Color(0xFF3F3F3F),
                        //         fontSize: 15,
                        //       ),
                        //     ),
                        //     Text(
                        //       'ทุกครั้ง',
                        //       style: TextStyle(
                        //         color: Color(0xFF3F3F3F),
                        //         fontSize: 15,
                        //       ),
                        //     )
                        //   ],
                        // ),
                        const Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              '2. ฉันรู้สึกตื่นง่ายเมื่อมีเสียงรบกวน',
                              style: TextStyle(
                                color: Color(0xFF3F3F3F),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Slider(
                          value: _radioValue2,
                          min: 1,
                          max: 4,
                          divisions: 3,
                          label: _radioValue2.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _radioValue2 = value;
                            });
                          },
                        ),
                        //3
                        const Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              '3. ฉันรู้สึกสดชื่นหลังตื่นนอน',
                              style: TextStyle(
                                color: Color(0xFF3F3F3F),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Slider(
                          value: _radioValue3,
                          min: 1,
                          max: 4,
                          divisions: 3,
                          label: _radioValue3.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _radioValue3 = value;
                            });
                          },
                        ),
                        const Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              '4. ฉันรู้สึกชั่วโมงการนอนหลับของฉันเพียงพอ',
                              style: TextStyle(
                                color: Color(0xFF3F3F3F),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Slider(
                          value: _radioValue4,
                          min: 1,
                          max: 4,
                          divisions: 3,
                          label: _radioValue4.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _radioValue4 = value;
                            });
                          },
                        ),
                        Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 20, 0, 5),
                            child: SizedBox(
                              width: 191,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (formGlobalKey.currentState.validate()) {
                                      formGlobalKey.currentState.save();
                                      registerReq = {
                                        ...registerReq,
                                        'sleep': _radioValue1 +
                                            _radioValue2 +
                                            _radioValue3 +
                                            _radioValue4
                                      };
                                      var res = await http.post(
                                          Uri.parse(
                                              "http://localhost:3000/auth/register"),
                                          headers: {
                                            'Content-Type': 'application/json'
                                          },
                                          body: jsonEncode(
                                            registerReq,
                                          ));
                                      print(res.body);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ColorTestScreen()));
                                    }
                                  },
                                  child: const Text('เสร็จสิ้น'),
                                  style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      primary: Colors.deepPurpleAccent,
                                      textStyle: const TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'BaiJamjuree'))),
                            )),
                      ],
                    )),
              ),
            ),
            // Expanded(
            //   child: Align(
            //     alignment: const AlignmentDirectional(0, 1),
            //     child: Image.asset(
            //       'assets/images/motivation-amico.png',
            //       width: MediaQuery.of(context).size.width,
            //       height: MediaQuery.of(context).size.height * 0.55,
            //       fit: BoxFit.fitHeight,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
