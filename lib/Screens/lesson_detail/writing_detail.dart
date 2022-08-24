import 'package:flutter_engforit/Screens/lesson_detail/components/writing/lesson_writing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class WritingDetail extends StatefulWidget {
  const WritingDetail({Key key}) : super(key: key);
  static String id = 'writing_detail';
  @override
  State<WritingDetail> createState() => _WritingDetailState();
}

class _WritingDetailState extends State<WritingDetail> {
  Future<LottieComposition> compositionWriting;
  Future<LottieComposition> _loadComposition(String path) async {
    var assetData = await rootBundle.load(path);
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  void initState() {
    compositionWriting = _loadComposition('assets/images/writing.json');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LessonWriting(
      composition: compositionWriting,
      title: 'Writing',
      color: const Color(0xFF5AE2E2),
    );
  }
}
