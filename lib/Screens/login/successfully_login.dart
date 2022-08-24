import 'package:flutter_engforit/Screens/home/home.dart';
import 'package:flutter_engforit/components/lottie_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class SuccessfulLogin extends StatefulWidget {
  static String id = 'login_successfully';
  const SuccessfulLogin({Key key}) : super(key: key);

  @override
  State<SuccessfulLogin> createState() => _SuccessfulLoginState();
}

class _SuccessfulLoginState extends State<SuccessfulLogin> {
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
      //backgroundColor: const Color(0xFF56CBFF),
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
                  Navigator.pushNamed(context, Home.id);
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
