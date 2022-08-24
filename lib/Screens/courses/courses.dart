import 'package:flutter_engforit/Screens/courses/components/course_card.dart';
import 'package:flutter_engforit/Screens/enroll_lesson/listening.dart';
import 'package:flutter_engforit/Screens/enroll_lesson/reading.dart';
import 'package:flutter_engforit/Screens/enroll_lesson/speaking.dart';
import 'package:flutter_engforit/Screens/enroll_lesson/writing.dart';
import 'package:flutter_engforit/components/category_cards.dart';
import 'package:flutter_engforit/components/bottom_navigation_bar.dart';
import 'package:flutter_engforit/constants.dart';
import 'package:flutter_engforit/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class Courses extends StatefulWidget {
  static String id = 'courses';
  const Courses({Key key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  CourseState courseState;

  Future<LottieComposition> compositionReading;
  Future<LottieComposition> compositionListening;
  Future<LottieComposition> compositionSpeaking;
  Future<LottieComposition> compositionWriting;

  Future<LottieComposition> _loadComposition(String path) async {
    var assetData = await rootBundle.load(path);
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  void initState() {
    compositionReading = _loadComposition('assets/images/reading.json');
    compositionListening = _loadComposition('assets/images/listening.json');
    compositionWriting = _loadComposition('assets/images/writing.json');
    compositionSpeaking = _loadComposition('assets/images/speaking.json');
    courseState = CourseState.all;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF9FF),
      bottomNavigationBar: const CustomBottomNavBar(selected: MenuState.course),
      appBar: AppBar(
        title: const Text(
          'Courses',
          style: TextStyle(color: Colors.black),
        ),
        //toolbarTextStyle: TextStyle(de),
        centerTitle: true,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.height * 1.2,
                  ),
                  child: Row(
                    children: [
                      CategoryCards(
                        heightSize: 60,
                        topMargin: 16,
                        leftMargin: 16,
                        rightMargin: 16,
                        backgroudColorCard: courseState == CourseState.all
                            ? kPrimaryColor
                            : Colors.white,
                        backgroundColorIcon: courseState == CourseState.all
                            ? Colors.white
                            : Colors.red,
                        text: 'All',
                        icon: courseState == CourseState.all
                            ? CupertinoIcons.square_list_fill
                            : CupertinoIcons.square_list,
                        textColor: courseState == CourseState.all
                            ? Colors.white
                            : Colors.black,
                        iconColor: courseState == CourseState.all
                            ? kPrimaryColor
                            : Colors.white,
                        pressed: () {
                          setState(() {
                            courseState = CourseState.all;
                          });
                        },
                        widthSize: 24,
                      ),
                      CategoryCards(
                        heightSize: 60,
                        topMargin: 16,
                        leftMargin: 0,
                        rightMargin: 16,
                        backgroudColorCard: courseState == CourseState.onGoing
                            ? kPrimaryColor
                            : Colors.white,
                        backgroundColorIcon: courseState == CourseState.onGoing
                            ? Colors.white
                            : const Color(0xffF5AE2C),
                        text: 'Ongoing',
                        icon: courseState == CourseState.onGoing
                            ? Icons.local_fire_department
                            : Icons.local_fire_department_outlined,
                        textColor: courseState == CourseState.onGoing
                            ? Colors.white
                            : Colors.black,
                        iconColor: courseState == CourseState.onGoing
                            ? kPrimaryColor
                            : Colors.white,
                        pressed: () {
                          setState(() {
                            courseState = CourseState.onGoing;
                          });
                        },
                        widthSize: 24,
                      ),
                      CategoryCards(
                        heightSize: 60,
                        topMargin: 16,
                        leftMargin: 0,
                        rightMargin: 0,
                        backgroudColorCard: courseState == CourseState.completed
                            ? kPrimaryColor
                            : Colors.white,
                        backgroundColorIcon:
                            courseState == CourseState.completed
                                ? Colors.white
                                : const Color(0xff7283c0),
                        text: 'Completed',
                        icon: courseState == CourseState.completed
                            ? Icons.check_box_rounded
                            : Icons.check_box_outlined,
                        textColor: courseState == CourseState.completed
                            ? Colors.white
                            : Colors.black,
                        iconColor: courseState == CourseState.completed
                            ? kPrimaryColor
                            : Colors.white,
                        pressed: () {
                          setState(() {
                            courseState = CourseState.completed;
                          });
                        },
                        widthSize: 24,
                      ),
                    ],
                  ),
                ),
              ),
              CourseCard(
                composition: compositionReading,
                cardColor: const Color(0xFF54C3FF),
                title: 'Reading',
                description:
                    'Reading a book or a passage helps to improve the vocabulary and concentration of a learner',
                bottomMargin: 16,
                topMargin: 16,
                tapped: () {
                  Navigator.pushNamed(context, Reading.id);
                },
              ),
              CourseCard(
                composition: compositionListening,
                cardColor: const Color(0xFFF5AE2C),
                title: 'Listening',
                description:
                    'It improves the imagination and vocabulary of a learner. While listening we used to visualize the scene and memorize in our memory',
                bottomMargin: 16,
                topMargin: 16,
                tapped: () {
                  Navigator.pushNamed(context, Listening.id);
                },
              ),
              CourseCard(
                composition: compositionSpeaking,
                cardColor: const Color(0xFF7383C0),
                title: 'Speaking',
                description:
                    'When a learner speaks, he gets to know his mistakes and he can improve it further',
                bottomMargin: 16,
                topMargin: 16,
                tapped: () {
                  Navigator.pushNamed(context, Speaking.id);
                },
              ),
              CourseCard(
                composition: compositionWriting,
                cardColor: const Color(0xFF5AE2E2),
                title: 'Writing',
                description:
                    'When we write we get to know, what we are writing and do we know the spellings of all words',
                bottomMargin: 32,
                topMargin: 16,
                tapped: () {
                  Navigator.pushNamed(context, Writing.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
