import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_engforit/Screens/contents/components/listening/listening_check_answer_box.dart';
import 'package:flutter_engforit/Screens/contents/components/listening/listening_result_box.dart';
import 'package:flutter_engforit/Screens/contents/models/lesson_db.dart';
import 'package:flutter_engforit/Screens/contents/models/lessons.dart';
import 'package:flutter_engforit/components/app_bar.dart';
import 'package:flutter_engforit/components/fixed_button.dart';
import 'package:flutter_engforit/components/lottie_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class ListeningContents extends StatefulWidget {
  const ListeningContents(
      {Key key, this.filePrefix, this.index, this.nextButton, this.fileSuffix})
      : super(key: key);
  static String id = 'listening_contents';
  final int index;
  final Function nextButton;
  final String filePrefix;
  final String fileSuffix;

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
    // Listen to States: Playing, Pause, Stop
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlayed = event == PlayerState.PLAYING;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
    _lessons = getData();
    compositionListening = _loadComposition('assets/images/listening.json');
    super.initState();
  }

  AudioPlayer audioPlayer = AudioPlayer();
  List<TextEditingController> userAnswerTypes = [];
  bool isPlayed = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  LessonDB db = LessonDB();
  int score = 0;
  bool isSummited = false;
  List<Listening> listeningList = [];
  List<String> userAnswerList = [];
  List<String> realAnswerList = [];
  Future _lessons;

  Future<List<Object>> getData() async {
    return db.fetchLessonDB(widget.index, 'listening');
  }

  checkAnswer(int i) {
    userAnswerList.insert(i, "(${userAnswerTypes[i].text})");
    realAnswerList.add(listeningList[i].answer.keys.toString());
    setState(() {
      isSummited = true;
      realAnswerList[i] = listeningList[i].answer.keys.toString();
    });
    if (userAnswerList.isEmpty) {
      score += 0;
      return false;
    } else {
      if (userAnswerList[i].toString().toLowerCase() ==
          listeningList[i].answer.keys.toString().toLowerCase()) {
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
      userAnswerList.clear();
      isSummited = false;
    });
    Navigator.pop(context);
  }

  void submit(int questionLength) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // disable dismiss function on clicking outside of box
      builder: (ctx) => ListeningResultBox(
        result: score,
        questionLength: questionLength,
        resetPress: startOver,
        checkAnswerPress: () {
          answerKey(questionLength);
        },
        nextExercisePress: widget.nextButton,
      ),
    );
  }

  void answerKey(int i) {
    showDialog(
      context: context,
      builder: (ctx) => ListeningCheckAnswerBox(
        lessonList: listeningList.toSet().toList(),
      ),
    );
  }

  @override
  void dispose() {
    for (TextEditingController userAnswerType in userAnswerTypes) {
      userAnswerType.dispose();
    }
    super.dispose();
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    final player = AudioCache(prefix: widget.filePrefix);
    final url = await player.load(widget.fileSuffix);
    audioPlayer.play(url.path, isLocal: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FixedButton(
        tapped: () {
          int i;
          for (i = 0; i < listeningList.toSet().toList().length; i++) {
            checkAnswer(i);
          }
          submit(i);
        },
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
                                  child: Text(
                                    formatTime(position),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    if (isPlayed) {
                                      await audioPlayer.pause();
                                    } else {
                                      await setAudio();
                                    }
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      color: Color(0xffF6C56A),
                                    ),
                                    child: Icon(
                                      isPlayed ? Icons.pause : Icons.play_arrow,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  child: Text(
                                    formatTime(duration),
                                    style: const TextStyle(
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
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 22, right: 24),
                        child: FutureBuilder(
                          future: _lessons as Future<List<Object>>,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var extractedData = snapshot.data as List<Object>;
                              for (var i in extractedData.toSet().toList()) {
                                listeningList.add(i);
                              }
                              return ListView.builder(
                                  itemCount: extractedData.length,
                                  physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics(),
                                  ),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    userAnswerTypes
                                        .add(TextEditingController());
                                    realAnswerList.add(listeningList[index]
                                        .answer
                                        .keys
                                        .toString());
                                    return Column(
                                      children: [
                                        Text(
                                          listeningList[index].title,
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          listeningList[index].question,
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(
                                            fontSize: 16,
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
                                          controller: userAnswerTypes[index],
                                        ),
                                      ],
                                    );
                                  });
                            } else {
                              return SafeArea(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Center(child: CircularProgressIndicator()),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Center(
                                      child: Text(
                                        "Please Wait while Questions are loading..",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    )
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

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
}
