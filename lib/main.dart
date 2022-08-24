import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_engforit/Screens/contents/unit1/listening_unit1.dart';
import 'package:flutter_engforit/Screens/contents/unit1/reading_unit1.dart';
import 'package:flutter_engforit/Screens/contents/unit1/speaking_unit1.dart';
import 'package:flutter_engforit/Screens/contents/unit1/writing_unit1.dart';
import 'package:flutter_engforit/Screens/contents/unit2/listening_unit2.dart';
import 'package:flutter_engforit/Screens/contents/unit2/reading_unit2.dart';
import 'package:flutter_engforit/Screens/contents/unit2/speaking_unit2.dart';
import 'package:flutter_engforit/Screens/contents/unit2/writing_unit2.dart';
import 'package:flutter_engforit/Screens/contents/unit3/listening_unit3.dart';
import 'package:flutter_engforit/Screens/contents/unit3/reading_unit3.dart';
import 'package:flutter_engforit/Screens/contents/unit3/speaking_unit3.dart';
import 'package:flutter_engforit/Screens/contents/unit3/writing_unit3.dart';
import 'package:flutter_engforit/Screens/contents/unit4/listening_unit4.dart';
import 'package:flutter_engforit/Screens/contents/unit4/reading_unit4.dart';
import 'package:flutter_engforit/Screens/contents/unit4/speaking_unit4.dart';
import 'package:flutter_engforit/Screens/contents/unit4/writing_unit4.dart';
import 'package:flutter_engforit/Screens/contents/unit5/listening_unit5.dart';
import 'package:flutter_engforit/Screens/contents/unit5/reading_unit5.dart';
import 'package:flutter_engforit/Screens/contents/unit5/speaking_unit5.dart';
import 'package:flutter_engforit/Screens/contents/unit5/writing_unit4.dart';
import 'package:flutter_engforit/Screens/courses/courses.dart';
import 'package:flutter_engforit/Screens/enroll_lesson/components/enroll_successfull%20_reading.dart';
import 'package:flutter_engforit/Screens/enroll_lesson/components/enroll_successfull_listening.dart';
import 'package:flutter_engforit/Screens/enroll_lesson/components/enroll_successfull_speaking.dart';
import 'package:flutter_engforit/Screens/enroll_lesson/components/enroll_successfull_writing.dart';
import 'package:flutter_engforit/Screens/enroll_lesson/listening.dart';
import 'package:flutter_engforit/Screens/enroll_lesson/reading.dart';
import 'package:flutter_engforit/Screens/enroll_lesson/speaking.dart';
import 'package:flutter_engforit/Screens/enroll_lesson/writing.dart';
import 'package:flutter_engforit/Screens/home/home.dart';
import 'package:flutter_engforit/Screens/lesson_detail/listening_detail.dart';
import 'package:flutter_engforit/Screens/lesson_detail/reading_detail.dart';
import 'package:flutter_engforit/Screens/lesson_detail/speaking_detail.dart';
import 'package:flutter_engforit/Screens/lesson_detail/writing_detail.dart';
import 'package:flutter_engforit/Screens/login/error.dart';
import 'package:flutter_engforit/Screens/login/login.dart';
import 'package:flutter_engforit/Screens/login/successfully_login.dart';
import 'package:flutter_engforit/Screens/login/successfully_register.dart';
import 'package:flutter_engforit/Screens/profile/profile.dart';
import 'package:flutter_engforit/Screens/settings/settings.dart';
import 'package:flutter_engforit/Screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engforit/user_models/users.dart';
import 'package:flutter_engforit/user_services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return StreamProvider<Users>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SafeArea(
          child: Scaffold(
            body: Splash(),
          ),
        ),
        routes: {
          Splash.id: (context) => const Splash(),
          Login.id: (context) => const Login(),
          Home.id: (context) => const Home(),
          SuccessfulLogin.id: (context) => const SuccessfulLogin(),
          SuccessfulRegister.id: (context) => const SuccessfulRegister(),
          Courses.id: (context) => const Courses(),
          Listening.id: (context) => const Listening(),
          Reading.id: (context) => const Reading(),
          Speaking.id: (context) => const Speaking(),
          Writing.id: (context) => const Writing(),
          SuccessfulEnrollReading.id: (context) =>
              const SuccessfulEnrollReading(),
          SuccessfulEnrollSpeaking.id: (context) =>
              const SuccessfulEnrollSpeaking(),
          SuccessfulEnrollWriting.id: (context) =>
              const SuccessfulEnrollWriting(),
          SuccessfulEnrollListening.id: (context) =>
              const SuccessfulEnrollListening(),
          ListeningDetail.id: (context) => const ListeningDetail(),
          ReadingDetail.id: (context) => const ReadingDetail(),
          SpeakingDetail.id: (context) => const SpeakingDetail(),
          WritingDetail.id: (context) => const WritingDetail(),
          ListeningUnit1.id: (context) => const ListeningUnit1(),
          ListeningUnit2.id: (context) => const ListeningUnit2(),
          ListeningUnit3.id: (context) => const ListeningUnit3(),
          ListeningUnit4.id: (context) => const ListeningUnit4(),
          ListeningUnit5.id: (context) => const ListeningUnit5(),
          ReadingUnit1.id: (context) => const ReadingUnit1(),
          ReadingUnit2.id: (context) => const ReadingUnit2(),
          ReadingUnit3.id: (context) => const ReadingUnit3(),
          ReadingUnit4.id: (context) => const ReadingUnit4(),
          ReadingUnit5.id: (context) => const ReadingUnit5(),
          WritingUnit1.id: (context) => const WritingUnit1(),
          WritingUnit2.id: (context) => const WritingUnit2(),
          WritingUnit3.id: (context) => const WritingUnit3(),
          WritingUnit4.id: (context) => const WritingUnit4(),
          WritingUnit5.id: (context) => const WritingUnit5(),
          SpeakingUnit1.id: (context) => const SpeakingUnit1(),
          SpeakingUnit2.id: (context) => const SpeakingUnit2(),
          SpeakingUnit3.id: (context) => const SpeakingUnit3(),
          SpeakingUnit4.id: (context) => const SpeakingUnit4(),
          SpeakingUnit5.id: (context) => const SpeakingUnit5(),
          Settings.id: (context) => const Settings(),
          Profile.id: (context) => const Profile(),
          Error.id:(context) => const Error(),
        },
      ),
    );
  }
}
