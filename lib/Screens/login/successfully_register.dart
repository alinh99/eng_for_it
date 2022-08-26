import 'package:flutter_engforit/Screens/login/login.dart';
import 'package:flutter_engforit/components/lottie_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class SuccessfulRegister extends StatefulWidget {
  static String id = 'register_successfully';
  const SuccessfulRegister({Key key}) : super(key: key);

  @override
  State<SuccessfulRegister> createState() => _SuccessfulRegisterState();
}

class _SuccessfulRegisterState extends State<SuccessfulRegister> {
  Future<LottieComposition> compositionRegisterSuccessfully;
  Future<LottieComposition> _loadComposition(String path) async {
    var assetData = await rootBundle.load(path);
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  void initState() {
    compositionRegisterSuccessfully =
        _loadComposition('assets/images/registerSuccessfully.json');
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
            LottieAnimation(
              composition: compositionRegisterSuccessfully,
              height: 0.4,
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, right: 64, left: 64),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(50),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Login.id);
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
