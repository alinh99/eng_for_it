import 'package:flutter/material.dart';

class FixedButton extends StatefulWidget {
  const FixedButton({Key key, this.tapped, this.buttonNamed, this.buttonColor})
      : super(key: key);
  final Function tapped;
  final String buttonNamed;
  final Color buttonColor;
  @override
  FixedButtonState createState() => FixedButtonState();
}

class FixedButtonState extends State<FixedButton> {
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    // return Scaffold(
    return GestureDetector(
      onTap: widget.tapped,
      child: Container(
        margin: EdgeInsets.all(displayWidth * .05),
        height: displayWidth * .155,
        //color: widget.buttonColor,
        decoration: BoxDecoration(
          color: widget.buttonColor,
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFEFF9FF),
              blurRadius: 45,
              spreadRadius: 45,
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            widget.buttonNamed,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
    // );
  }
}
