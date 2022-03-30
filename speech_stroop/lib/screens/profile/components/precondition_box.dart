import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';
import 'package:speech_stroop/screens/precondition_test/color_test/color_test.dart';
import 'package:speech_stroop/screens/precondition_test/introduction.dart';

var date = "02 มกราคม 2564";

class PreconditionBox extends StatelessWidget {
  PreconditionBox(this.title);
  final String title;
  String preconditionImage = 'assets/images/failed.png';
  String testRoute;
  bool isPass = true; // TODO: not hard code

  String getPreconditionImage() {
    (isPass
        ? preconditionImage = 'assets/images/pass.png'
        : 'assets/images/failed.png');
    return preconditionImage;
  }

  String getTestRoute() {
    switch (title) {
      case "ทดสอบการจำแนกสี":
        testRoute = ColorTestScreen.routeName;
        break;
      case "ทดสอบการอ่าน":
        testRoute = IntroductionScreen.routeName;
        break;
      default:
        //TODO handle err
        testRoute = IntroductionScreen.routeName;
    }
    return testRoute;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
          color: softPrimaryColor, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style:
                Theme.of(context).textTheme.titleLarge.apply(color: formText),
          ),
          const SizedBox(height: 20),
          Image.asset(
            getPreconditionImage(),
            width: 31,
            height: 31,
          ),
          const SizedBox(height: 20),
          Text(
            "เมื่อวันที่ $date",
            style:
                Theme.of(context).textTheme.titleMedium.apply(color: formText),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, getTestRoute());
            },
            child: const Text('ทดสอบอีกครั้ง'),
            style: TextButton.styleFrom(
              shape: const StadiumBorder(),
              textStyle: Theme.of(context).textTheme.titleMedium.apply(
                    color: primaryColor,
                    decoration: TextDecoration.underline,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
