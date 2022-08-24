import 'package:flutter_engforit/Screens/profile/profile.dart';
import 'package:flutter_engforit/Screens/settings/components/setting_icon_button.dart';
import 'package:flutter_engforit/components/app_bar.dart';
import 'package:flutter_engforit/components/bottom_navigation_bar.dart';
import 'package:flutter_engforit/enum.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);
  static String id = 'settings';
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          const CustomBottomNavBar(selected: MenuState.profile),
      body: Appbar(
        title: 'Settings',
        body: SafeArea(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 24, top: 16),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/images/avatar.jpg'),
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
                            child: const Text(
                              'Nguyen Thi My Duyen',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            '22',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
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
    );
  }
}
