import 'package:flutter_engforit/components/lottie_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LessonCards extends StatelessWidget {
  const LessonCards({
    this.title,
    this.cardColor,
    this.min,
    this.totalLesson,
    Key key,
    this.composition,
    this.tapped,
    //@required this.compositionReading,
  }) : super(key: key);
  final String title;
  final int totalLesson;
  final int min;
  final Color cardColor;
  final Function tapped;
  final Future<LottieComposition> composition;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapped,
      child: Container(
        margin: const EdgeInsets.only(
          left: 24,
          right: 0.1,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: cardColor,
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Column(
            children: [
              LottieAnimation(
                composition: composition,
                height: 0.3,
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                margin: const EdgeInsets.only(left: 8, top: 0.3),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.upload_file_outlined,
                          color: Color(0xFFF5AE2C),
                          size: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        '$totalLesson Files',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          CupertinoIcons.clock,
                          color: Color(0xFF54C3FF),
                          size: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        '$min Mins',
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
