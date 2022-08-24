import 'package:flutter_engforit/Screens/lesson_detail/components/reading/lesson_reading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class ReadingDetail extends StatefulWidget {
  const ReadingDetail({Key key}) : super(key: key);
  static String id = 'reading_detail';
  @override
  State<ReadingDetail> createState() => _ReadingDetailState();
}

class _ReadingDetailState extends State<ReadingDetail> {
  Future<LottieComposition> compositionReading;
  Future<LottieComposition> _loadComposition(String path) async {
    var assetData = await rootBundle.load(path);
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  void initState() {
    compositionReading = _loadComposition('assets/images/reading.json');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LessonReading(
      composition: compositionReading,
      title: 'Reading',
      color: const Color(0xff54C3FF),
    );
  }
}
