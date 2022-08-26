import 'package:flutter_engforit/Screens/contents/components/speaking_contents.dart';
import 'package:flutter/material.dart';

class SpeakingUnit4 extends StatefulWidget {
  static String id = 'speaking_unit4';
  const SpeakingUnit4({Key key}) : super(key: key);

  @override
  State<SpeakingUnit4> createState() => _SpeakingUnit4State();
}

class _SpeakingUnit4State extends State<SpeakingUnit4> {
  @override
  Widget build(BuildContext context) {
    return const SpeakingContents(
      index: 4,
    );
  }
}
