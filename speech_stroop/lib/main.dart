import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:speech_stroop/screens/overview/overview_screen.dart';
import 'package:speech_stroop/theme.dart';
import 'package:speech_stroop/routes.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Intl.defaultLocale = "th";
  initializeDateFormatting();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speech Stroop Application',
      theme: theme(),
      initialRoute: OverviewScreen.routeName,
      // home: OverviewScreen(),
      routes: routes,
    );
  }
}
