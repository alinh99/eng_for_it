import 'package:flutter/material.dart';
import 'package:flutter_engforit/constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key key,
    this.topMargin,
    this.option,
    this.borderColor,
    this.bottomMargin,
    this.cardColor,
    this.textColor,
  }) : super(key: key);
  final double topMargin;
  final double bottomMargin;
  final String option;
  final Color borderColor;
  final Color cardColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(top: topMargin, bottom: bottomMargin),
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardColor,
          border: Border.all(
            color: borderColor,
          )),
      child: Center(
        child: Text(
          option,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
