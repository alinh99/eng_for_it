import 'package:flutter_engforit/Screens/contents/components/reading_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engforit/Screens/contents/unit1/reading_unit1.dart';

class ReadingUnit5 extends StatelessWidget {
  const ReadingUnit5({Key key}) : super(key: key);
  static String id = 'reading_unit5';
  @override
  Widget build(BuildContext context) {
    return ReadingContents(
      index: 5,
      nextTapped: () {
        Navigator.pushNamed(context, ReadingUnit1.id);
      },
    );
  }
}
