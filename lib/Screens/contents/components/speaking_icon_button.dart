import 'package:flutter/material.dart';

class SpeakingIconButton extends StatelessWidget {
  const SpeakingIconButton({
    Key key,
    this.icon,
  }) : super(key: key);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[300],
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Icon(
        icon,
        color: const Color(0xFF7383C0),
      ),
    );
  }
}
