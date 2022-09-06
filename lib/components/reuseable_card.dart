import 'package:flutter_engforit/components/lottie_animation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ReuseableCard extends StatelessWidget {
  const ReuseableCard({
    Key key,
    @required this.color,
    @required this.composition,
  }) : super(key: key);

  final Future<LottieComposition> composition;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          LottieAnimation(
            composition: composition,
            height: 0.25,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.078,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
