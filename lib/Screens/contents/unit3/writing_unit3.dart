import 'package:flutter_engforit/Screens/contents/components/writing_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engforit/Screens/contents/unit4/writing_unit4.dart';

class WritingUnit3 extends StatelessWidget {
  const WritingUnit3({Key key}) : super(key: key);
  static String id = 'writing_unit3';
  @override
  Widget build(BuildContext context) {
    return WritingContents(
      index: 3,
      nextTapped: () {
        Navigator.pushNamed(context, WritingUnit4.id);
      },
    );
  }
}