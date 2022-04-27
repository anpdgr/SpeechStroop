import 'package:flutter/material.dart';

import 'package:speech_stroop/screens/auth/components/text_form_field.dart';
import 'package:speech_stroop/screens/auth/register.dart';
import 'package:speech_stroop/screens/auth/register_stress.dart';

import 'package:speech_stroop/components/button/floating_button.dart';
import 'package:speech_stroop/components/appbar.dart';

class Register2Screen extends StatefulWidget {
  const Register2Screen({Key key}) : super(key: key);
  static String routeName = "/register_2";

  @override
  _Register2ScreenState createState() => _Register2ScreenState();
}

class _Register2ScreenState extends State<Register2Screen> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formGlobalKey = GlobalKey<FormState>();

  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController lastFourIdController;
  TextEditingController dobController;
  DateTime dob;
  String genderValue;
  List<DropdownMenuItem<dynamic>> genderList = const [
    DropdownMenuItem(child: Text("เพศชาย"), value: "male"),
    DropdownMenuItem(child: Text("เพศหญิง"), value: "female"),
    DropdownMenuItem(child: Text("อื่น ๆ"), value: "etc"),
  ];
  String educationValue;
  List<DropdownMenuItem<dynamic>> educationList = const [
    DropdownMenuItem(
        child: Text("ต่ำกว่ามัธยมศึกษาตอนต้น"), value: "elementary"),
    DropdownMenuItem(child: Text("มัธยมศึกษาตอนต้น"), value: "lower2nd"),
    DropdownMenuItem(child: Text("ปวช."), value: "vocational cert"),
    DropdownMenuItem(child: Text("มัธยมศึกษาตอนปลาย"), value: "upper2nd"),
    DropdownMenuItem(child: Text("ปวส."), value: "high vocational cert"),
    DropdownMenuItem(child: Text("อนุปริญญา"), value: "associate"),
    DropdownMenuItem(child: Text("ปริญญาตรี "), value: "bd"),
    DropdownMenuItem(child: Text("ปริญญาโท"), value: "md"),
    DropdownMenuItem(child: Text("ปริญญาเอก"), value: "phd"),
    DropdownMenuItem(child: Text("อื่น ๆ"), value: "etc"),
  ];
  bool isNotColorBlind = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    lastFourIdController = TextEditingController();
    dobController = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return const Color(0xFFEB8D8D);
      }
      return const Color(0xFF525252);
    }

    return Form(
      key: formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        appBar: const CustomAppBar('สมัครสมาชิก'),
        backgroundColor: const Color(0xFFFBFBFF),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
            child: Form(
                key: formGlobalKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: TextFormFieldCustom(
                          nameController,
                          'ชื่อเล่น',
                          TextInputType.name,
                          (val) {
                            if (val.isEmpty) {
                              return 'โปรดระบุชื่อเล่น';
                            }
                            return null;
                          },
                          (val) {
                            if (formGlobalKey.currentState.validate()) {
                              formGlobalKey.currentState.save();
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: TextFormFieldCustom(
                        emailController,
                        'อีเมล',
                        TextInputType.emailAddress,
                        (val) {
                          bool isEmailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val);
                          if (val.isEmpty) {
                            return 'โปรดระบุอีเมล';
                          } else if (!isEmailValid) {
                            return 'โปรดระบุอีเมลให้ถูกต้อง';
                          }
                          return null;
                        },
                        (val) {
                          if (formGlobalKey.currentState.validate()) {
                            formGlobalKey.currentState.save();
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: TextFormFieldCustom(
                        lastFourIdController,
                        'เลขประจำตัวบัตรประชาชน 4 ตัวท้าย',
                        TextInputType.number,
                        (val) {
                          if (val.length != 4) {
                            return 'โปรดระบุเลขประจำตัวบัตรประชาชน 4 ตัวท้าย';
                          }
                          if (int.tryParse(val) == null) {
                            return 'โปรดกรอกตัวเลขเท่านั้น';
                          }
                          return null;
                        },
                        (val) {
                          if (formGlobalKey.currentState.validate()) {
                            formGlobalKey.currentState.save();
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 5, 0),
                              child: TextFormFieldCustom(
                                dobController,
                                'วันเกิด',
                                TextInputType.number,
                                (val) {
                                  RegExp exp = RegExp(
                                      r"((19|20)\d\d)-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])");
                                  Iterable<RegExpMatch> matches =
                                      exp.allMatches(val);
                                  if (val == '') {
                                    return 'โปรดระบุวันเกิดของคุณ';
                                  } else if (matches.isEmpty) {
                                    return 'โปรดระบุวันเกิดของคุณให้ถูกต้อง';
                                  }
                                  //TODO: check if value is before today
                                  return null;
                                },
                                (val) {
                                  if (formGlobalKey.currentState.validate()) {
                                    formGlobalKey.currentState.save();
                                  }
                                },
                                () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1940),
                                          lastDate:
                                              DateTime(DateTime.now().year + 1))
                                      .then((date) => {
                                            setState(() => {
                                                  dob = date,
                                                  dob != null
                                                      ? dobController.text = dob
                                                          .toString()
                                                          .split(' ')[0]
                                                      : null
                                                })
                                          });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                              child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            value: genderValue,
                            hint: const Text(
                              'เพศ',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            onChanged: (val) {
                              setState(() {
                                genderValue = val;
                              });
                              if (formGlobalKey.currentState.validate()) {
                                formGlobalKey.currentState.save();
                                setState(() {
                                  genderValue = val;
                                });
                              }
                            },
                            items: genderList,
                            validator: (value) {
                              if (value == null) {
                                return 'โปรดระบุเพศของคุณ';
                              }
                              return null;
                            },
                          )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          value: educationValue,
                          hint: const Text(
                            'ระดับการศึกษาสูงสุด',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          onChanged: (val) {
                            setState(() {
                              educationValue = val;
                            });
                            if (formGlobalKey.currentState.validate()) {
                              formGlobalKey.currentState.save();
                              setState(() {
                                educationValue = val;
                              });
                            }
                          },
                          items: educationList,
                          validator: (value) {
                            if (value == null) {
                              return 'โปรดระบุระดับการศึกษาสูงสุดของคุณ';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(5),
                      child: Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: isNotColorBlind,
                            onChanged: (bool value) {
                              setState(() {
                                isNotColorBlind = value;
                              });
                            },
                          ),
                          const Flexible(
                            child: Text(
                              """หากคุณไม่มีภาวะตาบอดสี โปรดทำเครื่องหมายถูกในช่องว่างเพื่อยืนยัน เนื่องจากผู้ที่มีภาวะตาบอดสีจะไม่สามารถทำแบบทดสอบภายในแอปพลิเคชัน Speech Stroop ได้""",
                              style:
                                  TextStyle(fontSize: 16, letterSpacing: 0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                        alignment: const AlignmentDirectional(0.9, 0),
                        child: FloatingButton(() {
                          if (formGlobalKey.currentState.validate() &&
                              isNotColorBlind) {
                            formGlobalKey.currentState.save();

                            setUserData();

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const StressRegisterScreen()));
                          }
                        })),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  setUserData() {
    List<int> splitDob =
        dobController.text.split("-").map((e) => int.parse(e)).toList();

    registerReq.name = nameController.text;
    registerReq.email = emailController.text;
    registerReq.lastFourId = lastFourIdController.text;
    registerReq.dateOfBirth = DateTime(splitDob[0], splitDob[1], splitDob[2]);
    registerReq.gender = genderValue ?? 'unknown';
    registerReq.education = educationValue ?? 'unknown';
    precondition.isColorBlind = !isNotColorBlind;
  }
}
