import 'package:flutter/widgets.dart';
import 'package:speech_stroop/screens/auth/login.dart';
import 'package:speech_stroop/screens/auth/register.dart';
import 'package:speech_stroop/screens/auth/register2.dart';
import 'package:speech_stroop/screens/auth/register_sleep.dart';
import 'package:speech_stroop/screens/auth/register_stress.dart';
import 'package:speech_stroop/screens/auth/terms_conditions.dart';
import 'package:speech_stroop/screens/history_all/history_all_screen.dart';
import 'package:speech_stroop/screens/history/history_screen.dart';
import 'package:speech_stroop/screens/home/home_screen.dart';
import 'package:speech_stroop/screens/overview/overview_screen.dart';
import 'package:speech_stroop/screens/profile/profile_screen.dart';
import 'package:speech_stroop/screens/precondition_test/color_test/color_test.dart';
import 'package:speech_stroop/screens/precondition_test/color_test/fail_color_test.dart';
import 'package:speech_stroop/screens/precondition_test/color_test/pass_color_test.dart';
import 'package:speech_stroop/screens/precondition_test/introduction.dart';
import 'package:speech_stroop/screens/precondition_test/microphone_test/fail_microphone_test.dart';
import 'package:speech_stroop/screens/precondition_test/microphone_test/microphone_test.dart';
import 'package:speech_stroop/screens/precondition_test/microphone_test/pass_microphone_test.dart';
import 'package:speech_stroop/screens/precondition_test/reading_test/fail_reading_test.dart';
import 'package:speech_stroop/screens/precondition_test/reading_test/pass_reading_test.dart';
import 'package:speech_stroop/screens/precondition_test/reading_test/reading_test.dart';
import 'package:speech_stroop/screens/stroop/healthRating/break_screen.dart';
import 'package:speech_stroop/screens/stroop/result/result_screen.dart';
import 'package:speech_stroop/screens/stroop/stroop_test/stroop_test.dart';

// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  OverviewScreen.routeName: (context) => const OverviewScreen(),

  // Auth
  LoginScreen.routeName: (context) => const LoginScreen(),
  TermsConditionsScreen.routeName: (context) => const TermsConditionsScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  Register2Screen.routeName: (context) => const Register2Screen(),
  StressRegisterScreen.routeName: (context) => const StressRegisterScreen(),
  SleepRegisterScreen.routeName: (context) => const SleepRegisterScreen(),

  // PreCondition Test
  IntroductionScreen.routeName: (context) => const IntroductionScreen(),
  MicrophoneTestScreen.routeName: (context) => const MicrophoneTestScreen(),
  PassMicrophoneTestScreen.routeName: (context) =>
      const PassMicrophoneTestScreen(),
  FailMicrophoneTestScreen.routeName: (context) =>
      const FailMicrophoneTestScreen(),
  ColorTestScreen.routeName: (context) => const ColorTestScreen(),
  PassColorTestScreen.routeName: (context) => const PassColorTestScreen(),
  FailColorTestScreen.routeName: (context) => const FailColorTestScreen(),
  ReadingTestScreen.routeName: (context) => const ReadingTestScreen(),
  PassReadingTestScreen.routeName: (context) => const PassReadingTestScreen(),
  FailReadingTestScreen.routeName: (context) => const FailReadingTestScreen(),

  // Stroop Test
  StroopTestScreen.routeName: (context) => const StroopTestScreen(),
  BreakScreen.routeName: (context) => BreakScreen(),
  //ResultScreen.routeName: (context) =>  ResultScreen(),

  // Buttom NevBar
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  HistoryScreen.routeName: (context) => const HistoryScreen(),
  HistoryAllScreen.routeName: (context) => const HistoryAllScreen(),
};
