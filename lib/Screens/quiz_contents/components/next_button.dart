import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    Key key,
    this.color
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 24),
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: color,
      ),
      child: const Text(
        'Next',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
