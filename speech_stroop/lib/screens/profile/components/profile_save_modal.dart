import 'package:flutter/material.dart';
import 'package:speech_stroop/components/button/primary_button.dart';
import 'package:speech_stroop/components/button/secondary_button.dart';

class ProfileSaveModal extends StatelessWidget {
  const ProfileSaveModal({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
                  PrimaryButton("บันทึก", () => {print('save')}),
                  SecondaryButton("ยกเลิก", () => Navigator.pop(context, false))
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
