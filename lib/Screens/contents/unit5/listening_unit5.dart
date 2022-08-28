import 'package:flutter_engforit/Screens/contents/components/listening_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engforit/Screens/contents/unit1/listening_unit1.dart';

class ListeningUnit5 extends StatefulWidget {
  const ListeningUnit5({Key key}) : super(key: key);
  static String id = 'listening_unit5';

  @override
  State<ListeningUnit5> createState() => _ListeningUnit5State();
}

class _ListeningUnit5State extends State<ListeningUnit5> {
  @override
  Widget build(BuildContext context) {
    return ListeningContents(
      index: 5,
      filePrefix: 'assets/database/',
      fileSuffix: 'unit5task3.mp3',
      nextButton: () {
        Navigator.pushNamed(context, ListeningUnit1.id);
      },
    );
  }
}
