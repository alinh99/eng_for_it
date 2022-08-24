import 'package:flutter_engforit/Screens/contents/components/speaking_icon_button.dart';
import 'package:flutter_engforit/components/app_bar.dart';
import 'package:flutter/material.dart';

class SpeakingContents extends StatefulWidget {
  const SpeakingContents({Key key, this.content}) : super(key: key);

  final String content;
  @override
  State<SpeakingContents> createState() => _SpeakingContentsState();
}

class _SpeakingContentsState extends State<SpeakingContents> {
  @override
  Widget build(BuildContext context) {
    return Appbar(
      title: 'Speaking',
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.85,
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
                        margin: const EdgeInsets.only(top: 16, left: 16),
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Color(0xFF7383C0),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              style: Theme.of(context).textTheme.bodyMedium,
                              children: [
                                const TextSpan(text: 'Tap the '),
                                WidgetSpan(
                                  child: Container(
                                    //padding: EdgeInsets.only(top: 4),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
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
                                const TextSpan(text: ' and record your voice.'),
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
                    child:  Text(
                      widget.content,
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
                      SpeakingIconButton(icon: Icons.volume_up_rounded),
                      SpeakingIconButton(icon: Icons.slow_motion_video),
                      SpeakingIconButton(icon: Icons.playlist_add_rounded),
                      SpeakingIconButton(icon: Icons.flag_rounded),
                      SpeakingIconButton(icon: Icons.share),
                    ],
                  ),
                  const SizedBox(
                    height: 256,
                  ),
                  Center(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
