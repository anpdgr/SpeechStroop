import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_stroop/screens/stroop_test/stroop_test.dart';

class BreakWidget extends StatefulWidget {
  const BreakWidget({Key key}) : super(key: key);

  @override
  _BreakWidgetState createState() => _BreakWidgetState();
}

class _BreakWidgetState extends State<BreakWidget> {
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
          // GestureDetector(
          //     onTap: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => const StroopTestWidget()));
          //     },
          //     child:
          const Text("break")
          //  )
        ]),
      ),
    );
  }
}
