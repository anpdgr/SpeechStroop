import 'package:flutter/material.dart';
import 'package:speech_stroop/screens/color_test.dart';

class SleepRegisterWidget extends StatefulWidget {
  const SleepRegisterWidget({Key key}) : super(key: key);

  @override
  _SleepRegisterWidgetState createState() => _SleepRegisterWidgetState();
}

class _SleepRegisterWidgetState extends State<SleepRegisterWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formGlobalKey = GlobalKey<FormState>();

  double _currentSliderValue = 1;

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
                        const Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              'การนอนหลับพักผ่อนใน 15 วันที่ผ่านมา',
                              style: TextStyle(
                                color: Color(0xFF3F3F3F),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Slider(
                          value: _currentSliderValue,
                          min: 1,
                          max: 9,
                          divisions: 8,
                          label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                          },
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'พักผ่อนน้อย',
                              style: TextStyle(
                                color: Color(0xFF3F3F3F),
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'พักผ่อนปานกลาง',
                              style: TextStyle(
                                color: Color(0xFF3F3F3F),
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'พักผ่อนมาก',
                              style: TextStyle(
                                color: Color(0xFF3F3F3F),
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 30, 0, 5),
                            child: SizedBox(
                              width: 191,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (formGlobalKey.currentState.validate()) {
                                      formGlobalKey.currentState.save();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ColorTestWidget()));
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
            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0, 1),
                child: Image.asset(
                  'assets/images/motivation-amico.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.55,
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
