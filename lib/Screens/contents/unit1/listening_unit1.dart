import 'package:flutter_engforit/Screens/contents/components/listening_contents.dart';
import 'package:flutter/material.dart';

class ListeningUnit1 extends StatefulWidget {
  const ListeningUnit1({Key key}) : super(key: key);
  static String id = 'listening_unit1';

  @override
  State<ListeningUnit1> createState() => _ListeningUnit1State();
}

class _ListeningUnit1State extends State<ListeningUnit1> {
  @override
  Widget build(BuildContext context) {
    return const ListeningContents(
      question:
          'vjp pr0 No 1 Pr0 1 2 3 4 5 7 jf jnsksklfj dkfjsdklfj d,mfsdjfklsdjfs dfsdflksdjfslkdf lskfjlskfn',
      title:
          'lkdjklfsjd dfjkskdljflksdfd dl;fjsdl;fk dklfjskldjf dlkfjskldfj dskfjskldfjd sfkldsjfklsdfjsdf dsflkdsjflkdsf lkdsjfslkdjf',
    );
  }
}
