import 'dart:io';
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
            StreamBuilder<Users>(
              stream: DatabaseService(uid: user.uid).userData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Users userData = snapshot.data;
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
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 24),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Your name',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 24,
                              right: 16,
                            ),
                            child: TextFormField(
                              initialValue: userData.name,
                              onChanged: (value) {
                                name = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: const Icon(Icons.face_outlined),
                                filled: true,
                                fillColor: const Color(0xffD8DffD),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 24),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Your Age',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 24,
                              right: 16,
                            ),
                            child: TextFormField(
                              initialValue: userData.age,
                              onChanged: (value) {
                                age = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: const Icon(Icons.cake),
                                filled: true,
                                fillColor: const Color(0xffD8DffD),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 24),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Your email',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 24,
                              right: 16,
                            ),
                            child: TextFormField(
                              initialValue: userData.email,
                              onChanged: (value) {
                                email = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: const Icon(Icons.email),
                                filled: true,
                                fillColor: const Color(0xffD8DffD),
                                //hintText: widget.hintText,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 24),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Your password',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 24,
                              right: 16,
                            ),
                            child: TextFormField(
                              initialValue: userData.password,
                              onChanged: (value) {
                                password = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: const Icon(Icons.remove_red_eye),
                                filled: true,
                                fillColor: const Color(0xffD8DffD),
                              ),
                            ),
                          ),
                        ],
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
                            if (url == null &&
                                name == null &&
                                password == null &&
                                age == null &&
                                email == null) {
                              Navigator.pop(context);
                            } else {
                              url = await _storage.uploadUserImage(
                                  File(ProfilePicState.image.path));
                              await DatabaseService(uid: user.uid)
                                  .updateUserInfo(
                                name ?? userData.name,
                                password ?? userData.password,
                                age ?? userData.age,
                                url ?? userData.photoUrl,
                                email ?? userData.email,
                              );
                              
                            }
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
