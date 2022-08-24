import 'package:flutter_engforit/Screens/contents/components/question_answer_card.dart';
import 'package:flutter_engforit/components/app_bar.dart';
import 'package:flutter_engforit/components/fixed_button.dart';
import 'package:flutter_engforit/components/lottie_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class ListeningContents extends StatefulWidget {
  const ListeningContents({Key key, this.question, this.title})
      : super(key: key);
  static String id = 'listening_contents';
  final String question;
  final String title;
  @override
  State<ListeningContents> createState() => _ListeningContentsState();
}

class _ListeningContentsState extends State<ListeningContents> {
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
      bottomNavigationBar: FixedButton(
        tapped: () {},
        buttonColor: const Color(0xffF5AE2C),
        buttonNamed: 'Submit',
      ),
      body: Appbar(
        title: 'Listening',
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          top: 24, bottom: 16, left: 16, right: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: Column(
                        children: [
                          LottieAnimation(
                            composition: compositionListening,
                            height: 0.25,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.078,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              color: Color(0xffF5AE2C),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 8),
                                  child: const Text(
                                    '06:25',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color: Color(0xffF6C56A),
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  child: const Text(
                                    '17:45',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
