import 'package:flutter_engforit/Screens/contents/components/writing_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engforit/Screens/contents/unit5/writing_unit5.dart';

class WritingUnit4 extends StatelessWidget {
  const WritingUnit4({Key key}) : super(key: key);
  static String id = 'writing_unit4';
  @override
  Widget build(BuildContext context) {
    return WritingContents(
      index: 4,
      nextTapped: () {
        Navigator.pushNamed(context, WritingUnit5.id);
      },
    );
  }
}