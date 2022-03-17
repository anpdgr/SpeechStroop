import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/components/home_screen_appbar.dart';
import 'package:speech_stroop/constants.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController telController;
  TextEditingController passwordController;
  bool passwordVisibility;
  TextEditingController confirmPasswordController;
  bool confirmPasswordVisibility;
  final formGlobalKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    telController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    confirmPasswordController = TextEditingController();
    confirmPasswordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(children: [
      Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              Image.asset('assets/images/his_trophy.png'),
              PrimaryButton("ดูประวัติทั้งหมด", () => {print(1)}),
              Container(
                margin: EdgeInsets.all(40),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "คะแนนล่าสุด",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: softPrimaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(40),
                        child: Column(children: [
                          Text(
                            "คะแนนเฉลี่ยต่อสัปดาห์",
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                .apply(color: Color(0xFF525252)),
                          ),
                          Text(
                            "27",
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ]),
                      )
                    ]),
              ),
              Container(
                margin: EdgeInsets.all(40),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "รางวัลที่ได้รับ",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: softPrimaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(40),
                        child: Column(children: [
                          Row(
                            children: [
                              Text(
                                "คะแนนยอดเยี่ยม",
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    .apply(color: Color(0xFF464D59)),
                              ),
                              Text("0/6",
                                  textAlign: TextAlign.right,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      .apply(color: secondaryColor)),
                            ],
                          ),
                          Divider(
                            color: Color(0xFF381E73),
                            height: 25,
                            thickness: 2,
                            indent: 5,
                            endIndent: 5,
                          ),
                        ]),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: softPrimaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(40),
                        child: Column(children: [
                          Row(
                            children: [
                              Text(
                                "ทดสอบต่อเนื่อง",
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    .apply(color: Color(0xFF464D59)),
                              ),
                              Text("0/6",
                                  textAlign: TextAlign.right,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      .apply(color: secondaryColor)),
                            ],
                          ),
                          Divider(
                            color: Color(0xFF381E73),
                            height: 25,
                            thickness: 2,
                            indent: 5,
                            endIndent: 5,
                          ),
                        ]),
                      )
                    ]),
              )
            ],
          ))
    ])));
  }
}
