import 'package:flutter/material.dart';

class WritingResultBox extends StatelessWidget {
  const WritingResultBox(
      {Key key,
      @required this.result,
      @required this.questionLength,
      @required this.resetPress,
      this.checkAnswerPress,
      @required this.nextExercisePress})
      : super(key: key);
  final int result;
  final int questionLength;
  final VoidCallback resetPress;
  final VoidCallback checkAnswerPress;
  final VoidCallback nextExercisePress;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF5AE2E2),
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
              backgroundColor: result == questionLength * 10 / 2
                  ? Colors.yellow
                  : result < questionLength * 10 / 2
                      ? Colors.red
                      : Colors.green,
              child: Text(
                "$result/${questionLength * 10}",
                style: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.white
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              result == questionLength * 10 / 2
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
              onTap: checkAnswerPress,
              child: const Text(
                "Check Answer",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            GestureDetector(
              onTap: resetPress,
              child: const Text(
                "Start Over",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            GestureDetector(
              onTap: nextExercisePress,
              child: const Text(
                "Next Unit",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
