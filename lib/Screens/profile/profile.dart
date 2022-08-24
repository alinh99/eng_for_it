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
                        hintText:
                            snapshot.hasData ? userData.name : 'Your name ...',
                        icon: Icons.face_outlined,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      InformationData(
                        title: 'Your email',
                        hintText: snapshot.hasData
                            ? userData.email
                            : 'Your email ...',
                        icon: Icons.email,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      InformationData(
                        title: 'Your age',
                        hintText:
                            snapshot.hasData ? userData.age : 'Your age ...',
                        icon: Icons.cake,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      InformationData(
                        title: 'Your password',
                        hintText: snapshot.hasData
                            ? userData.password
                            : 'Your password ...',
                        icon: Icons.remove_red_eye,
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
