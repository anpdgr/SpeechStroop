import 'package:flutter/material.dart';
import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/components/button/secondary_button.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/model/update_user.dart';
import 'package:speech_stroop/model/user.dart';
import 'package:speech_stroop/screens/profile/profile_screen.dart';
import 'package:speech_stroop/theme.dart';

class ProfileForm extends StatefulWidget {
  ProfileForm(this.updateUser, {Key key}) : super(key: key);
  UpdateUser updateUser;
  @override
  ProfileFormState createState() => ProfileFormState();
}

class ProfileFormState extends State<ProfileForm> {
  User currentUser = userProfile;
  UpdateUser updateUser;

  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController dobController;
  bool profileFormEnabled;

  bool isChecked = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    currentUser = userProfile;
    updateUser = widget.updateUser;

    nameController = TextEditingController(text: currentUser.name);
    emailController = TextEditingController(text: currentUser.email);
    dobController = TextEditingController(
        text: currentUser.dateOfBirth.toString().split(' ')[0]);
    profileFormEnabled = false;

    print(currentUser.name);
    print(nameController.text);
  }

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
                      controller: nameController,
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
                    controller: emailController,
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
                  child: TextFormField(
                    controller: dobController,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabled: profileFormEnabled,
                      labelText: 'วันเกิด',
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
                      RegExp exp = RegExp(
                          r"((19|20)\d\d)-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])");
                      Iterable<RegExpMatch> matches = exp.allMatches(val);
                      if (val == '') {
                        return 'โปรดระบุวันเกิดของคุณ';
                      } else if (matches.isEmpty) {
                        return 'โปรดระบุวันเกิดของคุณให้ถูกต้อง';
                      }
                      //TODO: check if value is before today
                      return null;
                    },
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1940),
                              lastDate: DateTime(DateTime.now().year + 1))
                          .then((date) => {
                                setState(() => {
                                      currentUser.dateOfBirth = date,
                                      currentUser.dateOfBirth != null
                                          ? dobController.text = currentUser
                                              .dateOfBirth
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
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    value: currentUser.gender,
                    hint: const Text(
                      'เพศ',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        currentUser.gender = val;
                      });
                      if (formGlobalKey.currentState.validate()) {
                        formGlobalKey.currentState.save();
                        setState(() {
                          currentUser.gender = val;
                        });
                      }
                    },
                    items: const [
                      DropdownMenuItem(child: Text("เพศชาย"), value: "male"),
                      DropdownMenuItem(child: Text("เพศหญิง"), value: "female"),
                      DropdownMenuItem(child: Text("อื่น ๆ"), value: "etc"),
                    ],
                    validator: (value) {
                      if (value == null) {
                        return 'โปรดระบุเพศของคุณ';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    value: currentUser.education,
                    hint: const Text(
                      'ระดับการศึกษาสูงสุด',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        currentUser.education = val;
                      });
                      if (formGlobalKey.currentState.validate()) {
                        formGlobalKey.currentState.save();
                        setState(() {
                          updateUser.education = val;
                        });
                      }
                    },
                    items: const [
                      DropdownMenuItem(
                          child: Text("ต่ำกว่ามัธยมศึกษาตอนต้น"),
                          value: "elementary"),
                      DropdownMenuItem(
                          child: Text("มัธยมศึกษาตอนต้น"), value: "lower2nd"),
                      DropdownMenuItem(
                          child: Text("ปวช."), value: "vocational cert"),
                      DropdownMenuItem(
                          child: Text("มัธยมศึกษาตอนปลาย"), value: "upper2nd"),
                      DropdownMenuItem(
                          child: Text("ปวส."), value: "high vocational cert"),
                      DropdownMenuItem(
                          child: Text("อนุปริญญา"), value: "associate"),
                      DropdownMenuItem(child: Text("ปริญญาตรี "), value: "bd"),
                      DropdownMenuItem(child: Text("ปริญญาโท"), value: "md"),
                      DropdownMenuItem(child: Text("ปริญญาเอก"), value: "phd"),
                      DropdownMenuItem(child: Text("อื่น ๆ"), value: "etc"),
                    ],
                    validator: (value) {
                      if (value == null) {
                        return 'โปรดระบุระดับการศึกษาสูงสุดของคุณ';
                      }
                      return null;
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
                    Center(
                      child: Column(
                        children: [
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
                            child: Column(
                              children: [
                                PrimaryButton(
                                  "บันทึก",
                                  () async => {
                                    updateUser.name = nameController.text,
                                    updateUser.email = emailController.text,
                                    // updateUser.dateOfBirth = ,
                                    // updateUser.gender = gende
                                    print({
                                      "tel": updateUser.tel,
                                      "name": updateUser.name,
                                      "email": updateUser.email,
                                      "dateOfBirth": updateUser.dateOfBirth,
                                      "gender": updateUser.gender,
                                      "education": updateUser.education,
                                      "precondition": updateUser.precondition,
                                    }),
                                    await updateUserProfile(updateUser),
                                    Navigator.pushNamed(
                                        context, ProfileScreen.routeName),
                                  },
                                ),
                                SecondaryButton("ยกเลิก",
                                    () => Navigator.pop(context, false))
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
