import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engforit/Screens/quiz_contents/components/count_down.dart';
import 'package:flutter_engforit/Screens/quiz_contents/components/next_button.dart';
import 'package:flutter_engforit/Screens/quiz_contents/components/option_card.dart';
import 'package:flutter_engforit/Screens/quiz_contents/components/question_widget.dart';
import 'package:flutter_engforit/Screens/quiz_contents/components/result_box.dart';
import 'package:flutter_engforit/Screens/quiz_contents/models/quiz.dart';
import 'package:flutter_engforit/Screens/quiz_contents/models/quiz_db.dart';
import 'package:flutter_engforit/colors.dart';
import 'package:flutter_engforit/components/app_bar.dart';
import 'package:flutter_engforit/components/fixed_button.dart';
import 'package:flutter_engforit/constants.dart';

class Quiz5Minutes extends StatefulWidget {
  const Quiz5Minutes({Key key}) : super(key: key);
  static String id = 'quiz_5_minutes';

  @override
  State<Quiz5Minutes> createState() => _Quiz5MinutesState();
}

class _Quiz5MinutesState extends State<Quiz5Minutes>
    with TickerProviderStateMixin {
  QuizDB db = QuizDB();
  Future _questions;
  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isSelected = false;
  AnimationController _controller;
  // AnimationController _controller2;
  int levelClock = 300;

  Future<List<Quiz>> getData() async {
    return db.fetchQuestion();
  }

  @override
  void initState() {
    _questions = getData();
    super.initState();
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
            result: score,
            questionLength: 15,
            press: startOver,
          ),
        );
      }
    });
    _controller.forward();
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
          result: score,
          questionLength: questionLength,
          press: startOver,
        ),
      );
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

  void checkAnswerAndUpdate(bool value) {
    if (isSelected) {
      return;
    } else {
      if (value) {
        score++;
      }
      setState(
        () {
          isPressed = true;
          isSelected = true;
        },
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //floatingActionButton: ,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  color: Color(0xff8c5ae3),
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          children: const [
                            Center(
                              child: Text(
                                '5 Minutes',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'Question 01/16',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Row(
                            children: const [
                              Icon(
                                CupertinoIcons.clock,
                                color: Colors.white,
                                size: 16,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                '54:03',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(40),
                          margin: const EdgeInsets.only(top: 32),
                          child: const Text(
                            'What Country is also known as Persia?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  OptionCard(
                    topMargin: 32,
                    option: 'Sri Lanka',
                  ),
                  OptionCard(
                    topMargin: 16,
                    option: 'America',
                  ),
                  OptionCard(
                    topMargin: 16,
                    option: 'Kenya',
                  ),
                  OptionCard(
                    topMargin: 16,
                    option: 'Iran',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    // return FutureBuilder(
    //   future: _questions as Future<List<Quiz>>,
    //   builder: (ctx, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       if (snapshot.hasError) {
    //         return Center(
    //           child: Text('${snapshot.error}'),
    //         );
    //       } else if (snapshot.hasData) {
    //         var extractedData = snapshot.data as List<Quiz>;
    //         return Scaffold(
    //           backgroundColor: AppColors.darkPink,
    //           floatingActionButton: GestureDetector(
    //             onTap: () => nextQuestion((extractedData.length / 9).round()),
    //             child: const Padding(
    //               padding: EdgeInsets.symmetric(horizontal: 11.0),
    //               child: NextButton(),
    //             ),
    //           ),
    //           floatingActionButtonLocation:
    //               FloatingActionButtonLocation.centerFloat,
    //           body: SafeArea(
    //             child: SingleChildScrollView(
    //               scrollDirection: Axis.vertical,
    //               child: Container(
    //                 padding: const EdgeInsets.symmetric(
    //                   horizontal: 10.0,
    //                 ),
    //                 // color: AppColors.darkPink,
    //                 width: double.infinity,
    //                 height: MediaQuery.of(context).size.height,
    //                 child: Column(
    //                   children: [
    //                     Row(
    //                       children: [
    //                         IconButton(
    //                           onPressed: () => Navigator.pop(context),
    //                           icon: const Icon(Icons.arrow_back),
    //                           alignment: Alignment.center,
    //                           color: Colors.white,
    //                         ),
    //                         Expanded(
    //                           child: Text(
    //                             "Score: $score",
    //                             textAlign: TextAlign.right,
    //                             style: const TextStyle(
    //                                 color: kNeutralAnswerColor, fontSize: 18.0),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                     QuestionWidget(
    //                       question:
    //                           extractedData[index].title, // currently at 0
    //                       indexQuestion:
    //                           index, // means the first qs in the list
    //                       totalQuestion: (extractedData.length / 9)
    //                           .round(), // total length of the list
    //                     ),
    //                     const Divider(
    //                       color: kNeutralAnswerColor,
    //                     ),
    //                     Countdown(
    //                       animation: StepTween(
    //                         begin: levelClock, // THIS IS A USER ENTERED NUMBER
    //                         end: 0,
    //                       ).animate(_controller),
    //                     ),
    //                     const SizedBox(
    //                       height: 25.0,
    //                     ),
    //                     for (int i = 0;
    //                         i < extractedData[index].options.length;
    //                         i++)
    //                       GestureDetector(
    //                         onTap: () => checkAnswerAndUpdate(
    //                             extractedData[index]
    //                                 .options
    //                                 .values
    //                                 .toList()[i]),
    //                         child: OptionCard(
    //                           option:
    //                               extractedData[index].options.keys.toList()[i],
    //                           colour: isPressed
    //                               ? extractedData[index]
    //                                           .options
    //                                           .values
    //                                           .toList()[i] ==
    //                                       true
    //                                   ? kCorrectAnswerColor
    //                                   : AppColors.red
    //                               : AppColors.pink,
    //                           //press: changeColor,
    //                         ),
    //                       ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         );
    //       } else {
    //         return const SafeArea(
    //           child: Center(
    //             child: Text(
    //               "No Data",
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                 color: kNeutralAnswerColor,
    //                 decoration: TextDecoration.none,
    //                 fontSize: 14.0,
    //               ),
    //             ),
    //           ),
    //         );
    //       }
    //     }
    //     return Scaffold(
    //       body: SafeArea(
    //         child: Center(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: const [
    //               CircularProgressIndicator(),
    //               SizedBox(
    //                 height: 20.0,
    //               ),
    //               Text(
    //                 "Please Wait while Questions are loading..",
    //                 textAlign: TextAlign.center,
    //                 style: TextStyle(
    //                   color: Colors.black,
    //                   fontWeight: FontWeight.bold,
    //                   decoration: TextDecoration.none,
    //                   fontSize: 14.0,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}

class OptionCard extends StatelessWidget {
  const OptionCard({Key key, this.topMargin, this.option}) : super(key: key);
  final double topMargin;
  final String option;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(top: topMargin),
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 16,
        // right: 120,
        // left: 120,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          )),
      child: Center(
        child: Text(option),
      ),
    );
  }
}
