import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_engforit/Screens/courses/components/course_card.dart';
import 'package:flutter_engforit/Screens/quiz_contents/quiz_15_minutes.dart';
import 'package:flutter_engforit/Screens/quiz_contents/quiz_30_minutes.dart';
import 'package:flutter_engforit/Screens/quiz_contents/quiz_45_minutes.dart';
import 'package:flutter_engforit/Screens/quiz_contents/quiz_5_minutes.dart';
import 'package:flutter_engforit/Screens/quiz_contents/quiz_60_minutes.dart';
import 'package:flutter_engforit/components/app_bar.dart';
import 'package:lottie/lottie.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key key}) : super(key: key);
  static String id = 'quiz_screen';

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Future<LottieComposition> composition5Mins;
  Future<LottieComposition> composition15Mins;
  Future<LottieComposition> composition30Mins;
  Future<LottieComposition> composition45Mins;
  Future<LottieComposition> composition60Mins;

  Future<LottieComposition> _loadComposition(String path) async {
    var assetData = await rootBundle.load(path);
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  void initState() {
    composition5Mins = _loadComposition('assets/images/5_min.json'); // 4DCCCE
    composition15Mins =
        _loadComposition('assets/images/15_mins.json'); // 4DAFEE / F6F6F6
    composition30Mins =
        _loadComposition('assets/images/30_mins.json'); // F24D18
    composition45Mins =
        _loadComposition('assets/images/45_minutes.json'); // 4A57BB
    composition60Mins = _loadComposition('assets/images/1_hour.json'); // F24242
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Appbar(
      title: 'Quiz',
      body: SingleChildScrollView(
        child: Column(
          children: [
            CourseCard(
              bottomMargin: 16,
              topMargin: 16,
              composition: composition5Mins,
              cardColor: const Color(0xff141D60),
              title: '5 Minutes',
              description: '',
              tapped: () {
                Navigator.pushNamed(context, Quiz5Minutes.id);
              },
            ),
            CourseCard(
              bottomMargin: 16,
              topMargin: 16,
              composition: composition15Mins,
              cardColor: const Color(0xFF4DAFEE),
              title: '15 Minutes',
              description: '',
              tapped: () {
                Navigator.pushNamed(context, Quiz15Minutes.id);
              },
            ),
            CourseCard(
              bottomMargin: 16,
              topMargin: 16,
              composition: composition30Mins,
              cardColor: const Color(0xffF24D18),
              title: '30 Minutes',
              description: '',
              tapped: () {
                Navigator.pushNamed(context, Quiz30Minutes.id);
              },
            ),
            CourseCard(
              bottomMargin: 16,
              topMargin: 16,
              composition: composition45Mins,
              cardColor: const Color(0xffA272FF),
              title: '45 Minutes',
              description: '',
              tapped: () {
                Navigator.pushNamed(context, Quiz45Minutes.id);
              },
            ),
            CourseCard(
              bottomMargin: 16,
              topMargin: 16,
              composition: composition60Mins,
              cardColor: const Color(0xffF24242),
              title: '60 Minutes',
              description: '',
              tapped: () {
                Navigator.pushNamed(context, Quiz60Minutes.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
