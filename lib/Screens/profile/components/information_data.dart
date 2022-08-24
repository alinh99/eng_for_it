import 'package:flutter/material.dart';

class InformationData extends StatelessWidget {
  const InformationData({Key key, this.title, this.hintText, this.icon})
      : super(key: key);
  final String title;
  final String hintText;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 24),
          alignment: Alignment.topLeft,
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
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
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: Icon(icon),
              filled: true,
              fillColor: const Color(0xffD8DffD),
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
