import 'package:flutter_engforit/Screens/contents/components/reading_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engforit/Screens/contents/unit5/reading_unit5.dart';

class ReadingUnit4 extends StatelessWidget {
  const ReadingUnit4({Key key}) : super(key: key);
  static String id = 'reading_unit4';
  @override
  Widget build(BuildContext context) {
    return ReadingContents(
      index: 4,
      nextTapped: () {
        Navigator.pushNamed(context, ReadingUnit5.id);
      },
    );
  }
}
