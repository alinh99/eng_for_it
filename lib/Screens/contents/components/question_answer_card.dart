import 'package:flutter/material.dart';

class QuestionAndAnswerCard extends StatelessWidget {
  const QuestionAndAnswerCard({
    this.question,
    this.title,
    this.answerLines,
    Key key,
  }) : super(key: key);
  final String title;
  final String question;
  final int answerLines;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            question,
          ),
          const SizedBox(
            height: 8,
          ),
           TextField(
            minLines: 1,
            maxLines: answerLines,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(8),
              hintText: 'Input your answer ...',
              suffixIcon: Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.text_fields),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
