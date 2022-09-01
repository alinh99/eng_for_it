import 'package:flutter_engforit/Screens/contents/components/reading/reading_check_answer_box.dart';
import 'package:flutter_engforit/Screens/contents/components/reading/reading_result_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engforit/Screens/contents/models/lesson_db.dart';
import 'package:flutter_engforit/Screens/contents/models/lessons.dart';
import 'package:flutter_engforit/components/app_bar.dart';
import 'package:flutter_engforit/components/fixed_button.dart';

class ReadingContents extends StatefulWidget {
  const ReadingContents({Key key, this.index, this.nextTapped})
      : super(key: key);
  final int index;
  final Function nextTapped;

  @override
  State<ReadingContents> createState() => _ReadingContentsState();
}

class _ReadingContentsState extends State<ReadingContents> {
  List<TextEditingController> userAnswerTypes = [];
  LessonDB db = LessonDB();
  int score = 0;
  bool isSummited = false;
  List<Reading> readingList = [];
  List<String> userAnswerList = [];
  List<String> realAnswerList = [];
  Future _lessons;

  Future<List<Object>> getData() async {
    return db.fetchLessonDB(widget.index, 'reading');
  }

  checkAnswer(int i) {
    userAnswerList.insert(i, "(${userAnswerTypes[i].text})");
    realAnswerList.add(readingList[i].answer.keys.toString());
    setState(() {
      isSummited = true;
      realAnswerList[i] = readingList[i].answer.keys.toString();
    });
    if (userAnswerList.isEmpty) {
      score += 0;
      return false;
    } else {
      if (userAnswerList[i].toString().toLowerCase() ==
          readingList[i].answer.keys.toString().toLowerCase()) {
        score += 1;
        return true;
      } else {
        score += 0;
        return false;
      }
    }
  }

  void startOver() {
    setState(() {
      score = 0;
      userAnswerTypes.clear();
      isSummited = false;
    });
    Navigator.pop(context);
  }

  void submit(int questionLength) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // disable dismiss function on clicking outside of box
      builder: (ctx) => ReadingResultBox(
        result: score,
        questionLength: questionLength,
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
      builder: (ctx) => ReadingCheckAnswerBox(
        lessonList: readingList.toSet().toList(),
      ),
    );
  }

  @override
  void initState() {
    // Listen to States: Playing, Pause, Stop
    _lessons = getData();
    super.initState();
  }

  @override
  void dispose() {
    for (TextEditingController userAnswerType in userAnswerTypes) {
      userAnswerType.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FixedButton(
        buttonNamed: 'Submit',
        buttonColor: const Color(0xff54C3FF),
        tapped: () {
          int i;
          for (i = 0; i < readingList.toSet().toList().length; i++) {
            checkAnswer(i);
          }
          submit(i);
        },
      ),
      body: Appbar(
        title: 'Reading',
        body: SingleChildScrollView(
            child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              FutureBuilder(
                future: _lessons as Future<List<Object>>,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done ||
                      snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      var extractedData = snapshot.data as List<Object>;
                      for (var i in extractedData.toSet().toList()) {
                        readingList.add(i);
                      }
                      //print(readingList);
                      return Container(
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
                          itemCount: extractedData.length,
                          physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics(),
                          ),
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            userAnswerTypes.add(TextEditingController());
                            realAnswerList
                                .add(readingList[index].answer.keys.toString());
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 16, left: 22, right: 24),
                              child: Column(
                                children: [
                                  Text(
                                    readingList[index].titlePassage,
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
                                  Text(
                                    readingList[index].passage,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    readingList[index].title,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "${index + 1}. ${readingList[index].question}",
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
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
                                    controller: userAnswerTypes[index],
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      );
                    }
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
                  return const Text("No data");
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
