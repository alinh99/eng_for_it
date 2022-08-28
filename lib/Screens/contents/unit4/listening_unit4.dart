import 'package:flutter_engforit/Screens/contents/components/listening_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engforit/Screens/contents/unit5/listening_unit5.dart';

class ListeningUnit4 extends StatefulWidget {
  const ListeningUnit4({Key key}) : super(key: key);
  static String id = 'listening_unit4';

  @override
  State<ListeningUnit4> createState() => _ListeningUnit4State();
}

class _ListeningUnit4State extends State<ListeningUnit4> {
  @override
  Widget build(BuildContext context) {
    return ListeningContents(
      index: 4,
      filePrefix: 'assets/database/',
      fileSuffix: 'unit5task2.mp3',
      nextButton: () {
        Navigator.pushNamed(context, ListeningUnit5.id);
      },
    );
  }
}
