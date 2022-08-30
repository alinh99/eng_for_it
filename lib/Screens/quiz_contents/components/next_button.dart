import 'package:flutter/material.dart';
import 'package:flutter_engforit/colors.dart';
import 'package:flutter_engforit/constants.dart';


class NextButton extends StatelessWidget {
  const NextButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightPink,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: const Text(
        'Next Question',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kGetStartedButtonColor,
          fontSize: 18.0,
        ),
      ),
    );
  }
}