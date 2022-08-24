import 'package:flutter_engforit/Screens/profile/profile.dart';
import 'package:flutter_engforit/Screens/settings/components/setting_icon_button.dart';
import 'package:flutter_engforit/components/app_bar.dart';
import 'package:flutter_engforit/components/bottom_navigation_bar.dart';
import 'package:flutter_engforit/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engforit/user_models/users.dart';
import 'package:flutter_engforit/user_services/database.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);
  static String id = 'settings';
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    return Scaffold(
      bottomNavigationBar:
          const CustomBottomNavBar(selected: MenuState.profile),
      body: Appbar(
        title: 'Settings',
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StreamBuilder(
                      stream: DatabaseService(uid: user.uid).userData,
                      builder: (context, snapshot) {
                        Users userData = snapshot.data;
                        if (snapshot.hasData) {
                          return Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 24, top: 16),
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      NetworkImage(userData.photoUrl),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 16),
                                    child: Text(
                                      userData.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    userData.age,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
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
                    const Divider(
                      height: 40,
                      indent: 24,
                      endIndent: 24,
                    ),
                    SettingIconButton(
                      pressed: () {
                        Navigator.pushNamed(context, Profile.id);
                      },
                      iconButton: Icons.person,
                      titleButton: 'Personal Data',
                      widthSize: 144,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const SettingIconButton(
                      iconButton: Icons.settings,
                      titleButton: 'Settings',
                      widthSize: 180,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const SettingIconButton(
                      iconButton: Icons.notifications,
                      titleButton: 'Notifications',
                      widthSize: 152,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const SettingIconButton(
                      iconButton: Icons.live_help_rounded,
                      titleButton: 'Help Center',
                      widthSize: 158,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const SettingIconButton(
                      iconButton: Icons.logout,
                      titleButton: 'Log out',
                      widthSize: 184,
                    ),
                    const Divider(
                      height: 40,
                      indent: 24,
                      endIndent: 24,
                    ),
                    const SettingIconButton(
                      iconButton: Icons.question_answer_outlined,
                      titleButton: 'FAQs',
                      widthSize: 198,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const SettingIconButton(
                      iconButton: Icons.people_rounded,
                      titleButton: 'Community',
                      widthSize: 158,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
