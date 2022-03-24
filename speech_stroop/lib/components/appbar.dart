import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';

class AppBarBack extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  AppBarBack(this.text);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: Border(bottom: BorderSide(color: tertiaryColor, width: 1)),
      backgroundColor: const Color(0xFFFBFBFF),
      //TODO: change to false
      automaticallyImplyLeading: true,
      //`true` if you want Flutter to automatically add Back Button when needed,
      //or `false` if you want to force your own back button every where
      centerTitle: true,
      title: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF37265F)),
      ),
      elevation: 0,
      // leading: IconButton(
      //   icon: const Icon(
      //     Icons.arrow_back,
      //     color: Color(0xFFEB8D8D),
      //   ),
      //   onPressed: () => Navigator.pop(context, false),
      // )
    );
  }
}
