import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {Key key,
      this.time,
      this.title,
      this.questionLength,
      this.currentQuestion,
      this.color,
      this.question})
      : super(key: key);
  final String title;
  final int questionLength;
  final int currentQuestion;
  final String question;
  final Widget time;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        //height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          color: color,
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Center(
                      child: Text(
                        title,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Question ${currentQuestion + 1}/$questionLength',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    children: [
                      const Icon(
                        CupertinoIcons.clock,
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      time,
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  margin: const EdgeInsets.only(top: 24),
                  child: Text(
                    question,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
