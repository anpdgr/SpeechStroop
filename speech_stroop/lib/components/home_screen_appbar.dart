import 'package:flutter/material.dart';
import 'package:speech_stroop/constants.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final bool leading;

  HomeScreenAppBar(this.text, this.leading);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // dynamic ld;
    // if (leading == true) {
    //   ld = IconButton(
    //     icon: const Icon(
    //       Icons.arrow_back,
    //       color: Color(0xFFEB8D8D),
    //     ),
    //     onPressed: () => Navigator.pop(context, false),
    //   );
    // }

    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      title: Text(text, style: Theme.of(context).textTheme.headlineMedium),
    );
  }
}
