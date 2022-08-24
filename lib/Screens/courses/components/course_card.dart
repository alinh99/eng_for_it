import 'package:flutter_engforit/components/lottie_animation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    this.bottomMargin,
    this.topMargin,
    this.title,
    this.cardColor,
    Key key,
    this.composition,
    this.description,
    this.tapped,
  }) : super(key: key);
  final String title;
  final String description;
  final Color cardColor;
  final double topMargin;
  final double bottomMargin;
  final Function tapped;

  final Future<LottieComposition> composition;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapped,
      child: Container(
        margin: EdgeInsets.only(
            left: 16, right: 16, top: topMargin, bottom: bottomMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: cardColor,
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LottieAnimation(
                composition: composition,
                height: 0.2,
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
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
