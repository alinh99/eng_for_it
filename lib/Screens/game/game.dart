import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_engforit/Screens/courses/components/course_card.dart';
import 'package:flutter_engforit/Screens/quiz/quiz.dart';
import 'package:flutter_engforit/components/bottom_navigation_bar.dart';
import 'package:flutter_engforit/enum.dart';
import 'package:lottie/lottie.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key key}) : super(key: key);
  static String id = 'game_screen';
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
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
    return Scaffold(
      backgroundColor: const Color(0xFFEFF9FF),
      bottomNavigationBar: const CustomBottomNavBar(selected: MenuState.quiz),
      appBar: AppBar(
        title: const Text(
          'Games',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CourseCard(
              bottomMargin: 16,
              topMargin: 16,
              description:
                  'Quizzes can be used as a brief assessment in education to measure growth in knowledge, abilities, or skills',
              composition: compositionQuiz,
              title: 'Quiz',
              tapped: () {
                Navigator.pushNamed(context, QuizScreen.id);
              },
              cardColor: const Color(0xFF915CE2),
            ),
            CourseCard(
              composition: compositionGuessWord,
              bottomMargin: 16,
              topMargin: 16,
              description:
                  'Guess word is a fun vocabulary game for young learners on the CEFR',
              title: 'Guess Words',
              tapped: () {},
              cardColor: const Color(0xFF3D4E99),
            ),
            CourseCard(
              composition: compositionGuessMeaning,
              bottomMargin: 16,
              topMargin: 16,
              description:
                  'When you guess the meaning of a word, you need to consider first the immediate context',
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
