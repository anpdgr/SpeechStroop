import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';

var date = "02 มกราคม 2564";

class PreconditionBox extends StatelessWidget {
  PreconditionBox(this.title);
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 20),
          Image.asset('assets/images/pass.png'),
          const SizedBox(height: 20),
          Text(
            "เมื่อวันที่ $date",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                .apply(color: Color(0xFF525252)),
          ),
          TextButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const StroopTestScreen()));
              },
              child: const Text('ทดสอบอีกครั้ง'),
              style: TextButton.styleFrom(
                  shape: const StadiumBorder(),
                  textStyle: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                      fontFamily: 'BaiJamjuree',
                      color: Color(0xFF838383))))
        ],
      ),
    );
  }
}
