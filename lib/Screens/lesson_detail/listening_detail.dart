import 'package:flutter_engforit/Screens/lesson_detail/components/listening/lesson_listening.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class ListeningDetail extends StatefulWidget {
  const ListeningDetail({Key key}) : super(key: key);
  static String id = 'listening_detail';
  @override
  State<ListeningDetail> createState() => _ListeningDetailState();
}

class _ListeningDetailState extends State<ListeningDetail> {
  Future<LottieComposition> compositionListening;
  Future<LottieComposition> _loadComposition(String path) async {
    var assetData = await rootBundle.load(path);
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  void initState() {
    compositionListening = _loadComposition('assets/images/listening.json');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LessonListening(
        composition: compositionListening,
        title: 'Listening',
        color: const Color(0xffF5AE2C),
      ),
    );
  }
}
