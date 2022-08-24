import 'package:flutter_engforit/Screens/login/login.dart';
import 'package:flutter_engforit/components/lottie_animation.dart';
import 'package:flutter_engforit/constants.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);
  static String id = 'splash';
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  PageController controller = PageController();
  Future<LottieComposition> compositionCalendar;
  Future<LottieComposition> compositionFav;
  Future<LottieComposition> compositionCertification;
  int curr = 0;
  @override
  void initState() {
    super.initState();
    compositionCalendar = _loadComposition('assets/images/calendar.json');
    compositionFav = _loadComposition('assets/images/favourite.json');
    compositionCertification =
        _loadComposition('assets/images/certification.json');
  }

  Future<LottieComposition> _loadComposition(String path) async {
    var assetData = await rootBundle.load(path);
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: buildSplashScreen(context, 1.01, 0.4, 20.0, 10.0),
          )
        : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: buildSplashScreen(context, 0.57, 1, 40.0, 20.0),
          );
  }

  Column buildSplashScreen(
    BuildContext context,
    double height,
    double width,
    double heightSizeBoxTitle,
    double heightSizeBoxDescription,
  ) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * width,
          height: MediaQuery.of(context).size.height * height,
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                curr = value;
              });
            },
            children: [
              LottieAnimation(composition: compositionCalendar, height: 1),
              LottieAnimation(
                composition: compositionFav,
                height: 1,
              ),
              LottieAnimation(
                composition: compositionCertification,
                height: 1,
              ),
            ],
          ),
        ),
        SmoothPageIndicator(
          controller: controller,
          count: 3,
          axisDirection: Axis.horizontal,
          effect: const CustomizableEffect(
            activeDotDecoration: DotDecoration(
              width: 10,
              height: 5,
              color: kPrimaryColor,
              dotBorder: DotBorder(
                padding: 5,
                width: 5,
                color: kPrimaryColor,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(2),
              ),
            ),
            dotDecoration: DotDecoration(
              width: 5,
              height: 5,
              color: Colors.grey,
              dotBorder: DotBorder(
                padding: 5,
                width: 5,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(2),
              ),
              // borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        SizedBox(
          height: heightSizeBoxTitle,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            curr == 0
                ? 'Skills Practice'
                : curr == 1
                    ? 'Quiz Challenge'
                    : 'Certification Ready',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                curr == 0
                    ? 'Our content is written by Oxford English for Information Technology.'
                    : curr == 1
                        ? 'Take a quiz to test your knowledge on your English for IT skills!'
                        : 'Make sure you have a valid certificate after you start learning!',
                style: const TextStyle(
                  //fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        SizedBox(
          height: heightSizeBoxDescription,
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(50.0),
              ),
              color: kPrimaryColor,
            ),
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(20),
            child: GestureDetector(
              child: const Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.pushNamed(context, Login.id);
              },
            ),
          ),
        ),
      ],
    );
  }
}
