import 'package:flutter_engforit/Screens/courses/courses.dart';
import 'package:flutter_engforit/Screens/home/home.dart';
import 'package:flutter_engforit/Screens/settings/settings.dart';
import 'package:flutter_engforit/components/icon_buttons.dart';
import 'package:flutter_engforit/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key key, this.selected}) : super(key: key);
  final MenuState selected;
  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 55,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 1.4,
          ),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButtons(
                      flexValue: MenuState.home == widget.selected ? 2 : 1,
                      icon: MenuState.home == widget.selected
                          ? CupertinoIcons.house_fill
                          : CupertinoIcons.house,
                      text: MenuState.home == widget.selected ? 'Home' : '',
                      backgroundColor: MenuState.home == widget.selected
                          ? const Color(0xFF54C2FF)
                          : Colors.white,
                      iconColor: MenuState.home == widget.selected
                          ? Colors.white
                          : const Color(0xffdff3ff),
                      pressed: () {
                        Navigator.pushNamed(context, Home.id);
                      },
                    ),
                    IconButtons(
                      flexValue: MenuState.course == widget.selected ? 2 : 1,
                      icon: MenuState.course == widget.selected
                          ? CupertinoIcons.book_fill
                          : CupertinoIcons.book,
                      text: MenuState.course == widget.selected ? 'Course' : '',
                      backgroundColor: MenuState.course == widget.selected
                          ? const Color(0xFF54C2FF)
                          : Colors.white,
                      iconColor: MenuState.course == widget.selected
                          ? Colors.white
                          : const Color(0xffdff3ff),
                      pressed: () {
                        Navigator.pushNamed(context, Courses.id);
                      },
                    ),
                    IconButtons(
                      flexValue: widget.selected == MenuState.favourite ? 2 : 1,
                      icon: MenuState.favourite == widget.selected
                          ? CupertinoIcons.star_fill
                          : CupertinoIcons.star,
                      text: MenuState.favourite == widget.selected
                          ? 'Favourite'
                          : '',
                      backgroundColor: MenuState.favourite == widget.selected
                          ? const Color(0xFF54C2FF)
                          : Colors.white,
                      iconColor: MenuState.favourite == widget.selected
                          ? Colors.white
                          : const Color(0xffdff3ff),
                      pressed: () {},
                    ),
                    IconButtons(
                      flexValue: MenuState.quiz == widget.selected ? 2 : 1,
                      icon: MenuState.quiz == widget.selected
                          ? CupertinoIcons.question_circle_fill
                          : CupertinoIcons.question_circle,
                      text: MenuState.quiz == widget.selected ? 'Quiz' : '',
                      backgroundColor: MenuState.quiz == widget.selected
                          ? const Color(0xFF54C2FF)
                          : Colors.white,
                      iconColor: MenuState.quiz == widget.selected
                          ? Colors.white
                          : const Color(0xffdff3ff),
                      pressed: () {
                        // setState(() {
                        //   widget.selected = MenuState.quiz;
                        // });
                      },
                    ),
                    IconButtons(
                      flexValue: MenuState.profile == widget.selected ? 2 : 1,
                      icon: MenuState.profile == widget.selected
                          ? CupertinoIcons.person_fill
                          : CupertinoIcons.person,
                      text:
                          MenuState.profile == widget.selected ? 'Profile' : '',
                      backgroundColor: MenuState.profile == widget.selected
                          ? const Color(0xFF54C2FF)
                          : Colors.white,
                      iconColor: MenuState.profile == widget.selected
                          ? Colors.white
                          : const Color(0xffdff3ff),
                      pressed: () {
                        Navigator.pushNamed(context, Settings.id);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
