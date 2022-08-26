import 'package:flutter_engforit/Screens/contents/components/speaking_contents.dart';
import 'package:flutter/material.dart';

class SpeakingUnit2 extends StatefulWidget {
  static String id = 'speaking_unit2';
  const SpeakingUnit2({Key key}) : super(key: key);

  @override
  State<SpeakingUnit2> createState() => _SpeakingUnit2State();
}

class _SpeakingUnit2State extends State<SpeakingUnit2> {
  @override
  Widget build(BuildContext context) {
    return const SpeakingContents(
      index: 2,
    );
  }
}
