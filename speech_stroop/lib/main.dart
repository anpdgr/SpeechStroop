import 'package:flutter/material.dart';
import 'package:speech_stroop/color_test.dart';
import 'package:speech_stroop/register1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple, fontFamily: 'BaiJamjuree'),
      home: const MySecondHomePage(),
    );
  }
}

class MySecondHomePage extends StatefulWidget {
  const MySecondHomePage({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<MySecondHomePage> {
  TextEditingController textController1;
  TextEditingController textController2;
  bool passwordVisibility;
  // bool _loadingButton1 = false;
  // bool _loadingButton2 = false;
  // bool _loadingButton3 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFFBFBFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: TextFormField(
                    controller: textController1,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'อีเมลล์',
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
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: TextFormField(
                  controller: textController2,
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
                ),
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                  child: SizedBox(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  // builder: (context) => const MyHomePage()));
                                  builder: (context) =>
                                      const ColortestWidget()));
                        },
                        child: const Text('เข้าสู่ระบบ'),
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            primary: Colors.deepPurpleAccent,
                            textStyle: const TextStyle(
                                fontSize: 18, fontFamily: 'BaiJamjuree'))
                        // options: FFButtonOptions(
                        //   width: 337,
                        //   height: 41,
                        //   color: Color(0xFF7364FF),
                        //   textStyle: FlutterFlowTheme.subtitle2.override(
                        //     fontFamily: 'Bai Jamjuree',
                        //     color: Colors.white,
                        //     fontSize: 18,
                        //   ),
                        //   borderSide: BorderSide(
                        //     color: Colors.transparent,
                        //     width: 1,
                        //   ),
                        //   borderRadius: 20,
                        // ),
                        // loading: _loadingButton1,
                        ),
                  )),
              // child: MaterialButton(
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const MyHomePage()));
              //     },
              //     child: const Text('เข้าสู่ระบบ'),
              //     textColor: Colors.white,
              //     color: Colors.deepPurple[600],
              //     minWidth: 350,
              //     height: 41)),
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
                                  builder: (context) => Register1Widget()));
                        },
                        child: const Text(
                          'สมัครสมาชิก',
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            // primary: Colors.deepPurpleAccent,
                            textStyle: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'BaiJamjuree',
                                color: Colors.deepPurpleAccent)),
                      ))),
              TextButton(
                  onPressed: () {
                    // ignore: avoid_print
                    print('Forget Password Button');
                  },
                  child: const Text('ลืมรหัสผ่าน?'),
                  style: TextButton.styleFrom(
                      shape: const StadiumBorder(),
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'BaiJamjuree',
                          color: Colors.deepPurpleAccent)))
            ],
          ),
        ),
      ),
    );
  }
}
