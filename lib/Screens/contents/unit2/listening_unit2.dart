import 'package:flutter_engforit/Screens/contents/components/listening_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engforit/Screens/contents/unit3/listening_unit3.dart';

class ListeningUnit2 extends StatefulWidget {
  const ListeningUnit2({Key key}) : super(key: key);
  static String id = 'listening_unit2';

  @override
  State<ListeningUnit2> createState() => _ListeningUnit2State();
}

class _ListeningUnit2State extends State<ListeningUnit2> {
  @override
  Widget build(BuildContext context) {
    return ListeningContents(
      index: 2,
      filePrefix: 'assets/database',
      fileSuffix: 'unit1task3.mp3',
      nextButton: () {
        Navigator.pushNamed(context, ListeningUnit3.id);
      },
    );
  }
}
