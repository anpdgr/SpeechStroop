import 'package:flutter/material.dart';
import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/components/button/secondary_button.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/model/user.dart';
import 'package:speech_stroop/theme.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key key}) : super(key: key);
  @override
  ProfileFormState createState() => ProfileFormState();
}

class ProfileFormState extends State<ProfileForm> {
  @override
  void initState() {
    super.initState();
    profileFormEnabled = false;
    nameController = TextEditingController();
    emailController = TextEditingController();
    lastFourIdController = TextEditingController();
    dobController = TextEditingController();
  }

  bool profileFormEnabled;
  String genderValue;
  String educationValue;
  DateTime dob;
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController lastFourIdController;
  TextEditingController dobController;
  bool isChecked = false;
  final formKey = GlobalKey<FormState>();
  final formGlobalKey = GlobalKey<FormState>();

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

  Widget getFormButton() {
    Widget button;
    profileFormEnabled
        ? button = SecondaryButton(
            "บันทึกข้อมูล", () => {showSimpleModalDialog(context)})
        : button = PrimaryButton(
            "แก้ไขข้อมูล",
            () => {
                  setState(() => {profileFormEnabled = true}),
                });
    //SecondaryButton("บันทึกข้อมูล", showSimpleModalDialog(context));
    return button;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
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
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: userProfile.name,
                      decoration: InputDecoration(
                        enabled: profileFormEnabled,
                        labelText: 'ชื่อเล่น',
                        labelStyle:
                            textTheme().labelLarge.apply(color: formText),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: formBorder,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      style: textTheme().bodyMedium.apply(color: formText),
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.name,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'โปรดระบุชื่อเล่น';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        if (formGlobalKey.currentState.validate()) {
                          formGlobalKey.currentState.save();
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: userProfile.email,
                    decoration: InputDecoration(
                      enabled: profileFormEnabled,
                      labelText: 'อีเมล',
                      labelStyle: textTheme().labelLarge.apply(color: formText),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: formBorder,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: textTheme().bodyMedium.apply(color: formText),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
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
                    onChanged: (val) {
                      if (formGlobalKey.currentState.validate()) {
                        formGlobalKey.currentState.save();
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                            initialValue: userProfile.dateOfBirth
                                .toIso8601String()
                                .split('T')[0],
                            enabled: profileFormEnabled,
                            decoration: InputDecoration(
                              labelText: 'วันเกิด',
                              labelStyle:
                                  textTheme().labelLarge.apply(color: formText),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: formBorder,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: const Icon(Icons.calendar_today),
                            ),
                            style:
                                textTheme().labelLarge.apply(color: formText),
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              RegExp exp = RegExp(
                                  r"((19|20)\d\d)-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])");
                              Iterable<RegExpMatch> matches =
                                  exp.allMatches(val);
                              print(val);
                              print(matches);
                              if (val == '') {
                                return 'โปรดระบุวันเกิดของคุณ';
                              } else if (matches.isEmpty) {
                                // exp
                                print('err');
                                return 'โปรดระบุวันเกิดของคุณให้ถูกต้อง';
                              }
                              return null;
                            },
                            onTap: () {
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
                            onChanged: (val) {
                              if (formGlobalKey.currentState.validate()) {
                                formGlobalKey.currentState.save();
                              }
                            }),
                      ),
                      Container(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: userProfile.gender,
                          decoration: InputDecoration(
                            enabled: profileFormEnabled,
                            labelText: 'เพศ',
                            labelStyle:
                                textTheme().labelLarge.apply(color: formText),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: formBorder,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          style: textTheme().bodyMedium.apply(color: formText),
                          textAlign: TextAlign.start,
                          onChanged: (val) {
                            if (formGlobalKey.currentState.validate()) {
                              formGlobalKey.currentState.save();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: userProfile.education,
                    decoration: InputDecoration(
                      enabled: profileFormEnabled,
                      labelText: 'ระดับการศึกษาสูงสุด',
                      labelStyle: textTheme().labelLarge.apply(color: formText),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: formBorder,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: textTheme().bodyMedium.apply(color: formText),
                    textAlign: TextAlign.start,
                    onChanged: (val) {
                      if (formGlobalKey.currentState.validate()) {
                        formGlobalKey.currentState.save();
                      }
                    },
                  ),
                ),
                getFormButton(),
              ],
            )),
      ),
    );
  }

  showSimpleModalDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 270),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context, false),
                        icon: const Icon(
                          Icons.close,
                          color: Color(0xFF37265F),
                        ),
                        iconSize: 30,
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: (const Text('ต้องการบันทึกหรือไม่',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xFF22005D),
                                fontFamily: 'BaiJamjuree',
                                wordSpacing: 1)))),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Column(children: [
                        PrimaryButton(
                          "บันทึก",
                          () => {
                            print('save'),
                            setState(() => {profileFormEnabled = false}),
                            Navigator.pop(context, false)
                          },
                        ),
                        SecondaryButton(
                            "ยกเลิก", () => Navigator.pop(context, false))
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          );
          ;
        });
  }
}
