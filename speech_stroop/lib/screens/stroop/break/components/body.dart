import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/screens/stroop/stroop_test/stroop_test.dart';
import 'package:speech_stroop/utils/speech_lib.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          GestureDetector(
              onTap: () {
                sectionNumber++;
                answered = -1;
                //print(sections);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StroopTestScreen()));
              },
              child: Text("break" + countTest.toString()))
        ]),
      ),
    );
  }
}
