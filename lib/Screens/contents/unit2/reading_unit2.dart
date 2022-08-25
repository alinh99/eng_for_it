import 'package:flutter_engforit/Screens/contents/components/reading_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engforit/Screens/contents/unit3/reading_unit3.dart';

class ReadingUnit2 extends StatelessWidget {
  const ReadingUnit2({Key key}) : super(key: key);
  static String id = 'reading_unit2';
  @override
  Widget build(BuildContext context) {
    return ReadingContents(
      index: 2,
      nextTapped: () {
        Navigator.pushNamed(context, ReadingUnit3.id);
      },
    );
  }
}
