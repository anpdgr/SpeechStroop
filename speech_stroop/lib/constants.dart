import 'package:flutter/material.dart';

// Color
Map<int, Color> color = {
  50: const Color.fromRGBO(4, 131, 184, .1),
  100: const Color.fromRGBO(4, 131, 184, .2),
  200: const Color.fromRGBO(4, 131, 184, .3),
  300: const Color.fromRGBO(4, 131, 184, .4),
  400: const Color.fromRGBO(4, 131, 184, .5),
  500: const Color.fromRGBO(4, 131, 184, .6),
  600: const Color.fromRGBO(4, 131, 184, .7),
  700: const Color.fromRGBO(4, 131, 184, .8),
  800: const Color.fromRGBO(4, 131, 184, .9),
  900: const Color.fromRGBO(4, 131, 184, 1),
};

MaterialColor primaryColorMaterial = MaterialColor(0xFF37265F, color);
Color primaryColor = const Color(0xFF37265F);

MaterialColor secondaryColorMaterial = MaterialColor(0xFFEB8D8D, color);
Color secondaryColor = const Color(0xFFEB8D8D);

Color softPrimaryColor = const Color(0xFFF4F4F9);
