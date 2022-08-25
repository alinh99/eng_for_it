import 'package:flutter_engforit/Screens/contents/components/writing_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engforit/Screens/contents/unit1/writing_unit1.dart';

class WritingUnit5 extends StatelessWidget {
  const WritingUnit5({Key key}) : super(key: key);
  static String id = 'writing_unit5';
  @override
  Widget build(BuildContext context) {
    return WritingContents(
      index: 5,
      nextTapped: () {
        Navigator.pushNamed(context, WritingUnit1.id);
      },
    );
  }
}