import 'package:flutter/material.dart';

class IconButtons extends StatelessWidget {
  const IconButtons({
    this.flexValue,
    this.icon,
    this.text,
    this.iconColor,
    this.backgroundColor,
    this.pressed,
    this.widthSize,
    Key key,
  }) : super(key: key);
  final int flexValue;
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color backgroundColor;
  final Function pressed;
  final double widthSize;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexValue,
      child: InkWell(
        onTap: pressed,
        child: Container(
          padding: const EdgeInsets.only(left: 5, right: 32, top: 8, bottom: 8),
          margin: const EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: backgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                icon,
                color: iconColor,
              ),
              const SizedBox(
                width: 12,
              ),
              Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
