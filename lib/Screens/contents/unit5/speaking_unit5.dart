import 'package:flutter_engforit/Screens/contents/components/speaking_contents.dart';
import 'package:flutter/material.dart';

class SpeakingUnit5 extends StatefulWidget {
  static String id = 'speaking_unit5';
  const SpeakingUnit5({Key key}) : super(key: key);

  @override
  State<SpeakingUnit5> createState() => _SpeakingUnit5State();
}

class _SpeakingUnit5State extends State<SpeakingUnit5> {
  @override
  Widget build(BuildContext context) {
    return const SpeakingContents(
      index: 5,
    );
  }
}
