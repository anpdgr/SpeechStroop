import 'package:flutter/material.dart';

class Register1Widget extends StatefulWidget {
  Register1Widget({Key key}) : super(key: key);

  @override
  _Register1WidgetState createState() => _Register1WidgetState();
}

class _Register1WidgetState extends State<Register1Widget> {
  TextEditingController textController1;
  TextEditingController textController2;
  bool passwordVisibility1;
  TextEditingController textController3;
  bool passwordVisibility2;
  TextEditingController textController4;
  final formKey = GlobalKey<FormState>();
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
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color(0xFFFBFBFF),
          iconTheme: IconThemeData(color: Color(0xFF7364FF)),
          automaticallyImplyLeading: true,
          actions: [],
          centerTitle: true,
        ),
        backgroundColor: Color(0xFFFBFBFF),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Align(
                  alignment: AlignmentDirectional(-0.9, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                    child: Text(
                      'สมัครสมาชิก',
                      textAlign: TextAlign.start,
                      // style: FlutterFlowTheme.bodyText1.override(
                      //   fontFamily: 'Bai Jamjuree',
                      //   color: Color(0xFF7364FF),
                      //   fontSize: 28,
                      // ),
                    ),
                  ),
                ),
                const Divider(),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: TextFormField(
                      controller: textController1,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'อีเมลล์',
                        // labelStyle: FlutterFlowTheme.bodyText1.override(
                        //   fontFamily: 'Bai Jamjuree',
                        //   fontWeight: FontWeight.w300,
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFA7A5A5),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFA7A5A5),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      // style: FlutterFlowTheme.bodyText1.override(
                      //   fontFamily: 'Bai Jamjuree',
                      //   fontWeight: FontWeight.w300,
                      // ),
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: TextFormField(
                    controller: textController2,
                    obscureText: !passwordVisibility1,
                    decoration: InputDecoration(
                      labelText: 'รหัสผ่าน',
                      // labelStyle: FlutterFlowTheme.bodyText1.override(
                      //   fontFamily: 'Bai Jamjuree',
                      //   fontWeight: FontWeight.w300,
                      // ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFA7A5A5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
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
                          color: Color(0xFF757575),
                          size: 22,
                        ),
                      ),
                    ),
                    // style: FlutterFlowTheme.bodyText1.override(
                    //   fontFamily: 'Bai Jamjuree',
                    //   fontWeight: FontWeight.w300,
                    // ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: TextFormField(
                    controller: textController3,
                    obscureText: !passwordVisibility2,
                    decoration: InputDecoration(
                      labelText: 'ยืนยันรหัสผ่าน',
                      // labelStyle: FlutterFlowTheme.bodyText1.override(
                      //   fontFamily: 'Bai Jamjuree',
                      //   fontWeight: FontWeight.w300,
                      // ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFA7A5A5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
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
                          color: Color(0xFF757575),
                          size: 22,
                        ),
                      ),
                    ),
                    // style: FlutterFlowTheme.bodyText1.override(
                    //   fontFamily: 'Bai Jamjuree',
                    //   fontWeight: FontWeight.w300,
                    // ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: TextFormField(
                      controller: textController4,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Hospital Number (HN)',
                        // labelStyle: FlutterFlowTheme.bodyText1.override(
                        //   fontFamily: 'Bai Jamjuree',
                        //   fontWeight: FontWeight.w300,
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFA7A5A5),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFA7A5A5),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      // style: FlutterFlowTheme.bodyText1.override(
                      //   fontFamily: 'Bai Jamjuree',
                      //   fontWeight: FontWeight.w300,
                      // ),
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter your HN.';
                        }

                        return null;
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.9, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 5),
                    // child: FFButtonWidget(
                    //   onPressed: () {
                    //     print('Button pressed ...');
                    //   },
                    //   text: 'ถัดไป',
                    //   options: FFButtonOptions(
                    //     width: 70,
                    //     height: 41,
                    //     color: Color(0xFF7364FF),
                    //     textStyle: FlutterFlowTheme.subtitle2.override(
                    //       fontFamily: 'Bai Jamjuree',
                    //       color: Colors.white,
                    //       fontSize: 16,
                    //     ),
                    //     borderSide: BorderSide(
                    //       color: Colors.transparent,
                    //       width: 1,
                    //     ),
                    //     borderRadius: 20,
                    //   ),
                    // ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
