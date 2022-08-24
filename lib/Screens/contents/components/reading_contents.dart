import 'package:flutter_engforit/Screens/contents/components/question_answer_card.dart';
import 'package:flutter_engforit/components/app_bar.dart';
import 'package:flutter_engforit/components/fixed_button.dart';
import 'package:flutter_engforit/components/reuseable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class ReadingContents extends StatefulWidget {
  const ReadingContents({Key key, this.title, this.question}) : super(key: key);
  final String title;
  final String question;
  @override
  State<ReadingContents> createState() => _ReadingContentsState();
}

class _ReadingContentsState extends State<ReadingContents> {
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
    return Scaffold(
      bottomNavigationBar: FixedButton(
        tapped: () {},
        buttonColor: const Color(0xff54C3FF),
        buttonNamed: 'Submit',
      ),
      body: Appbar(
        title: 'Reading',
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Column(
                  children: [
                    ReuseableCard(
                      color: const Color(0xff54C3FF),
                      composition: compositionReading,
                    ),
                    QuestionAndAnswerCard(
                      question: widget.question,
                      title: widget.title,
                      answerLines: 5,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
