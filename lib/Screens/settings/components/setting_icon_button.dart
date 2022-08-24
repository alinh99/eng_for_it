import 'package:flutter/material.dart';

class SettingIconButton extends StatelessWidget {
  const SettingIconButton({
    Key key,
    this.iconButton,
    this.titleButton,
    this.widthSize,
    this.pressed,
  }) : super(key: key);
  final IconData iconButton;
  final String titleButton;
  final double widthSize;
  final Function pressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 24),
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xffF6F7FE),
              //color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Icon(
              iconButton,
              color: const Color(0xff112851),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(titleButton),
          SizedBox(
            width: widthSize,
          ),
          const Icon(Icons.keyboard_arrow_right)
        ],
      ),
    );
  }
}
