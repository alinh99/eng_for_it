import 'dart:io';

import 'package:flutter_engforit/Screens/profile/components/information_data.dart';
import 'package:flutter_engforit/Screens/profile/components/profile_pic.dart';
import 'package:flutter_engforit/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engforit/user_models/users.dart';
import 'package:flutter_engforit/user_services/database.dart';
import 'package:flutter_engforit/user_services/storage.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);
  static String id = 'profile_screen';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name;
  String age;
  String password;
  String email;
  String url;
  Users users = Users();
  final form = GlobalKey<FormState>();
  bool isSaved = false;
  final Storage _storage = Storage();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    return Appbar(
      title: 'Personal Data',
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            StreamBuilder(
              stream: DatabaseService(uid: user.uid).userData,
              builder: (context, snapshot) {
                Users userData = snapshot.data;
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProfilePic(
                        avatarUrl: userData.photoUrl,
                        isSaved: isSaved,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      InformationData(
                        title: 'Your name',
                        hintText: userData.name,
                        icon: Icons.face_outlined,
                        currentValue: userData.name,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      InformationData(
                        title: 'Your email',
                        hintText: userData.email,
                        icon: Icons.email,
                        currentValue: userData.email,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      InformationData(
                        title: 'Your age',
                        hintText: userData.age,
                        icon: Icons.cake,
                        currentValue: userData.age,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      InformationData(
                        title: 'Your password',
                        hintText: userData.password,
                        icon: Icons.remove_red_eye,
                        currentValue: userData.password,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 24, bottom: 24, left: 128, right: 128),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xff778df8),
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            // if (form.currentState.validate()) {
                            setState(() {
                              isSaved = true;
                            });
                            url = await _storage.uploadUserImage(
                                File(ProfilePicState.image.path));
                            await DatabaseService(uid: user.uid).updateUserInfo(
                              name ?? userData.name,
                              password ?? userData.password,
                              age ?? userData.age,
                              url ?? userData.photoUrl,
                              email ?? userData.email,
                            );
                            // }

                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      Text("Loading..."),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
