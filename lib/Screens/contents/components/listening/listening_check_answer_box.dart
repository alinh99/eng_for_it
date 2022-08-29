import 'package:flutter/material.dart';
import 'package:flutter_engforit/Screens/contents/models/lessons.dart';
import 'package:flutter_engforit/colors.dart';

class ListeningCheckAnswerBox extends StatelessWidget {
  const ListeningCheckAnswerBox({Key key, @required this.lessonList})
      : super(key: key);
  final List<Listening> lessonList;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xffF5AE2C),
      title: const Text(
        "ANSWER KEY",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: SizedBox(
        width: 300,
        height: 300,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ListView.builder(
              itemCount: lessonList.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                //print(lesson);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${index + 1}. ${lessonList[index].answer.keys.join(', ')}",
                    ),
                    const SizedBox(height: 20)
                  ],
                );
              }),
        ),
      ),
    );
  }
}
