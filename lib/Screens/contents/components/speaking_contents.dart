import 'package:flutter_engforit/Screens/contents/components/speaking_icon_button.dart';
import 'package:flutter_engforit/Screens/contents/models/lesson_db.dart';
import 'package:flutter_engforit/Screens/contents/models/lessons.dart';
import 'package:flutter_engforit/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engforit/constants.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';
import 'package:highlight_text/highlight_text.dart';

class SpeakingContents extends StatefulWidget {
  const SpeakingContents({Key key, this.index}) : super(key: key);
  final int index;
  @override
  State<SpeakingContents> createState() => _SpeakingContentsState();
}

class _SpeakingContentsState extends State<SpeakingContents> {
  List<TextEditingController> userAnswerTypes = [];
  PageController controller = PageController();
  LessonDB db = LessonDB();
  double score = 0.0;
  bool isSummited = false;
  List<Speaking> speaking = [];
  List<String> userAnswerList = [];
  List<String> realAnswerList = [];
  Future _speaking;

  int start = 0;
  int end = 0;
  stt.SpeechToText _speech = stt.SpeechToText();
  List<String> wrongWords = [];
  bool _isListening = false;
  List<String> trueWords = [];

  String _text = 'Press the button and start speaking';
  //double _confidence = 0.0;
  Future<List<Object>> getData() async {
    return db.fetchLessonDB(widget.index, 'speaking');
  }

  _listen(String answer) async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );

      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(
            () {
              _text = val.recognizedWords;
              userAnswerList.add(_text);
              userAnswerList
                  .removeWhere((element) => userAnswerList.contains(''));
              userAnswerList = userAnswerList.toSet().toList().last.split(' ');
              realAnswerList.add(answer);
              realAnswerList =
                  realAnswerList.toSet().toList().join('').split(' ');
              if (realAnswerList.contains('?')) {
                realAnswerList =
                    realAnswerList.sublist(0, realAnswerList.length - 1);
              }
              for (int i = 0; i < userAnswerList.toSet().toList().length; i++) {
                if (realAnswerList[i].contains(userAnswerList[i])) {
                  trueWords.add(userAnswerList[i]);
                  score = trueWords.toSet().toList().length /
                      realAnswerList.toSet().toList().length;
                } else {
                  score = 0;
                }
              }
            },
          ),
        );
      }
    } else {
      setState(() => _isListening = false);

      _speech.stop();
    }
  }

  @override
  void dispose() {
    _speech.stop();
    super.dispose();
  }

  @override
  void initState() {
    _speaking = getData();
    _speech = stt.SpeechToText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String sentences = trueWords.join('');
    Map<String, HighlightedWord> words = {
      sentences: HighlightedWord(
        textStyle: const TextStyle(
          color: Colors.green,
          fontFamily: 'Nunito',
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    };
    return Scaffold(
      body: Appbar(
        title: 'Speaking',
        body: SafeArea(
          child: FutureBuilder(
              future: _speaking as Future<List<Object>>,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var extractedData = snapshot.data as List<Object>;
                  for (var i in extractedData.toSet().toList()) {
                    speaking.add(i);
                  }
                  return PageView.builder(
                    controller: controller,
                    physics: const BouncingScrollPhysics(),
                    itemCount: speaking.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 16, left: 16, right: 16),
                              // width: MediaQuery.of(context).size.width,
                              // height: MediaQuery.of(context).size.height * 0.85,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  color: Colors.white),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 16, left: 16),
                                        padding: const EdgeInsets.all(12),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF7383C0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                        ),
                                        child: const Icon(
                                          Icons.speaker_notes,
                                          size: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Your turn',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              children: [
                                                const TextSpan(
                                                    text: 'Tap the '),
                                                WidgetSpan(
                                                  child: Container(
                                                    //padding: EdgeInsets.only(top: 4),
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(50),
                                                      ),
                                                      color: Color(0xFF7383C0),
                                                    ),
                                                    child: const Icon(
                                                      Icons.keyboard_voice,
                                                      size: 16,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                const TextSpan(
                                                    text:
                                                        ' and record your voice.'),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                    height: 32,
                                    endIndent: 0,
                                    indent: 0,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      left: 16,
                                    ),
                                    child: sentences.isNotEmpty
                                        ? TextHighlight(
                                            text: speaking[index]
                                                .answer
                                                .keys
                                                .join(' '),
                                            words: words,
                                            textStyle: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                              color: Colors.red,
                                            ),
                                          )
                                        : Text(
                                            speaking[index]
                                                .answer
                                                .keys
                                                .join(' '),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                            ),
                                          ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: const [
                                      SpeakingIconButton(
                                          icon: Icons.volume_up_rounded),
                                      SpeakingIconButton(
                                          icon: Icons.slow_motion_video),
                                      SpeakingIconButton(
                                          icon: Icons.playlist_add_rounded),
                                      SpeakingIconButton(
                                          icon: Icons.flag_rounded),
                                      SpeakingIconButton(icon: Icons.share),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Center(
                                      child: Text(
                                    'Score: ${(score * 100).toStringAsFixed(1)}%',
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                                  const SizedBox(
                                    height: 256,
                                  ),
                                  Center(
                                    child: AvatarGlow(
                                      animate: _isListening,
                                      glowColor: const Color(0xFF7383C0),
                                      endRadius: 75.0,
                                      duration:
                                          const Duration(milliseconds: 2000),
                                      repeatPauseDuration:
                                          const Duration(milliseconds: 100),
                                      repeat: true,
                                      child: FloatingActionButton(
                                        onPressed: () {
                                          _listen(speaking[index]
                                              .answer
                                              .keys
                                              .join(''));
                                          score = 0;
                                          userAnswerList.clear();
                                          realAnswerList.clear();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(50),
                                            ),
                                            color: Color(0xFF7383C0),
                                          ),
                                          child: const Icon(
                                            Icons.keyboard_voice,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
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
