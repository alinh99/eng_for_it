import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatelessWidget {
  const LottieAnimation({
    Key key,
    @required Future<LottieComposition> composition,
    @required this.height,
    this.width,
  })  : _composition = composition,
        super(key: key);

  final Future<LottieComposition> _composition;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LottieComposition>(
      future: _composition,
      builder: (context, snapshot) {
        var composition = snapshot.data;

        if (composition != null) {
          return Align(
            alignment: Alignment.center,
            child: Lottie(
              composition: composition,
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * height,
              width: width,
            ),
          );
        } else {
          return SafeArea(
            child: Column(
              children: const [
                SizedBox(
                  height: 300.0,
                ),
                Center(
                  child: CircularProgressIndicator(),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('Loading...')
              ],
            ),
          );
        }
      },
    );
  }
}
