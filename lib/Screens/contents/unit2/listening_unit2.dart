import 'package:flutter_engforit/Screens/contents/components/listening_contents.dart';
import 'package:flutter/material.dart';

class ListeningUnit2 extends StatefulWidget {
  const ListeningUnit2({Key key}) : super(key: key);
  static String id = 'listening_unit2';

  @override
  State<ListeningUnit2> createState() => _ListeningUnit2State();
}

class _ListeningUnit2State extends State<ListeningUnit2> {
  @override
  Widget build(BuildContext context) {
    return const ListeningContents(
      question:
          'vjp pr0 No 1 Pr0 1 2 3 4 5 7 jf jnsksklfj dkfjsdklfj d,mfsdjfklsdjfs dfsdflksdjfslkdf lskfjlskf dfkdjfkds 1234',
      title:
          'lkdjklfsjd dfjkskdljflksdfd dl;fjsdl;fk dklfjskldjf dlkfjskldfj dskfjskldfjd sfkldsjfklsdfjsdf dsflkdsjflkdsf lkdsjfslkdjf',
    );
  }
}
