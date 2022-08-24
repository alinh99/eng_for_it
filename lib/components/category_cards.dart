import 'package:flutter/material.dart';

class CategoryCards extends StatefulWidget {
  const CategoryCards({
    this.topMargin,
    this.backgroudColorCard,
    this.backgroundColorIcon,
    this.icon,
    this.iconColor,
    this.leftMargin,
    this.rightMargin,
    this.text,
    this.textColor,
    this.pressed,
    this.widthSize,
    this.heightSize,
    Key key,
  }) : super(key: key);
  final double topMargin;
  final double leftMargin;
  final double rightMargin;
  final String text;
  final Color textColor;
  final IconData icon;
  final Color backgroudColorCard;
  final Color backgroundColorIcon;
  final Color iconColor;
  final Function pressed;
  final double widthSize;
  final double heightSize;
  @override
  State<CategoryCards> createState() => _CategoryCardsState();
}

class _CategoryCardsState extends State<CategoryCards> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.pressed,
        child: Container(
          margin: EdgeInsets.only(
            top: widget.topMargin,
            left: widget.leftMargin,
            right: widget.rightMargin,
          ),
          height: widget.heightSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: widget.backgroudColorCard,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: widget.backgroundColorIcon,
                ),
                margin: const EdgeInsets.only(left: 8),
                child: Icon(
                  widget.icon,
                  color: widget.iconColor,
                ),
              ),
              SizedBox(
                width: widget.widthSize,
              ),
              Text(
                widget.text,
                style: TextStyle(
                  color: widget.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
