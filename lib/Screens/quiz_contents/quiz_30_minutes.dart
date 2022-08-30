import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_engforit/Screens/quiz_contents/components/count_down.dart';
import 'package:flutter_engforit/Screens/quiz_contents/components/next_button.dart';
import 'package:flutter_engforit/Screens/quiz_contents/components/option_card.dart';
import 'package:flutter_engforit/Screens/quiz_contents/components/question_widget.dart';
import 'package:flutter_engforit/Screens/quiz_contents/components/result_box.dart';
import 'package:flutter_engforit/Screens/quiz_contents/models/quiz.dart';
import 'package:flutter_engforit/Screens/quiz_contents/models/quiz_db.dart';
import 'package:flutter_engforit/components/lottie_animation.dart';
import 'package:lottie/lottie.dart';

class Quiz30Minutes extends StatefulWidget {
  const Quiz30Minutes({Key key}) : super(key: key);
  static String id = 'quiz_30_minutes';

  @override
  State<Quiz30Minutes> createState() => _Quiz30MinutesState();
}

class _Quiz30MinutesState extends State<Quiz30Minutes>
    with TickerProviderStateMixin {
  QuizDB db = QuizDB();
  Future _questions;
  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isSelected = false;
  AnimationController _controller;
  int levelClock = 1800;
  Future<LottieComposition> compositionTime;
  Future<List<Quiz>> getData() async {
    return db.fetchQuestion();
  }

  Future<LottieComposition> _loadComposition(String path) async {
    var assetData = await rootBundle.load(path);
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  void initState() {
    compositionTime = _loadComposition('assets/images/count_down.json');
    _questions = getData();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: levelClock,
        ) // gameData.levelClock is a user entered number elsewhere in the applciation
        );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        showDialog(
          context: context,
          barrierDismissible:
              false, // disable dismiss function on clicking outside of box
          builder: (ctx) => ResultBox(
            backgroundColor: const Color(0xffF24D18),
            result: score,
            questionLength: 15,
            press: startOver,
          ),
        );
      }
    });
    _controller.forward();
    super.initState();
  }

  // create a function to display next question
  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isSelected = false;
    });
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: levelClock,
        ) // gameData.levelClock is a user entered number elsewhere in the applciation
        );

    _controller.forward();
    Navigator.pop(context);
  }

  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      showDialog(
        context: context,
        barrierDismissible:
            false, // disable dismiss function on clicking outside of box
        builder: (ctx) => ResultBox(
          backgroundColor: const Color(0xffF24D18),
          result: score,
          questionLength: questionLength,
          press: startOver,
        ),
      );
      _controller.stop();
      _controller.reset();
    } else {
      if (isPressed) {
        setState(
          () {
            index++;
            isPressed = false;
            isSelected = false;
          },
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select any option'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(vertical: 20),
          ),
        );
      }
    }
  }

  checkAnswerAndUpdate(bool value) {
    if (isSelected) {
      return;
    } else {
      setState(
        () {
          isPressed = true;
          isSelected = true;
        },
      );
      if (value) {
        score++;
      } else {
        score += 0;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _questions as Future<List<Quiz>>,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var extractedData = snapshot.data as List<Quiz>;
            return Scaffold(
              bottomNavigationBar: GestureDetector(
                onTap: () {
                  nextQuestion((extractedData.length / 2.4).round());
                },
                child: const NextButton(
                  color: Color(0xffF24D18),
                ),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      QuestionWidget(
                        question: extractedData[index].title,
                        currentQuestion: index,
                        questionLength: (extractedData.length / 2.4).round(),
                        title: '30 Minutes',
                        time: Countdown(
                          animation: StepTween(
                            begin: levelClock, // THIS IS A USER ENTERED NUMBER
                            end: 0,
                          ).animate(_controller),
                        ),
                        color: const Color(0xffF24D18),
                      ),
                      Column(
                        children: [
                          for (int i = 0;
                              i < extractedData[index].options.length;
                              i++)
                            GestureDetector(
                              onTap: () {
                                checkAnswerAndUpdate(
                                  extractedData[index]
                                      .options
                                      .values
                                      .toList()[i],
                                );
                              },
                              child: OptionCard(
                                cardColor: isPressed
                                    ? extractedData[index]
                                                .options
                                                .values
                                                .toList()[i] ==
                                            true
                                        ? Colors.green[300]
                                        : Colors.red[300]
                                    : Colors.white,
                                textColor:
                                    isPressed ? Colors.white : Colors.black,
                                topMargin: 16,
                                bottomMargin: 16,
                                option: extractedData[index]
                                    .options
                                    .keys
                                    .toList()[i],
                                borderColor: isPressed
                                    ? extractedData[index]
                                                .options
                                                .values
                                                .toList()[i] ==
                                            true
                                        ? Colors.green
                                        : Colors.red
                                    : Colors.grey,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            Future.delayed(
              const Duration(seconds: 10),
            );
            return Scaffold(
              backgroundColor: const Color(0xFFEFF9FF),
              body: SafeArea(
                child: LottieAnimation(
                  composition: compositionTime,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
            );
          }
        });
  }
}
