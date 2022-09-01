import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InformationData extends StatefulWidget {
  InformationData(
      {Key key, this.title, this.hintText, this.icon, this.currentValue})
      : super(key: key);
  final String title;
  final String hintText;
  final IconData icon;
  String currentValue;

  @override
  State<InformationData> createState() => _InformationDataState();
}

class _InformationDataState extends State<InformationData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 24),
          alignment: Alignment.topLeft,
          child: Text(
            widget.title,
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
            onChanged: (value) {
              widget.currentValue = value;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: Icon(widget.icon),
              filled: true,
              fillColor: const Color(0xffD8DffD),
              hintText: widget.hintText,
            ),
          ),
        ),
      ],
    );
  }
}
