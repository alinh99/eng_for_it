import 'package:flutter_engforit/Screens/contents/components/writing_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engforit/Screens/contents/unit3/writing_unit3.dart';

class WritingUnit2 extends StatelessWidget {
  const WritingUnit2({Key key}) : super(key: key);
  static String id = 'writing_unit2';
  @override
  Widget build(BuildContext context) {
    return WritingContents(
      index: 2,
      nextTapped: () {
        Navigator.pushNamed(context, WritingUnit3.id);
      },
    );
  }
}
