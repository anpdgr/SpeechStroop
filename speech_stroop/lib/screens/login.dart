import 'package:flutter/material.dart';
import 'package:speech_stroop/screens/color_test.dart';
import 'package:speech_stroop/screens/microphone_test.dart';
import 'package:speech_stroop/screens/reading_test.dart';
import 'package:speech_stroop/screens/register.dart';
import 'package:speech_stroop/screens/stroop_test.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetWidgetState createState() => _LoginWidgetWidgetState();
}

class _LoginWidgetWidgetState extends State<LoginWidget> {
  TextEditingController emailController;
  TextEditingController telController;
  TextEditingController passwordController;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    telController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: const Color(0xFFFBFBFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Form(
              key: formGlobalKey,
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: TextFormField(
                        controller: telController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'เบอร์โทรศัพท์',
                          labelStyle: const TextStyle(
                            fontFamily: 'Bai Jamjuree',
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
                          fontFamily: 'Bai Jamjuree',
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.phone,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'โปรดระบุเบอร์โทรศัพท์';
                          }
                          if (val.length != 10) {
                            return 'เบอร์โทรศัพท์ประกอบไปด้วย 10 ตัวอักษร';
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
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: TextFormField(
                      controller: passwordController,
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
                      validator: (val) {
                        if (val.length >= 8) {
                          return null;
                        } else {
                          return 'รหัสผ่านต้องมีความยาวอย่างน้อย 8 ตัวอักษร';
                        }
                      },
                      onChanged: (val) {
                        if (formGlobalKey.currentState.validate()) {
                          formGlobalKey.currentState.save();
                        }
                      },
                    ),
                  ),
                  Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                      child: SizedBox(
                        width: 350,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              if (formGlobalKey.currentState.validate()) {
                                formGlobalKey.currentState.save();
                                print(passwordController.text);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const ColorTestWidget()));
                              }
                            },
                            child: const Text('เข้าสู่ระบบ'),
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                primary: Colors.deepPurpleAccent,
                                textStyle: const TextStyle(
                                    fontSize: 18, fontFamily: 'BaiJamjuree'))),
                      )),
                  Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                      child: SizedBox(
                          width: 350,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {
                              _showBottomModal(context);
                            },
                            child: const Text(
                              'สมัครสมาชิก',
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'BaiJamjuree',
                                    color: Colors.deepPurpleAccent)),
                          ))),
                  TextButton(
                      onPressed: () {
                        print('Login as guest');
                      },
                      child: const Text('เข้าสู่ระบบแบบ guest'),
                      style: TextButton.styleFrom(
                          shape: const StadiumBorder(),
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'BaiJamjuree',
                              color: Colors.deepPurpleAccent))),
                  TextButton(
                      onPressed: () {
                        print('Forget password');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const StroopTestWidget()));
                      },
                      child: const Text('ลืมรหัสผ่าน'),
                      style: TextButton.styleFrom(
                          shape: const StadiumBorder(),
                          textStyle: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'BaiJamjuree',
                              color: Color(0xFFA7A5A5))))
                ],
              )),
        ),
      ),
    );
  }

  _showBottomModal(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0, // has the effect of softening the shadow
                    spreadRadius: 0.0, // has the effect of extending the shadow
                  )
                ],
              ),
              alignment: Alignment.topLeft,
              child: ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 5, left: 10),
                        child: const Text(
                          "Terms and conditions",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.deepPurpleAccent),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 5, right: 5),
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterWidget()));
                                  },
                                  child: const Text(
                                    "ยอมรับ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  )))),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color(0xfff8f8f8),
                          width: 1,
                        ),
                      ),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                                text:
                                    """แอปพลิเคชัน Speech Stroop Test หรือแอปพลิเคชันเพื่อบ่งชี้ถึงภาวะการทำงานของสมองที่เสื่อมถอยลงที่มีความสัมพันธ์กับอายุสำหรับผู้สูงอายุในประเทศไทย 

ชื่อผู้พัฒนา
1.นางสาวสุธาดา ธรรมวงศ์
2.นางสาวอนัญญา พัฒนปุณยาภิรมย์ 

ซึ่งประโยชน์ที่คาดว่าผู้ใช้จะได้รับคือ
1.ท่านจะได้ทราบถึงความสามารถของตนเองในการตอบคำถามด้านความคิดเชิงบริหาร
2.ท่านสามารถทราบได้ถึงการจัดการกับความเครียดและความตื่นตัวของตนเอง
3.ท่านจะได้ฝึกฝนทักษะและความคิดเชิงบริหารผ่านการทดสอบ Stroop 

โดยแอปพลิเคชัน Speech Stroop Test รองรับผู้ใช้ที่อยู่ในช่วงอายุ 18-60 ปี มีการมองเห็นปกติ ไม่มีความผิดปกติด้านการจำแนกสีและการอ่าน โดยจะมีผู้เข้า ร่วมการทดลองเข้าร่วมวิจัยทั้งสิ้น 300 คน มีระยะเวลาการเก็บข้อมูลไม่กำหนด โดยจะเก็บเฉพาะข้อมูลที่ไม่สามารถระบุได้ถึงตัวตนของผู้ทำแบบทดสอบ เพื่อที่จะนำไปรวบรวมข้อมูลเป็นค่ามาตรฐานภายในประเทศไทย เช่น อายุ เพศ ความเครียด ผลลัพธ์การทำแบบทดสอบ ระดับการศึกษา และไฟล์เสียงระหว่างทำแบบทดสอบ โดยข้อมูลของอาสาสมัครจะถูกเก็บรักษาไว้ ไม่เปิดเผยต่อสาธารณะ แต่จะรายงาน ผลการวิจัยเป็นข้อมูลส่วนรวม และการใช้งานจะไม่มีค่าตอบแทนและค่าใช้จ่ายที่ผู้ใช้จะต้องรับผิดชอบเองเพิ่มเติม

หากท่านตัดสินใจเข้าร่วมการทดสอบ จะมีขั้นตอนการวิจัยดังต่อไปนี้คือ
1.ผู้ใช้จะได้ทำการสมัครสมาชิกเพื่อใช้งานแอปพลิเคชันสำหรับการทำแบบทดสอบ โดยมีการเก็บข้อมูลในส่วนของอายุ เพศ ระดับการศึกษาอีเมล เบอร์โทรศัพท์ และเลขบัตรประชาชน 4 ตัวท้าย
2.ผู้ใช้จะต้องทำแบบทดสอบเพื่อประเมินตาบอดสี  
3.ผู้ใช้ต้องทำการทดสอบไมโครโฟนของโทรศัพท์ที่ถูกใช้งานกับแอปพลิเคชัน เพื่อทำการเตรียมพร้อมการทดสอบ การอ่าน การจำแนกสี และแบบทดสอบ Speech Stroop โดยผู้ใช้จะต้องให้อนุญาตการเข้าถึงไมโครโฟนของโทรศัพท์ 
4.ผู้ใช้จะต้องทำแบบทดสอบเพื่อประเมินการจำแนกเห็นสี
5.ผู้ใช้จะต้องทำแบบทดสอบเพื่อประเมินการอ่านในภาษาไทย
6.ผู้ใช้จะต้องทำแบบสอบถามประเมินระดับความเครียดฉบับภาษาไทย (10-Item Perceived Stress Scale; PSS-10) 
7.ผู้ใช้จะต้องทำแบบสอบถามประเมินระดับการนอนหลับพักผ่อน 
8.ผู้ใช้จะต้องทำแบบทดสอบ Speech Stroop โดยการทดสอบใน 1 ครั้งจะถูกแบ่งย่อยเป็น 3 รอบ รอบละ 20 ข้อ ซึ่งในแต่ละรอบจะมีการเว้นช่วงในการพัก โดยสามารถพักได้ตามระยะเวลาที่ต้องการ
9.ในระหว่างพักผู้ใช้จะต้องทำแบบสอบถามระดับความเครียดและความตื่นตัว
10.ในการทดสอบจะใช้เวลาประมาณโดยเฉลี่ย 30 นาที หรืออาจมากกว่าขึ้นระยะเวลาการพักของผู้ใช้

ความเสี่ยงที่อาจเกิดขึ้น 
1.เสียเวลาในการทำแบบทดสอบ 
2.ท่านอาจรู้สึกอึดอัด เครียด และตื่นตัวในการทำแบบทดสอบที่ใช้เวลา ซึ่งท่านมีสิทธิ์ที่จะไม่ทำแบบทดสอบต่อได้ หากมีอาการผิดปกติ รู้สึกไม่สบายกาย หรือมีผลกระทบต่อจิตใจของท่านเกิดขึ้นระหว่างการวิจัย ท่านสามารถแจ้งผู้วิจัยโดยเร็วที่สุดและยุติการทำแบบทดสอบในทันที

ระยะเวลาและการทำลายข้อมูล เก็บรักษาข้อมูลเป็นระยะเวลาไม่กำหนด โดยจะเก็บเฉพาะข้อมูลที่ไม่สามารถระบุได้ถึงตัวตนของผู้ทำแบบทดสอบ เพื่อที่จะนำไปรวบรวมข้อมูลเป็นค่ามาตรฐานภายในประเทศไทย เช่น อายุ เพศ ความเครียด ผลลัพธ์การทำแบบทดสอบ ระดับการศึกษา ไฟล์เสียงระหว่างทำแบบทดสอบ เป็นต้น 

หากมีข้อข้องใจที่จะสอบถามเกี่ยวข้องกับการวิจัย หรือเมื่อบาดเจ็บ/เจ็บป่วยจากการวิจัยโปรดติดต่อ นางสาวสุธาดา ธรรมวงศ์ เบอร์โทรศัพท์ 065-634-6107

หากมีข้อมูลเพิ่มเติมทั้งด้านประโยชน์และโทษที่เกี่ยวข้องกับการวิจัยนี้ ผู้วิจัยจะแจ้งให้ทราบอย่างรวดเร็วและไม่ปิดบัง

อาสาสมัครมีสิทธิ์ถอนตัวออกจากโครงการวิจัยเมื่อใดก็ได้ โดยไม่ต้องแจ้งให้ทราบล่วงหน้าและการไม่เข้าร่วมการวิจัยหรือถอนตัวออกจากโครงการวิจัยนี้ จะไม่มีผลกระทบต่อการบริการและการรักษาที่สมควรจะได้รับแต่ประการใด 

โครงการวิจัยนี้ได้รับการพิจารณารับรองจากคณะกรรมการจริยธรรมการวิจัยในมนุษย์ของมหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี ซึ่งมีสำนักงานอยู่ที่สำนักงานวิจัย นวัตกรรมและพันธมิตร ชั้น 7 อาคารสานักงานอธิการบดี มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี เลขที่ 126 ถนนประชาอุทิศ แขวงบางมด เขตทุ่งครุ กรุงเทพฯ 10140  
โทรศัพท์ 0-2470-9623 โทรสาร 0-2872-9083  

หากท่านได้รับการปฏิบัติไม่ตรงตามที่ระบุไว้ ท่านสามารถติดต่อกับประธาน คณะกรรมการฯ หรือผู้แทน ได้ตามสถานที่และหมายเลขโทรศัพท์ข้างต้น 
                                      """,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.grey[700],
                                    wordSpacing: 0.5)),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
