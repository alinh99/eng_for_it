import 'package:flutter_engforit/Screens/contents/components/listening_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engforit/Screens/contents/unit2/listening_unit2.dart';

class ListeningUnit1 extends StatefulWidget {
  const ListeningUnit1({Key key}) : super(key: key);
  static String id = 'listening_unit1';

  @override
  State<ListeningUnit1> createState() => _ListeningUnit1State();
}

class _ListeningUnit1State extends State<ListeningUnit1> {
  @override
  Widget build(BuildContext context) {
    return ListeningContents(
      index: 1,
      filePrefix: 'assets/database',
      fileSuffix: 'unit1task3.mp3',
      nextButton: () {
        Navigator.pushNamed(context, ListeningUnit2.id);
      },
    );
  }
}
