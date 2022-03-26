import 'package:flutter/material.dart';
import 'package:speech_stroop/screens/profile/components/body.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key key}) : super(key: key);
  @override
  ProfileFormState createState() => ProfileFormState();
}

class ProfileFormState extends State<ProfileForm> {
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    lastFourIdController = TextEditingController();
    dobController = TextEditingController();
  }

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

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: TextFormField(
                      controller: nameController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'ชื่อเล่น',
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
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
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
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
                // Padding(
                //   padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                //   child: TextFormField(
                //     controller: emailController,
                //     obscureText: false,
                //     decoration: InputDecoration(
                //       labelText: 'อีเมล',
                //       labelStyle: const TextStyle(
                //         fontWeight: FontWeight.w300,
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderSide: const BorderSide(
                //           color: Color(0xFFA7A5A5),
                //           width: 1,
                //         ),
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderSide: const BorderSide(
                //           color: Color(0xFFA7A5A5),
                //           width: 1,
                //         ),
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //     ),
                //     style: const TextStyle(
                //       fontWeight: FontWeight.w300,
                //     ),
                //     keyboardType: TextInputType.emailAddress,
                //     validator: (val) {
                //       bool isEmailValid = RegExp(
                //               r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                //           .hasMatch(val);
                //       if (val.isEmpty) {
                //         return 'โปรดระบุอีเมล';
                //       } else if (!isEmailValid) {
                //         return 'โปรดระบุอีเมลให้ถูกต้อง';
                //       }
                //       return null;
                //     },
                //     onChanged: (val) {
                //       if (formGlobalKey.currentState.validate()) {
                //         formGlobalKey.currentState.save();
                //       }
                //     },
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                //   child: TextFormField(
                //     controller: lastFourIdController,
                //     obscureText: false,
                //     decoration: InputDecoration(
                //       labelText: 'เลขประจำตัวบัตรประชาชน 4 ตัวท้าย',
                //       labelStyle: const TextStyle(
                //         fontWeight: FontWeight.w300,
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderSide: const BorderSide(
                //           color: Color(0xFFA7A5A5),
                //           width: 1,
                //         ),
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderSide: const BorderSide(
                //           color: Color(0xFFA7A5A5),
                //           width: 1,
                //         ),
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //     ),
                //     style: const TextStyle(
                //       fontWeight: FontWeight.w300,
                //     ),
                //     keyboardType: TextInputType.number,
                //     validator: (val) {
                //       if (val.length != 4) {
                //         return 'โปรดระบุเลขประจำตัวบัตรประชาชน 4 ตัวท้าย';
                //       }
                //       return null;
                //     },
                //     onChanged: (val) {
                //       if (formGlobalKey.currentState.validate()) {
                //         formGlobalKey.currentState.save();
                //       }
                //     },
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                //   child: Row(
                //     mainAxisSize: MainAxisSize.min,
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Expanded(
                //         child: Padding(
                //           padding:
                //               const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                //           child: TextFormField(
                //             controller: dobController,
                //             obscureText: false,
                //             decoration: InputDecoration(
                //               labelText: 'วันเกิด',
                //               labelStyle: const TextStyle(
                //                 fontWeight: FontWeight.w300,
                //               ),
                //               enabledBorder: OutlineInputBorder(
                //                 borderSide: const BorderSide(
                //                   color: Color(0xFFA7A5A5),
                //                   width: 1,
                //                 ),
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //               suffixIcon: const Icon(Icons.calendar_today),
                //               focusedBorder: OutlineInputBorder(
                //                 borderSide: const BorderSide(
                //                   color: Color(0xFFA7A5A5),
                //                   width: 1,
                //                 ),
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //             ),
                //             style: const TextStyle(
                //               fontWeight: FontWeight.w300,
                //             ),
                //             keyboardType: TextInputType.number,
                //             validator: (val) {
                //               RegExp exp = RegExp(
                //                   r"((19|20)\d\d)-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])");
                //               Iterable<RegExpMatch> matches =
                //                   exp.allMatches(val);
                //               print(val);
                //               print(matches);
                //               if (val == '') {
                //                 return 'โปรดระบุวันเกิดของคุณ';
                //               } else if (matches.isEmpty) {
                //                 // exp
                //                 print('err');
                //                 return 'โปรดระบุวันเกิดของคุณให้ถูกต้อง';
                //               }
                //               return null;
                //             },
                //             onTap: () {
                //               showDatePicker(
                //                       context: context,
                //                       initialDate: DateTime.now(),
                //                       firstDate: DateTime(1940),
                //                       lastDate:
                //                           DateTime(DateTime.now().year + 1))
                //                   .then((date) => {
                //                         setState(() => {
                //                               dob = date,
                //                               dob != null
                //                                   ? dobController.text = dob
                //                                       .toString()
                //                                       .split(' ')[0]
                //                                   : null
                //                             })
                //                       });
                //             },
                //             onChanged: (val) {
                //               if (formGlobalKey.currentState.validate()) {
                //                 formGlobalKey.currentState.save();
                //               }
                //             },
                //           ),
                //         ),
                //       ),
                //       Expanded(
                //           // child: InputDecorator(
                //           //     decoration: InputDecoration(
                //           //       labelStyle: const TextStyle(
                //           //         fontWeight: FontWeight.w300,
                //           //       ),
                //           //       enabledBorder: OutlineInputBorder(
                //           //         borderSide: const BorderSide(
                //           //           color: Color(0xFFA7A5A5),
                //           //           width: 1,
                //           //         ),
                //           //         borderRadius: BorderRadius.circular(10),
                //           //       ),
                //           //       focusedBorder: OutlineInputBorder(
                //           //         borderSide: const BorderSide(
                //           //           color: Color(0xFFA7A5A5),
                //           //           width: 1,
                //           //         ),
                //           //         borderRadius: BorderRadius.circular(10),
                //           //       ),
                //           //     ),
                //           // child: SizedBox(
                //           //     height: 80,
                //           child: DropdownButtonFormField(
                //         decoration: InputDecoration(
                //           border: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(10)),
                //         ),
                //         value: genderValue,
                //         hint: const Text(
                //           'เพศ',
                //           style: TextStyle(
                //             fontWeight: FontWeight.w300,
                //           ),
                //         ),
                //         onChanged: (val) {
                //           if (formGlobalKey.currentState.validate()) {
                //             formGlobalKey.currentState.save();
                //           }
                //         },
                //         items: const [
                //           DropdownMenuItem(
                //               child: Text("เพศชาย"), value: "male"),
                //           DropdownMenuItem(
                //               child: Text("เพศหญิง"), value: "female"),
                //           DropdownMenuItem(child: Text("อื่น ๆ"), value: "etc"),
                //         ],
                //         validator: (value) {
                //           if (value == null) {
                //             return 'โปรดระบุเพศของคุณ';
                //           }
                //           return null;
                //         },
                //       )),
                //     ],
                //   ),
                // ),
                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                //     child: DropdownButtonFormField(
                //       decoration: InputDecoration(
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10)),
                //       ),
                //       value: educationValue,
                //       hint: const Text(
                //         'ระดับการศึกษาสูงสุด',
                //         style: TextStyle(
                //           fontWeight: FontWeight.w300,
                //         ),
                //       ),
                //       onChanged: (val) {
                //         if (formGlobalKey.currentState.validate()) {
                //           formGlobalKey.currentState.save();
                //         }
                //       },
                //       items: const [
                //         DropdownMenuItem(
                //             child: Text("ต่ำกว่ามัธยมศึกษาตอนต้น"),
                //             value: "elementary"),
                //         DropdownMenuItem(
                //             child: Text("มัธยมศึกษาตอนต้น"), value: "lower2nd"),
                //         DropdownMenuItem(
                //             child: Text("ปวช."), value: "vocational cert"),
                //         DropdownMenuItem(
                //             child: Text("มัธยมศึกษาตอนปลาย"),
                //             value: "upper2nd"),
                //         DropdownMenuItem(
                //             child: Text("ปวส."), value: "high vocational cert"),
                //         DropdownMenuItem(
                //             child: Text("อนุปริญญา"), value: "associate"),
                //         DropdownMenuItem(child: Text("ปริญญาตรี"), value: "bd"),
                //         DropdownMenuItem(child: Text("ปริญญาโท"), value: "md"),
                //         DropdownMenuItem(
                //             child: Text("ปริญญาเอก"), value: "phd"),
                //         DropdownMenuItem(child: Text("อื่น ๆ"), value: "etc"),
                //       ],
                //       validator: (value) {
                //         if (value == null) {
                //           return 'โปรดระบุระดับการศึกษาสูงสุดของคุณ';
                //         }
                //         return null;
                //       },
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsetsDirectional.all(5),
                //   child: Row(
                //     children: [
                //       Checkbox(
                //         checkColor: Colors.white,
                //         fillColor: MaterialStateProperty.resolveWith(getColor),
                //         value: isChecked,
                //         onChanged: (bool value) {
                //           setState(() {
                //             isChecked = value;
                //           });
                //         },
                //       ),
                //       const Flexible(
                //         child: Text(
                //           """หากคุณไม่มีภาวะตาบอดสี โปรดทำเครื่องหมายถูกในช่องว่างเพื่อยืนยัน เนื่องจากผู้ที่มีภาวะตาบอดสีจะไม่สามารถทำแบบทดสอบภายในแอปพลิเคชัน Speech Stroop ได้""",
                //           style: TextStyle(fontSize: 14, letterSpacing: 0.5),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // // Align(
                // //     alignment: const AlignmentDirectional(0.9, 0),
                // //     child: FloatingButton(() {
                // //       if (formGlobalKey.currentState.validate() && isChecked) {
                // //         formGlobalKey.currentState.save();
                // //         registerReq = {
                // //           ...registerReq,
                // //           'name': nameController.text,
                // //           'email': emailController.text,
                // //           'lastFourId': lastFourIdController.text,
                // //           'age': dobController.text,
                // //           'gender': genderValue,
                // //           'education': educationValue,
                // //           'isColorBlind': true
                // //         };
                // //         Navigator.push(
                // //             context,
                // //             MaterialPageRoute(
                // //                 builder: (context) =>
                // //                     const StressRegisterScreen()));
                // //       }
                // //     })

                // //     // NextButton('ถัดไป', () {
                // //     //   if (formGlobalKey.currentState.validate() &&
                // //     //       isChecked) {
                // //     //     formGlobalKey.currentState.save();
                // //     //     registerReq = {
                // //     //       ...registerReq,
                // //     //       'name': nameController.text,
                // //     //       'email': emailController.text,
                // //     //       'lastFourId': lastFourIdController.text,
                // //     //       'age': dobController.text,
                // //     //       'gender': genderValue,
                // //     //       'education': educationValue,
                // //     //       'isColorBlind': true
                // //     //     };
                // //     //     Navigator.push(
                // //     //         context,
                // //     //         MaterialPageRoute(
                // //     //             builder: (context) =>
                // //     //                 const StressRegisterScreen()));
                // //     //   }
                // //     // }),
                // //     ),
              ],
            )),
      ),
    );
  }
}