import 'package:flutter/material.dart';

class LessonDetailListening extends StatelessWidget {
  const LessonDetailListening({
    this.title,
    this.widthSize,
    this.tapped,
    Key key,
  }) : super(key: key);
  final Function tapped;
  final String title;
  final double widthSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapped,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        margin: const EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xff54C3FF),
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: ,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 28),
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: widthSize),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff54C3FF),
              ),
              child: const Icon(
                Icons.lock_open,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
