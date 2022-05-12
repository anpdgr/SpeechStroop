import 'package:flutter/material.dart';
import 'package:speech_stroop/components/button/floating_button.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/screens/auth/register.dart';
import 'package:speech_stroop/components/custom_appbar.dart';

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({Key key}) : super(key: key);
  static String routeName = "/term_and_condition";

  @override
  _TermsConditionsScreenWidgetState createState() =>
      _TermsConditionsScreenWidgetState();
}

class _TermsConditionsScreenWidgetState extends State<TermsConditionsScreen> {
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return secondaryColor;
      }
      return const Color(0xFF525252);
    }

    return Scaffold(
      appBar: const CustomAppBar('ข้อกำหนดและเงื่อนไข'),
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(deviceWidth(context) * 0.02,
                0, deviceWidth(context) * 0.025, 0),
            child: Stack(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFEEF0F3),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: deviceHeight(context) * 0.55,
                      constraints: const BoxConstraints(
                        maxHeight: double.infinity,
                      ),
                      child: SingleChildScrollView(
                          child: Padding(
                        padding: EdgeInsets.all(deviceWidth(context) * 0.02),
                        child: const Text(
                          """เอกสารนี้อาจมีข้อความที่ท่านยังไม่เข้าใจ โปรดสอบถามจากหัวหน้าโครงการวิจัยหรือผู้แทนให้อธิบาย ท่านจะได้รับเอกสารนี้ 1 ฉบับ หรือนำกลับไปปรึกษาหารือกับญาติ พี่น้อง เพื่อนสนิท แพทย์ประจำตัวของท่าน หรือผู้อื่นที่ท่านต้องการปรึกษา เพื่อช่วยในการตัดสินใจยินยอมเข้าร่วมการวิจัย 
            
            ชื่อโครงการ Speech Stroop Test แอปพลิเคชันเพื่อบ่งชี้ถึงภาวะการทำงานของสมองที่เสื่อมถอยลงที่มีความสัมพันธ์กับอายุสำหรับผู้สูงอายุในประเทศไทย
            
            ชื่อผู้วิจัย 
            1. นางสาวสุธาดา ธรรมวงศ์
            .  งสาอนัญญา พัฒนปุณยาภิรมย์
            3. ผศ.ดร. พร พันธุ์จงหาญ
            4. ดร.ศิรวัจน์ อิทธิภูริพัฒน์
            5. ผศ.ดร.เก็จแก้ว ธเนศวร
            สถานที่วิจัย 
            มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี เลขที่ 126 ถนนประชาอุทิศ แขวงบางมด เขตทุ่งครุ กรุงเทพฯ 10140 โทรศัพท์ 0-2470-8000
            
            โครงการวิจัยนี้ทำขึ้นเพื่อ บ่งชี้ถึงภาวะการทำงานของสมองที่เสื่อมถอยลงที่มีความสัมพันธ์กับอายุสำหรับผู้สูงอายุในประเทศไทย ซึ่งประโยชน์ที่คาดว่าจะได้รับคือ	
            1. ทราบถึงความสามารถของตนเองในการตอบคำถามด้านความคิดเชิงบริหาร
            2. ทราบถึงการจัดการกับความเครียดและความตื่นตัวของตนเอง
            3. ฝึกฝนทักษะและความคิดเชิงบริหารผ่านการทดสอบ Stroop
            
            ท่านได้รับเชิญให้เข้าร่วมวิจัยนี้เพราะท่านอยู่ในช่วงอายุที่กำหนดคือ เป็นนักศึกษาที่มีอายุ 18-60 ปี ในสังกัด มหาวิทยาลัยภายในประเทศไทย โดยไม่จำกัดคณะภาควิชาและชั้นปี หรือเป็น ผู้สูงอายุที่มีอายุ 60-80 ปี ที่อยู่ภายใต้การดูแลของโรงพยาบาลจุฬาลงกรณ์ สภากาชาดไทย ทั้งผู้ที่มีภาวะ MCI และไม่มีภาวะ MCI ที่ผ่านการคัดกรองเรียบร้อยแล้วด้วยแบบทดสอบ MoCA จากทางโรงพยาบาล มีสัญชาติไทย อ่านและพูดภาษาไทย ไม่มีภาวะตาบอดสี และไม่มีความผิดปกติทางสมอง  โดยจะมีผู้เข้าร่วมการทดลองเข้าร่วมวิจัยอย่างน้อย 50 คน
            
            ระยะเวลาการเก็บข้อมูลทั้งสิ้น 1 ปี 9 เดือน (เดือน เมษายน ปี พ.ศ. 2565 ถึงเดือนกันยายน ปี พ.ศ. 2566) โดยจะเก็บข้อมูลเพื่อที่จะนำไปรวบรวมข้อมูลเป็นค่ามาตรฐานภายในประเทศไทย ได้แก่ ชื่อผู้ใช้ อีเมล เบอร์โทรศัพท์ อายุ เพศ ระดับการศึกษา ความเครียด ผลลัพธ์การทำแบบทดสอบ ไฟล์เสียงระหว่างทำแบบทดสอบ และเลขบัตรประชาชน 13 หลัก เพื่อนำไปผูกข้อมูลกับทางศูนย์ประสาทศาสตร์ (Neuroscience center) ของโรงพยาบาลจุฬาลงกรณ์ สภากาชาดไทยเพื่อเข้าถึงข้อมูลบางส่วน เช่น โรคประจำตัว เป็นต้น 
            
            หากท่านตัดสินใจเป็นผู้เข้าร่วมการทดลอง จะมีขั้นตอนการวิจัยดังต่อไปนี้คือ
            1. ผู้เข้าร่วมการทดลองจะต้องทำการดาวน์โหลดแอป-พลิเคชัน Speech Stroop Test ผ่าน Google play สำหรับติดตั้งบนโทรศัพท์ ที่ใช้ระบบปฏิบัติการ Android หรือดาวน์โหลดผ่าน App store สำหรับติดตั้งบนโทรศัพท์ที่ใช้ระบบปฏิบัติการ ios
            2. ผู้เข้าร่วมการทดลองจะต้องทำการสมัครสมาชิกเพื่อใช้งานแอปพลิเคชัน Speech Stroop Test สำหรับการทำแบบทดสอบ โดยมีการเก็บข้อมูลในส่วนของ demographic ทั่วไป ได้แก่ ชื่อผู้ใช้ อีเมล เบอร์โทรศัพท์ อายุ เพศ ระดับการศึกษา และเลขบัตรประชาชน 13 หลัก
            3. ผู้เข้าร่วมการทดลองจะต้องทำแบบสอบถามเกี่ยวกับข้อมูลสุขภาพ ได้แก่ แบบสอบถามประเมินระดับความเครียด ฉบับภาษาไทย (10-Item Perceived Stress Scale; PSS-10) แบบสอบถามประเมินระดับการพักผ่อนนอนหลับ
            4. ผู้เข้าร่วมการทดลองจะต้องทำแบบทดสอบเพื่อประเมินตาบอดสี 
            5. ผู้เข้าร่วมการทดลองต้องทำการทดสอบไมโครโฟนของโทรศัพท์ที่ถูกใช้งานโดยผู้เข้าร่วมการทดลองจะต้องให้อนุญาตการเข้าถึงไมโครโฟนของโทรศัพท์
            6. ผู้เข้าร่วมการทดลองจะต้องทำแบบทดสอบเพื่อประเมินการจำแนกสี
            7. ผู้เข้าร่วมการทดลองจะต้องทำแบบทดสอบเพื่อประเมินการอ่านในภาษาไทย
            8. ผู้เข้าร่วมการทดลองจะต้องทำแบบทดสอบ Speech Stroop ซึ่งสามารถกดทำแบบทดสอบได้ทันทีผ่านหน้าหลักของแอปพลิเคชั่นโดยการทดลองใน 1 ครั้งจะถูกแบ่งย่อยเป็น 3 รอบ รอบละ 20 ข้อ ซึ่งในแต่ละรอบจะมีการเว้นช่วงในการพัก โดยสามารถพักได้เป็นระยะเวลาตามที่ต้องการ
            9. ในการทดลองจะใช้เวลาประมาณโดยเฉลี่ย 30 นาที หรืออาจมากกว่า ขึ้นอยู่กับระยะเวลาการพักของผู้เข้าร่วมการทดลอง
            
            ความเสี่ยงที่อาจเกิดขึ้นเมื่อเป็นอาสาสมัคร
            1. เสียเวลาในการทำแบบทดสอบ
            2. ท่านอาจรู้สึกอึดอัด เครียด และตื่นตัวในการทำแบบทดสอบที่ใช้เวลา ซึ่งท่านมีสิทธิ์ที่จะไม่ทำแบบทดสอบต่อได้
            3. ข้อมูลของท่านจะถูกดำเนินการด้วยวิธีการดังนี้ ชื่อผู้ใช้ อีเมล เบอร์โทรศัพท์ จะถูกเก็บไว้ในฐานข้อมูลของระบบนับตั้งแต่วันที่สมัครเข้าใช้งาน เพื่อใช้ในการตรวจสอบข้อมูลผู้ใช้งานเมื่อเข้าสู่ระบบ 
               - เลขบัตรประชาชนจะถูกเก็บไว้ในฐานข้อมูลของระบบนับตั้งแต่วันที่สมัครเข้าใช้งานเพื่อนำไปผูกข้อมูลกับทางศูนย์ประสาทศาสตร์ของโรงพยาบาลจุฬาลงกรณ์สภากาชาดเพื่อเข้าถึงข้อมูลบางส่วน เช่น โรคประจำตัว เป็นต้น
               - อายุ เพศ และ ระดับการศึกษา จะถูกเก็บไว้ในฐานข้อมูลของระบบนับตั้งแต่วันที่สมัครเข้าใช้งานเพื่อนำข้อมูลไปประกอบการวิจัยในการเชื่อมกับคะแนนที่ได้จากการทดสอบเพื่อหาค่ามาตรฐานให้กับประเทศไทย
            
            โดยรายละเอียดของระยะเวลาในการเก็บและทำลายข้อมูลดังกล่าวจะอยู่ในหัวข้อถัดไปหากท่านไม่รับเป็นอาสาสมัครเข้าร่วมการวิจัยนี้ก็จะไม่มีผลใด ๆ ต่อท่านหากมีอาการผิดปกติ รู้สึกไม่สบายกาย หรือมีผลกระทบต่อจิตใจของท่านเกิดขึ้นระหว่างการวิจัย ท่านสามารถแจ้งผู้วิจัยโดยเร็วที่สุดและยุติการทำแบบทดสอบในทันที 
            
            ระยะเวลาและการทำลายข้อมูล เก็บข้อมูลเป็นเวลา 1 ปี 5 เดือน (เดือน เมษายน ปี พ.ศ. 2565 ถึงเดือนกันยายน ปี พ.ศ. 2566) และหลังจากนั้นจะทำลายข้อมูล โดยลบข้อมูลออกจากฐานข้อมูล
            
            หากมีข้อข้องใจที่จะสอบถามเกี่ยวข้องกับการวิจัย หรือเมื่อบาดเจ็บ/เจ็บป่วยจากการวิจัยโปรดติดต่อ นางสาวสุธาดา ธรรมวงศ์ เบอร์โทรศัพท์ 065-634-6107
            
            ค่าตอบแทนที่จะได้รับ ไม่มี
            
            ค่าใช้จ่ายที่อาสาสมัครจะต้องรับผิดชอบเองมีอะไรบ้าง ไม่มี 
            
            หากมีข้อมูลเพิ่มเติมทั้งด้านประโยชน์และโทษที่เกี่ยวข้องกับการวิจัยนี้ ผู้วิจัยจะแจ้งให้ทราบอย่างรวดเร็วและไม่ปิดบังข้อมูลของอาสาสมัครจะถูกเก็บรักษาไว้ ไม่เปิดเผยต่อสาธารณะ แต่จะรายงานผลการวิจัยเป็นข้อมูลส่วนรวม  
            
            อาสาสมัครมีสิทธิ์ถอนตัวออกจากโครงการวิจัยเมื่อใดก็ได้ โดยไม่ต้องแจ้งให้ทราบล่วงหน้าและการไม่เข้าร่วมการวิจัยหรือถอนตัวออกจากโครงการวิจัยนี้ จะไม่มีผลกระทบต่อการบริการและการรักษาที่สมควรจะได้รับแต่ประการใด
            
            โครงการวิจัยนี้ได้รับการพิจารณารับรองจากคณะกรรมการจริยธรรมการวิจัยในมนุษย์ของ มหาวิทยาลัยเทคโนโลยี พระจอมเกล้าธนบุรี ซึ่งมีสำนักงานอยู่ที่ สำนักงานวิจัย นวัตกรรมและพันธมิตร ชั้น 7 อาคารสานักงานอธิการบดี 
            มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี เลขที่ 126 ถนนประชาอุทิศ แขวงบางมด เขตทุ่งครุ กรุงเทพฯ 10140 
            โทรศัพท์ 0-2470-9623 โทรสาร 0-2872-9083 
            
            หากท่านได้รับการปฏิบัติไม่ตรงตามที่ระบุไว้ ท่านสามารถติดต่อกับประธานคณะกรรมการฯ หรือผู้แทนได้ตามสถานที่และหมายเลขโทรศัพท์ข้างต้น""",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ))),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (bool value) {
                          setState(() {
                            isChecked = value;
                          });
                        },
                      ),
                      const Flexible(
                        child: Text(
                          """ข้าพเจ้าได้อ่านรายละเอียดในเอกสารนี้และเข้าใจครบถ้วนแล้วและขอเข้าร่วม โครงการวิจัย เรื่อง Speech Stroop Test แอปพลิเคชันเพื่อบ่งชี้ถึงภาวะการ ทำงานของสมองที่เสื่อมถอยลงที่มีความสัมพันธ์กับอายุสำหรับผู้สูงอายุในประเทศไทย""",
                          style: TextStyle(fontSize: 14, letterSpacing: 0.5),
                        ),
                      ),
                    ],
                  ),
                  FloatingButton(() => {
                        if (isChecked)
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen()))
                          }
                      })
                ],
              ),
            ])),
      ),
    );
  }
}
