// ignore_for_file: file_names

import 'package:flutter_engforit/components/lottie_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_engforit/Screens/lesson_detail/reading_detail.dart';

class SuccessfulEnrollReading extends StatefulWidget {
  static String id = 'enroll_successfully_reading';
  const SuccessfulEnrollReading({Key key}) : super(key: key);

  @override
  State<SuccessfulEnrollReading> createState() =>
      _SuccessfulEnrollReadingState();
}

class _SuccessfulEnrollReadingState extends State<SuccessfulEnrollReading> {
  Future<LottieComposition> compositionLoginSuccessfully;
  Future<LottieComposition> _loadComposition(String path) async {
    var assetData = await rootBundle.load(path);
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  void initState() {
    compositionLoginSuccessfully =
        _loadComposition('assets/images/loginSuccessfully.json');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Successfully 👆👆',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF8CC4EB),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            LottieAnimation(
              composition: compositionLoginSuccessfully,
              height: 0.4,
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, right: 64, left: 64),
              decoration: BoxDecoration(
                color: const Color(0xFF8CC4EB),
                borderRadius: BorderRadius.circular(50),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ReadingDetail.id);
                },
                child: const Text(
                  'Proceed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
