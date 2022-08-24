
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_engforit/Screens/login/login.dart';
import 'package:flutter_engforit/components/lottie_animation.dart';
import 'package:lottie/lottie.dart';

class Error extends StatefulWidget {
  static String id = 'error';
  const Error({Key key}) : super(key: key);

  @override
  State<Error> createState() => _ErrorState();
}

class _ErrorState extends State<Error> {
  Future<LottieComposition> compositionError;
  Future<LottieComposition> _loadComposition(String path) async {
    var assetData = await rootBundle.load(path);
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  void initState() {
    compositionError = _loadComposition('assets/images/error.json');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Login.id);
              },
              child: LottieAnimation(
                composition: compositionError,
                height: 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}