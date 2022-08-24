import 'package:flutter_engforit/Screens/contents/components/question_answer_card.dart';
import 'package:flutter_engforit/components/app_bar.dart';
import 'package:flutter_engforit/components/fixed_button.dart';
import 'package:flutter_engforit/components/reuseable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class WritingContents extends StatefulWidget {
  const WritingContents({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<WritingContents> createState() => _WritingContentsState();
}

class _WritingContentsState extends State<WritingContents> {
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
    return Scaffold(
      bottomNavigationBar: FixedButton(
        tapped: () {},
        buttonColor: const Color(0xFF5AE2E2),
        buttonNamed: 'Submit',
      ),
      body: Appbar(
        title: 'Writing',
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Column(
                  children: [
                    ReuseableCard(
                      color: const Color(0xFF5AE2E2),
                      composition: compositionWriting,
                    ),
                    QuestionAndAnswerCard(
                      title: widget.title,
                      question: '',
                      answerLines: 50,
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
