import 'package:speech_stroop/screens/register_sleep.dart';
import 'package:flutter/material.dart';

import 'components/radio_button.dart';

class StressRegisterWidget extends StatefulWidget {
  const StressRegisterWidget({Key key}) : super(key: key);

  @override
  _StressRegisterWidgetState createState() => _StressRegisterWidgetState();
}

enum StressLevel { never, rarely, sometimes, frequently, always }

class _StressRegisterWidgetState extends State<StressRegisterWidget> {
  int _radioValue1 = 0;
  int _radioValue2 = 0;
  int _radioValue3 = 0;
  int _radioValue4 = 0;
  int _radioValue5 = 0;
  int _radioValue6 = 0;
  int _radioValue7 = 0;
  int _radioValue8 = 0;
  int _radioValue9 = 0;
  int _radioValue10 = 0;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;
    });
  }

  void _handleRadioValueChange3(int value) {
    setState(() {
      _radioValue3 = value;
    });
  }

  void _handleRadioValueChange4(int value) {
    setState(() {
      _radioValue4 = value;
    });
  }

  void _handleRadioValueChange5(int value) {
    setState(() {
      _radioValue5 = value;
    });
  }

  void _handleRadioValueChange6(int value) {
    setState(() {
      _radioValue6 = value;
    });
  }

  void _handleRadioValueChange7(int value) {
    setState(() {
      _radioValue7 = value;
    });
  }

  void _handleRadioValueChange8(int value) {
    setState(() {
      _radioValue8 = value;
    });
  }

  void _handleRadioValueChange9(int value) {
    setState(() {
      _radioValue9 = value;
    });
  }

  void _handleRadioValueChange10(int value) {
    setState(() {
      _radioValue10 = value;
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
        title: const Text(
          'แบบสอบถามด้านความเครียด',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 21),
        ),
        centerTitle: true,
        elevation: 5,
      ),
      backgroundColor: const Color(0xFFFBFBFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
          child: SingleChildScrollView(
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
                    '1 = ไม่เคย, 2 = แทบจะไม่, 3 = บางครั้ง,\n4 = ค่อนข้างบ่อย, 5 = บ่อยมาก',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFD5B5FF),
                      fontSize: 18,
                    ),
                  ),
                ),
                const Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      '1. บ่อยแค่ไหนที่คุณรู้สึกไม่สบายใจเพราะมีสิ่งที่เกิดขึ้นอย่างไม่คาดคิด?',
                      style: TextStyle(
                        color: Color(0xFF3F3F3F),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                StressRadioButtons(_radioValue1, _handleRadioValueChange1),
                const Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      '2. บ่อยแค่ไหนที่คุณรู้สึกว่าคุณไม่สามารถควบคุมเรื่องสำคัญ ๆ ในชีวิตของคุณได้?',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xFF3F3F3F),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                StressRadioButtons(_radioValue2, _handleRadioValueChange2),
                const Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      '3. บ่อยแค่ไหนที่คุณรู้สึกกระสับกระส่าย และ ตึงเครียด?',
                      style: TextStyle(
                        color: Color(0xFF3F3F3F),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                StressRadioButtons(_radioValue3, _handleRadioValueChange3),
                const Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      '4. บ่อยแค่ไหนที่คุณรู้สึกว่าคุณควบคุมสถานการณ์ต่าง ๆ ได้?',
                      style: TextStyle(
                        color: Color(0xFF3F3F3F),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                StressRadioButtons(_radioValue4, _handleRadioValueChange4),
                const Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      '5. บ่อยแค่ไหนที่คุณรู้สึกมั่นใจในความสามารถของตนเองที่จะรับมือกับปัญหาส่วนตัวทั้งหลายได้?',
                      style: TextStyle(
                        color: Color(0xFF3F3F3F),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                StressRadioButtons(_radioValue5, _handleRadioValueChange5),
                const Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      '6. บ่อยแค่ไหนที่คุณรู้สึกว่าสิ่งทั้งหลายเป็นไปในทิศทางที่คุณต้องการ?',
                      style: TextStyle(
                        color: Color(0xFF3F3F3F),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                StressRadioButtons(_radioValue6, _handleRadioValueChange6),
                const Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      '7. บ่อยแค่ไหนที่คุณรู้สึกว่าคุณไม่สามารถจัดการกับสิ่งทั้งหลายทั้งที่เป็นสิ่งที่ล้วนเคยทำมาแล้ว?',
                      style: TextStyle(
                        color: Color(0xFF3F3F3F),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                StressRadioButtons(_radioValue7, _handleRadioValueChange7),
                const Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      '8. บ่อยแค่ไหนที่คุณรู้สึกว่าสามารถควบคุมสิ่งทั้งหลายที่มากวนใจได้?',
                      style: TextStyle(
                        color: Color(0xFF3F3F3F),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                StressRadioButtons(_radioValue8, _handleRadioValueChange8),
                const Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      '9. บ่อยแค่ไหนที่คุณโกรธอันเนื่องมาจากสิ่งที่นอกเหนือการควบคุมของคุณ?',
                      style: TextStyle(
                        color: Color(0xFF3F3F3F),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                StressRadioButtons(_radioValue9, _handleRadioValueChange9),
                const Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      '10. บ่อยแค่ไหนที่คุณรู้สึกว่าปัญหาต่างๆ ทับถมมากขึ้นจนคุณไม่สามารถแก้ไขได้หมด?',
                      style: TextStyle(
                        color: Color(0xFF3F3F3F),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                StressRadioButtons(_radioValue10, _handleRadioValueChange10),
                Align(
                  alignment: const AlignmentDirectional(0.9, 0),
                  child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 5),
                      child: SizedBox(
                        width: 90,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SleepRegisterWidget()));
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
