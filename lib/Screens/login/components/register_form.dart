import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_engforit/Screens/login/error.dart';
import 'package:flutter_engforit/Screens/login/successfully_register.dart';
import 'package:flutter_engforit/components/input_container.dart';
import 'package:flutter_engforit/components/lottie_animation.dart';
import 'package:flutter_engforit/components/rounded_button.dart';
import 'package:flutter_engforit/constants.dart';
import 'package:flutter_engforit/user_services/auth.dart';
import 'package:flutter_engforit/user_services/storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
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
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String email;
  String password;
  String name;
  String age;
  final AuthService _auth = AuthService();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Storage _storage = Storage();
  XFile image;
  Future<LottieComposition> composition;

  @override
  void initState() {
    super.initState();
    composition = _loadComposition();
  }

  Future<LottieComposition> _loadComposition() async {
    var assetData = await rootBundle.load('assets/images/register.json');
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
      Navigator.pop(context);
    }

    return AnimatedOpacity(
      opacity: widget.isLogin ? 0.0 : 1.0,
      duration: widget.animationDuration * 5,
      child: Visibility(
        visible: !widget.isLogin,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: widget.size.width,
            height: widget.defaultLoginSize,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Welcome',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    child: LottieAnimation(
                      composition: composition,
                      height: 0.2,
                    ),
                    onTap: () async {
                      image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                    },
                  ),
                  const SizedBox(height: 10),
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
                        icon: Icon(Icons.remove_red_eye_outlined,
                            color: Colors.grey),
                        hintText: 'Password',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  InputContainer(
                    child: TextField(
                      onChanged: ((value) {
                        name = value;
                      }),
                      decoration: const InputDecoration(
                          icon: Icon(Icons.face_rounded, color: Colors.grey),
                          hintText: 'Name',
                          border: InputBorder.none),
                    ),
                  ),
                  InputContainer(
                    child: TextField(
                      onChanged: ((value) {
                        age = value;
                      }),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.cake_outlined, color: Colors.grey),
                          hintText: 'Age',
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        showLoaderDialog(context);
                      });
                      try {
                        final newUser = _auth.signUp(email, password);
                        if (newUser != null) {
                          Navigator.pushNamed(context, SuccessfulRegister.id);
                        } else {
                          Navigator.pushNamed(context, Error.id);
                        }
                        final url =
                            await _storage.uploadUserImage(File(image.path));
                        final userInfo = await FirebaseFirestore.instance
                            .collection('users')
                            .doc(auth.currentUser.uid)
                            .set({
                          'name': name,
                          'age': age,
                          'email': email,
                          'password': password,
                          'photo_url': url,
                        });
                        if (url.isEmpty || name.isEmpty || age.isEmpty) {
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, Error.id);
                        } else if (password.length < 6) {
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, Error.id);
                        // ignore: unrelated_type_equality_checks
                        } else if (email != emailFormat) {
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, Error.id);
                        }
                        //Navigator.pushNamed(context, SuccessfulRegister.id);
                        return userInfo;
                      } catch (e) {
                        Navigator.pushNamed(context, Error.id);
                      }
                    },
                    child: const RoundedButton(title: 'SIGN UP'),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
