import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speech_stroop/connectdb.dart';
import 'package:speech_stroop/main2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.purple, fontFamily: 'BaiJamjuree'),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      MongoDatabase.connect();
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: // Figma Flutter Generator LoginWidget - FRAME
          Container(
              width: 360,
              height: 640,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(251, 251, 255, 1),
              ),
              child: Stack(children: <Widget>[
                const Positioned(
                    top: 240,
                    left: 17,
                    child: Text(
                      'เข้าสู่ระบบ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(1, 1, 1, 1),
                          fontFamily: 'Bai Jamjuree',
                          fontSize: 24,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                Positioned(
                    top: 377,
                    left: 311,
                    child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 2.4689998626708984,
                                        left: 0,
                                        child: SizedBox(
                                            width: 24,
                                            height: 19.062002182006836,
                                            child: Stack(children: <Widget>[
                                              Positioned(
                                                  top: 1.2810001373291016,
                                                  left: 7.815000057220459,
                                                  child: SvgPicture.asset(
                                                      'assets/images/vector.svg',
                                                      semanticsLabel:
                                                          'vector')),
                                              Positioned(
                                                  top: 4.277539253234863,
                                                  left: 6.746532917022705,
                                                  child: SvgPicture.asset(
                                                      'assets/images/vector.svg',
                                                      semanticsLabel:
                                                          'vector')),
                                              Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  child: SvgPicture.asset(
                                                      'assets/images/vector.svg',
                                                      semanticsLabel:
                                                          'vector')),
                                            ]))),
                                  ]))),
                        ]))),
                const Positioned(
                    top: 287,
                    left: 17,
                    child: Text(
                      'อีเมลล์',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(81, 81, 81, 1),
                          fontFamily: 'Bai Jamjuree',
                          fontSize: 15,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                const Positioned(
                    top: 354,
                    left: 17,
                    child: Text(
                      'รหัสผ่าน',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(81, 81, 81, 1),
                          fontFamily: 'Bai Jamjuree',
                          fontSize: 15,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                Positioned(
                    top: 307,
                    left: 16,
                    child: Container(
                        width: 327,
                        height: 33,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          border: Border.all(
                            color: const Color.fromRGBO(180, 180, 180, 1),
                            width: 0.5,
                          ),
                        ))),
                Positioned(
                    top: 373,
                    left: 16,
                    child: Container(
                        width: 327,
                        height: 33,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          border: Border.all(
                            color: const Color.fromRGBO(180, 180, 180, 1),
                            width: 0.5,
                          ),
                        ))),
                Positioned(
                    top: 439,
                    left: 11,
                    child: Container(
                        width: 337,
                        height: 41,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(0, 3),
                                blurRadius: 7)
                          ],
                          color: Color.fromRGBO(115, 100, 255, 1),
                        ))),
                Positioned(
                    top: 500,
                    left: 11,
                    child: Container(
                        width: 337,
                        height: 41,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          border: Border.all(
                            color: const Color.fromRGBO(115, 100, 255, 1),
                            width: 1,
                          ),
                        ))),
                const Positioned(
                    top: 450,
                    left: 143,
                    child: Text(
                      'เข้าสู่ระบบ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Bai Jamjuree',
                          fontSize: 18,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1.5 /*PERCENT not supported*/
                          ),
                    )),
                const Positioned(
                    top: 511,
                    left: 135,
                    child: Text(
                      'สมัครสมาชิก',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(115, 100, 255, 1),
                          fontFamily: 'Bai Jamjuree',
                          fontSize: 18,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1.5 /*PERCENT not supported*/
                          ),
                    )),
                const Positioned(
                    top: 561,
                    left: 141,
                    child: Text(
                      'ลืมรหัสผ่าน?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(130, 130, 130, 1),
                          fontFamily: 'Bai Jamjuree',
                          fontSize: 15,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1.5 /*PERCENT not supported*/
                          ),
                    )),
                Positioned(
                    top: 24,
                    left: -2,
                    child: Container(
                        width: 361,
                        height: 180,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/Hongkong-pana.png'),
                              fit: BoxFit.fitWidth),
                        ))),
                const Positioned(
                    top: 315,
                    left: 24,
                    child: Text(
                      'example@example.com',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(179, 179, 179, 1),
                          fontFamily: 'Bai Jamjuree',
                          fontSize: 12,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
              ])),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MySecondHomePage()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
