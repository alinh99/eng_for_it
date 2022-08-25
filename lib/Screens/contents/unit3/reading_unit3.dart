import 'package:flutter_engforit/Screens/contents/components/reading_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engforit/Screens/contents/unit4/reading_unit4.dart';

class ReadingUnit3 extends StatelessWidget {
  const ReadingUnit3({Key key}) : super(key: key);
  static String id = 'reading_unit3';
  @override
  Widget build(BuildContext context) {
    return ReadingContents(
      index: 3,
      nextTapped: () {
        Navigator.pushNamed(context, ReadingUnit4.id);
      },
    );
  }
}
