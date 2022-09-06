import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_engforit/Screens/contents/components/writitng/writing_result_box.dart';
import 'package:flutter_engforit/Screens/contents/models/lesson_db.dart';
import 'package:flutter_engforit/Screens/contents/models/lessons.dart';
import 'package:flutter_engforit/components/app_bar.dart';
import 'package:flutter_engforit/components/fixed_button.dart';
import 'package:flutter_engforit/components/reuseable_card.dart';
import 'package:language_tool/language_tool.dart';
import 'package:lottie/lottie.dart';
import 'writitng/writing_check_answer_box.dart';

class WritingContents extends StatefulWidget {
  const WritingContents({Key key, this.index, this.nextTapped})
      : super(key: key);
  final int index;
  final Function nextTapped;

  @override
  State<WritingContents> createState() => _WritingContentsState();
}

class _WritingContentsState extends State<WritingContents> {
  TextEditingController userAnswerTypes = TextEditingController();
  LessonDB db = LessonDB();
  int score = 0;
  bool isSummited = false;
  List<Writing> lessons = [];
  List<String> userAnswerList = [];
  Future _lessons;

  Future<List<Object>> getData() async {
    return db.fetchLessonDB(widget.index, 'writing');
  }

  wordDefinition(List<String> wordList, String answer) {
    wordList.add(answer);
    var word = wordList.toSet().toList().join('').split(' ');
    return word.length;
  }

  wordLength(List<String> wordList, String answer) {
    var length = wordDefinition(wordList, answer);
    return length;
  }

  Future checkAnswer(List<String> wordList, String answer) async {
    wordList.add(answer);
    var check = await checkGrammar(wordList);
    return check;
  }

  Future checkGrammar(List<String> wordList) async {
    var answer = wordList.toSet().toList().join('');
    var wordLeng = wordLength(wordList, answer);
    var tool = LanguageTool();
    var result = await tool.check(answer);
    if (result.isEmpty && wordLeng >= 5) {
      score += 10;
      return true;
    } else {
      if (wordLeng >= 5) {
        if (result.length == 1) {
          score += 9;
        } else if (result.length == 2) {
          score += 8;
        } else if (result.length == 3) {
          score += 7;
        } else if (result.length == 4) {
          score += 6;
        } else if (result.length == 5) {
          score += 5;
        } else {
          score += 0;
          return false;
        }
      }
    }
  }

  void startOver() {
    setState(() {
      score = 0;
      userAnswerTypes.text = '';
      userAnswerList.clear();
      isSummited = false;
      userAnswerList.clear();
    });
    Navigator.pop(context);
  }

  void submit(int questionLength) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // disable dismiss function on clicking outside of box
      builder: (ctx) => WritingResultBox(
        result: score,
        questionLength: 1,
        resetPress: startOver,
        checkAnswerPress: () {
          answerKey(questionLength);
        },
        nextExercisePress: widget.nextTapped,
      ),
    );
  }

  void answerKey(int i) {
    showDialog(
      context: context,
      builder: (ctx) => WritingCheckAnswerBox(
        wordList: userAnswerList.toSet().toList(),
      ),
    );
  }

  Future<LottieComposition> compositionWriting;
  Future<LottieComposition> _loadComposition(String path) async {
    var assetData = await rootBundle.load(path);
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  void initState() {
    compositionWriting = _loadComposition('assets/images/writing.json');
    _lessons = getData();
    super.initState();
  }

  @override
  void dispose() {
    userAnswerTypes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FixedButton(
        buttonNamed: 'Submit',
        buttonColor: const Color(0xFF5AE2E2),
        tapped: () async {
          await checkAnswer(userAnswerList, userAnswerTypes.text);
          submit(lessons.length);
          isSummited = true;
        },
      ),
      body: Appbar(
        title: 'Writing',
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: _lessons as Future<List<Object>>,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var extractedData = snapshot.data as List<Object>;
                  for (var i in extractedData.toSet().toList()) {
                    lessons.add(i);
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        ReuseableCard(
                          color: const Color(0xFF5AE2E2),
                          composition: compositionWriting,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 16, bottom: 8, left: 16, right: 16),
                          height: MediaQuery.of(context).size.height,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Colors.white,
                          ),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: extractedData.length,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 16, left: 22, right: 24),
                                child: Column(
                                  children: [
                                    Text(
                                      lessons[index].question,
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    TextField(
                                      minLines: 1,
                                      maxLines: 5,
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(8),
                                        hintText: 'Input your answer ...',
                                        suffixIcon: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Icon(Icons.text_fields),
                                        ),
                                      ),
                                      controller: userAnswerTypes,
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 300,
                        ),
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Please Wait while Questions are loading..",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}
