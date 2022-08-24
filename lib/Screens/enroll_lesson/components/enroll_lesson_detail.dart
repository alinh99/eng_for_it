import 'package:flutter/material.dart';

class EnrollLessonDetail extends StatelessWidget {
  const EnrollLessonDetail({
    this.index,
    this.title,
    this.widthSize,
    Key key,
  }) : super(key: key);
  final int index;
  final String title;
  final double widthSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xffdee0e2),
            ),
            child: Text('${index + 1}'),
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
              color: const Color(0xffD7F1FF),
            ),
            child: const Icon(
              Icons.lock,
              color: Color(0xff54c3ff),
            ),
          )
        ],
      ),
    );
  }
}
