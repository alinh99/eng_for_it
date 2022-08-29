import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_engforit/Screens/courses/components/course_card.dart';
import 'package:flutter_engforit/components/app_bar.dart';
import 'package:lottie/lottie.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key key}) : super(key: key);
  static String id = 'quiz_screen';
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Future<LottieComposition> compositionQuiz;
  Future<LottieComposition> compositionGuessWord;
  Future<LottieComposition> compositionGuessMeaning;

  Future<LottieComposition> _loadComposition(String path) async {
    var assetData = await rootBundle.load(path);
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  void initState() {
    compositionQuiz = _loadComposition('assets/images/quiz.json');
    compositionGuessWord = _loadComposition('assets/images/guess_word.json');
    compositionGuessMeaning =
        _loadComposition('assets/images/guess_meaning.json');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Appbar(
      title: 'Quiz',
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CourseCard(
              bottomMargin: 16,
              topMargin: 16,
              description: '',
              composition: compositionQuiz,
              title: 'Quiz',
              tapped: () {},
              cardColor: const Color(0xFF915CE2),
            ),
            CourseCard(
              composition: compositionGuessWord,
              bottomMargin: 16,
              topMargin: 16,
              description: '',
              title: 'Guess Words',
              tapped: () {},
              cardColor: const Color(0xFF3D4E99),
            ),
            CourseCard(
              composition: compositionGuessMeaning,
              bottomMargin: 16,
              topMargin: 16,
              description: '',
              title: 'Guess Meanings',
              tapped: () {},
              cardColor: const Color(0xFFF21470),
            ),
          ],
        ),
      ),
    );
  }
}
