import 'package:flutter_engforit/Screens/contents/components/speaking_contents.dart';
import 'package:flutter/material.dart';

class SpeakingUnit3 extends StatefulWidget {
  static String id = 'speaking_unit3';
  const SpeakingUnit3({Key key}) : super(key: key);

  @override
  State<SpeakingUnit3> createState() => _SpeakingUnit3State();
}

class _SpeakingUnit3State extends State<SpeakingUnit3> {
  @override
  Widget build(BuildContext context) {
    return SpeakingContents(
      content: 'nice',
    );
  }
}
