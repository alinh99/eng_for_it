import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_engforit/Screens/login/error.dart';
import 'package:flutter_engforit/Screens/login/successfully_login.dart';
import 'package:flutter_engforit/components/input_container.dart';
import 'package:flutter_engforit/components/lottie_animation.dart';
import 'package:flutter_engforit/components/rounded_button.dart';
import 'package:flutter_engforit/constants.dart';
import 'package:flutter_engforit/user_services/auth.dart';
import 'package:lottie/lottie.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
    @required this.isLogin,
    @required this.animationDuration,
    @required this.size,
    @required this.defaultLoginSize,
  }) : super(key: key);
  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String email;
  String password;
  final AuthService _auth = AuthService();
  Future<LottieComposition> composition;
  @override
  void initState() {
    super.initState();
    composition = _loadComposition();
  }

  Future<LottieComposition> _loadComposition() async {
    var assetData = await rootBundle.load('assets/images/login.json');
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  Widget build(BuildContext context) {
    showLoaderDialog(BuildContext context) {
      AlertDialog alert = AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading..."),
            ),
          ],
        ),
      );
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return AnimatedOpacity(
      opacity: widget.isLogin ? 1.0 : 0.0,
      duration: widget.animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: widget.size.width,
          height: widget.defaultLoginSize,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome Back',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 40),
                LottieAnimation(
                  composition: composition,
                  height: 0.3,
                ),
                const SizedBox(height: 40),
                InputContainer(
                  child: TextField(
                    onChanged: ((value) {
                      email = value;
                    }),
                    decoration: const InputDecoration(
                        icon: Icon(Icons.email, color: Colors.grey),
                        hintText: 'Email',
                        border: InputBorder.none),
                  ),
                ),
                InputContainer(
                  child: TextField(
                    onChanged: ((value) {
                      password = value;
                    }),
                    cursorColor: kPrimaryColor,
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                      hintText: 'Password',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () async {
                    setState(() {
                      showLoaderDialog(context);
                    });
                    try {
                      final user = await _auth.signIn(email, password);
                      if (user != null) {
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, SuccessfulLogin.id);
                      }
                    } catch (e) {
                      Navigator.pushNamed(context, Error.id);
                    }
                  },
                  child: const RoundedButton(title: 'LOGIN'),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
