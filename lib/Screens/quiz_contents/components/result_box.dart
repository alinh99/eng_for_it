import 'package:flutter/material.dart';
import 'package:flutter_engforit/constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox(
      {Key key,
      @required this.result,
      @required this.questionLength,
      @required this.press,
      @required this.backgroundColor})
      : super(key: key);
  final int result;
  final Color backgroundColor;
  final int questionLength;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      content: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "RESULT",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20.0),
            CircleAvatar(
              radius: 70.0,
              backgroundColor: result == questionLength / 2
                  ? Colors.yellow
                  : result < questionLength / 2
                      ? kIncorrectAnswerColor
                      : kCorrectAnswerColor,
              child: Text(
                "$result/$questionLength",
                style: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              result == questionLength / 2
                  ? 'Almost There'
                  : result < questionLength / 2
                      ? 'Try Again ?'
                      : 'Great!',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 25.0),
            GestureDetector(
              onTap: press,
              child: const Text(
                "Start Over",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
