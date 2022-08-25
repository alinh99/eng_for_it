import 'package:flutter/material.dart';
import 'package:flutter_engforit/colors.dart';
import 'package:flutter_engforit/constants.dart';


class ListeningResultBox extends StatelessWidget {
  const ListeningResultBox(
      {Key key,
      @required this.result,
      @required this.questionLength,
      @required this.resetPress,
      @required this.checkAnswerPress,
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
      backgroundColor: AppColors.darkPink,
      content: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "RESULT",
              style: TextStyle(
                color: AppColors.lightPink,
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 20.0),
            CircleAvatar(
              radius: 70.0,
              backgroundColor: result == questionLength / 2
                  ? Colors.yellow
                  : result < questionLength / 2
                      ? AppColors.darkRed
                      : kCorrectAnswerColor,
              child: Text(
                "$result/$questionLength",
                style: const TextStyle(fontSize: 30.0),
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
                color: kNeutralAnswerColor,
              ),
            ),
            const SizedBox(height: 25.0),
            GestureDetector(
              onTap: checkAnswerPress,
              child: const Text(
                "Check Answer",
                style: TextStyle(
                  color: AppColors.red,
                  fontSize: 15.0,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            GestureDetector(
              onTap: resetPress,
              child: const Text(
                "Start Over",
                style: TextStyle(
                  color: AppColors.red,
                  fontSize: 15.0,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            GestureDetector(
              onTap: nextExercisePress,
              child: const Text(
                "Next Exercise",
                style: TextStyle(
                  color: AppColors.red,
                  fontSize: 15.0,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
