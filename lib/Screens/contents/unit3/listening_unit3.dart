import 'package:flutter_engforit/Screens/contents/components/listening_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engforit/Screens/contents/unit4/listening_unit4.dart';

class ListeningUnit3 extends StatefulWidget {
  const ListeningUnit3({Key key}) : super(key: key);
  static String id = 'listening_unit3';

  @override
  State<ListeningUnit3> createState() => _ListeningUnit3State();
}

class _ListeningUnit3State extends State<ListeningUnit3> {
  @override
  Widget build(BuildContext context) {
    return ListeningContents(
      index: 3,
      filePrefix: 'assets/database/',
      fileSuffix: 'unit4task5.mp3',
      nextButton: () {
        Navigator.pushNamed(context, ListeningUnit4.id);
      },
    );
  }
}
