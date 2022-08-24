import 'package:flutter_engforit/Screens/lesson_detail/components/speaking/lesson_speaking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class SpeakingDetail extends StatefulWidget {
  const SpeakingDetail({Key key}) : super(key: key);
  static String id = 'speaking_detail';
  @override
  State<SpeakingDetail> createState() => _SpeakingDetailState();
}

class _SpeakingDetailState extends State<SpeakingDetail> {
  Future<LottieComposition> compositionSpeaking;
  Future<LottieComposition> _loadComposition(String path) async {
    var assetData = await rootBundle.load(path);
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  void initState() {
    compositionSpeaking = _loadComposition('assets/images/speaking.json');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LessonSpeaking(
      composition: compositionSpeaking,
      title: 'Speaking',
      color: const Color(0xFF7383C0),
    );
  }
}
