import 'package:flutter/material.dart';
import 'package:flutter_engforit/Screens/contents/components/reading_contents.dart';
import 'package:flutter_engforit/Screens/contents/unit2/reading_unit2.dart';

class ReadingUnit1 extends StatefulWidget {
  static String id = 'reading_unit1';
  const ReadingUnit1({Key key}) : super(key: key);

  @override
  State<ReadingUnit1> createState() => _ReadingUnit1State();
}

class _ReadingUnit1State extends State<ReadingUnit1> {
  @override
  Widget build(BuildContext context) {
    return ReadingContents(
      index: 1,
      nextTapped: () {
        Navigator.pushNamed(context, ReadingUnit2.id);
      },
    );
  }
}
