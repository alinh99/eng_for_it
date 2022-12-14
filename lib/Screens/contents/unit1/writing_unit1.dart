import 'package:flutter_engforit/Screens/contents/components/writing_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engforit/Screens/contents/unit2/writing_unit2.dart';

class WritingUnit1 extends StatefulWidget {
  const WritingUnit1({Key key}) : super(key: key);
  static String id = 'writing_unit1';
  @override
  State<WritingUnit1> createState() => _WritingUnit1State();
}

class _WritingUnit1State extends State<WritingUnit1> {
  @override
  Widget build(BuildContext context) {
    return WritingContents(
      index: 1,
      nextTapped: () {
        Navigator.pushNamed(context, WritingUnit2.id);
      },
    );
  }
}
