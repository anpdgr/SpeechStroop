import 'package:flutter/widgets.dart';
import 'package:speech_stroop/screens/auth/login.dart';
import 'package:speech_stroop/screens/auth/register.dart';
import 'package:speech_stroop/screens/auth/register2.dart';
import 'package:speech_stroop/screens/auth/register_sleep.dart';
import 'package:speech_stroop/screens/auth/register_stress.dart';
import 'package:speech_stroop/screens/auth/terms_conditions.dart';
import 'package:speech_stroop/screens/overview/overview_screen.dart';
import 'package:speech_stroop/screens/precondition_test/color_test.dart';
import 'package:speech_stroop/screens/precondition_test/microphone_test.dart';
import 'package:speech_stroop/screens/precondition_test/reading_test.dart';
import 'package:speech_stroop/screens/stroop/break/break_screen.dart';
import 'package:speech_stroop/screens/stroop/stroop_test/stroop_test.dart';

// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  OverviewScreen.routeName: (context) => const OverviewScreen(),

  // Auth
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  Register2Screen.routeName: (context) => const Register2Screen(),
  StressRegisterScreen.routeName: (context) => const StressRegisterScreen(),
  SleepRegisterScreen.routeName: (context) => const SleepRegisterScreen(),
  TermsConditionsScreen.routeName: (context) => const TermsConditionsScreen(),

  // PreCondition Test
  ColorTestScreen.routeName: (context) => const ColorTestScreen(),
  MicrophoneTestScreen.routeName: (context) => const MicrophoneTestScreen(),
  ReadingTestScreen.routeName: (context) => const ReadingTestScreen(),

  // Stroop Test
  StroopTestScreen.routeName: (context) => const StroopTestScreen(),
  BreakScreen.routeName: (context) => const BreakScreen(),
};
