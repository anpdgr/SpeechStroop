import 'package:flutter/material.dart';

class AppBarBack extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  AppBarBack(this.text);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color(0xFFFBFBFF),
        automaticallyImplyLeading: true,
        //`true` if you want Flutter to automatically add Back Button when needed,
        //or `false` if you want to force your own back button every where
        title: Column(children: [
          Text(
            text,
            textAlign: TextAlign.start,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xFF37265F)),
          ),
          const Divider(
            color: Color(0xFFFFE7E2),
            thickness: 0.5,
          )
        ]),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFEB8D8D),
          ),
          onPressed: () => Navigator.pop(context, false),
        ));
  }
}
