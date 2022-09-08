import 'package:flutter/material.dart';
import 'package:flutter_engforit/constants.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:language_tool/language_tool.dart';

class WritingCheckAnswerBox extends StatefulWidget {
  const WritingCheckAnswerBox({Key key, @required this.wordList})
      : super(key: key);
  final List<String> wordList;
  @override
  State<WritingCheckAnswerBox> createState() => _WritingCheckAnswerBoxState();
}

class _WritingCheckAnswerBoxState extends State<WritingCheckAnswerBox> {
  List<WritingMistake> result = [];
  List<String> sentences = [];
  @override
  Widget build(BuildContext context) {
    Future answerKey(List<String> userAnswerList) async {
      var tool = LanguageTool(language: 'en-US');
      result = await tool.check(userAnswerList.toSet().toList().join(''));
      return result;
    }

    getWrongWords(String sentence) {
      int mistakeOffset = 0;
      int originMistakeSentenceOffset = 0;
      List<String> wrongWords = [];
      if (sentence.isNotEmpty) {
        for (var mistake in result.toSet().toList()) {
          mistakeOffset = mistake.offset;
          originMistakeSentenceOffset = mistakeOffset;
          String wrongWord = sentence.substring(originMistakeSentenceOffset,
              originMistakeSentenceOffset + mistake.length);

          wrongWords.add(wrongWord);
        }
        return wrongWords.join(" ");
      }
    }

    getMessages() {
      List<String> mess = [];
      for (var messages in result) {
        String message = messages.message;
        mess.add(message);
      }
      return mess.join('\n');
    }

    getIssueDescriptions() {
      List<String> issueDes = [];
      for (var description in result) {
        String issue = description.issueDescription;
        issueDes.add(issue);
      }
      return issueDes.join('\n');
    }

    getIssueType() {
      List<String> types = [];
      for (var type in result) {
        String typ = type.issueType;
        types.add(typ);
      }
      return types.join('\n');
    }

    return AlertDialog(
      backgroundColor: const Color(0xFF5AE2E2),
      title: const Text(
        "ANSWER KEY",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: SizedBox(
        width: 300,
        height: 300,
        child: FutureBuilder(
            future: answerKey(widget.wordList.toSet().toList()),
            builder: (context, snapshot) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ListView.builder(
                  itemCount: widget.wordList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    String sentence = widget.wordList.join('');
                    sentences.add(sentence);
                    sentences = sentence.split(' ');
                    Map<String, HighlightedWord> words = {
                      getWrongWords(sentence): HighlightedWord(
                        textStyle: const TextStyle(
                          color: Colors.red,
                          fontFamily: 'Nunito',
                          fontSize: 16,
                        ),
                      ),
                    };
                    if (snapshot.connectionState == ConnectionState.done ||
                        snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.hasData) {
                        widget.wordList.clear();
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sentences.length >= 5
                                ? Center(
                                    child: TextHighlight(
                                      text:
                                          sentence, // You need to pass the string you want the highlights
                                      words: words, // Your dictionary words
                                      textStyle: const TextStyle(
                                          color: kCorrectAnswerColor,
                                          fontSize: 16,
                                          fontFamily: 'Nunito'),
                                      // You can use any attribute of the RichText widget
                                    ),
                                  )
                                : const Center(
                                    child: Text(
                                      'Your Answer Must Be At Least 5 Words',
                                      style: TextStyle(color: Colors.red),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            sentences.length >= 5
                                ? const Center(
                                    child: Text(
                                      'Main Issues',
                                      style: TextStyle(
                                        color: Color(0xFFfbd285),
                                      ),
                                    ),
                                  )
                                : const Text(''),
                            sentences.length >= 5
                                ? Text(
                                    getMessages(),
                                  )
                                : const Text(''),
                            const SizedBox(
                              height: 20.0,
                            ),
                            sentences.length >= 5
                                ? const Center(
                                    child: Text(
                                      "Issue Descriptions",
                                      style: TextStyle(
                                        color: Color(0xFFfbd285),
                                      ),
                                    ),
                                  )
                                : const Text(''),
                            sentences.length >= 5
                                ? Text(
                                    getIssueDescriptions(),
                                  )
                                : const Text(''),
                            const SizedBox(
                              height: 20.0,
                            ),
                            sentences.length >= 5
                                ? const Center(
                                    child: Text(
                                      "Issue Types",
                                      style:
                                          TextStyle(color: Color(0xFFfbd285)),
                                    ),
                                  )
                                : const Text(''),
                            sentences.length >= 5
                                ? Center(
                                    child: Text(
                                      getIssueType(),
                                    ),
                                  )
                                : const Text(''),
                          ],
                        );
                      }
                    } else {
                      return SafeArea(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              CircularProgressIndicator(),
                              Text(
                                "Please Wait while Questions are loading..",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  // color: kNeutralAnswerColor,
                                  decoration: TextDecoration.none,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return const Text("No data");
                  },
                ),
              );
            }),
      ),
    );
  }
}
