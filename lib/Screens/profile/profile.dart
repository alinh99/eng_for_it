import 'package:flutter_engforit/Screens/profile/components/information_data.dart';
import 'package:flutter_engforit/components/app_bar.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);
  static String id = 'profile_screen';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Appbar(
      title: 'Personal Data',
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          const AssetImage("assets/images/avatar.jpg"),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffD8DffD),
                              ),
                              // radius: 16,
                              // backgroundColor: Color(0xffD8DffD),
                              child: const Icon(
                                Icons.camera_alt_rounded,
                                color: Color(0xff778df8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const InformationData(
                  title: 'Your name',
                  hintText: 'Your name ...',
                  icon: Icons.face_outlined,
                ),
                const SizedBox(
                  height: 16,
                ),
                const InformationData(
                  title: 'Your email',
                  hintText: 'Your email ...',
                  icon: Icons.email,
                ),
                const SizedBox(
                  height: 16,
                ),
                const InformationData(
                  title: 'Your age',
                  hintText: 'Your age ...',
                  icon: Icons.cake,
                ),
                const SizedBox(
                  height: 16,
                ),
                const InformationData(
                  title: 'Your password',
                  hintText: 'Your password ...',
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
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
