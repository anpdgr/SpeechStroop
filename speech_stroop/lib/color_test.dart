import 'package:flutter/material.dart';
import 'package:speech_stroop/testlib.dart';

class ColortestWidget extends StatefulWidget {
  const ColortestWidget({Key key}) : super(key: key);

  @override
  _ColortestWidgetState createState() => _ColortestWidgetState();
}

class _ColortestWidgetState extends State<ColortestWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Align(
                    alignment: AlignmentDirectional(-0.9, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        'ทดสอบการมองเห็นสี',
                        textAlign: TextAlign.start,
                        // style: FlutterFlowTheme.bodyText1.override(
                        //   fontFamily: 'Bai Jamjuree',
                        //   color: Color(0xFFD5B5FF),
                        //   fontSize: 28,
                        // ),
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Text(
                      '1/7',
                      // style: FlutterFlowTheme.bodyText1.override(
                      //   fontFamily: 'Bai Jamjuree',
                      //   color: Color(0xFF8F8F8F),
                      //   fontSize: 36,
                      //   fontWeight: FontWeight.w300,
                      // ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFDA5C54),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: Center(
                  child: Ink(
                    decoration: ShapeDecoration(
                      color: Colors.orange[700],
                      shape: const CircleBorder(),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.keyboard_voice),
                      color: Colors.white,
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => libPage()));
                      },
                      iconSize: 130,
                    ),
                  ),
                ),
                // child: FlutterFlowIconButton(
                //   borderColor: Colors.transparent,
                //   borderRadius: 75,
                //   borderWidth: 1,
                //   buttonSize: 130,
                //   fillColor: Color(0xFFEC8133),
                //   icon: Icon(
                //     Icons.mic,
                //     color: Colors.white,
                //     size: 100,
                //   ),
                //   onPressed: () {
                //     print('IconButton pressed ...');
                //   },
                // ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
