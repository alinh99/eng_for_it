
import 'dart:convert';
import 'package:flutter_engforit/Screens/quiz_contents/models/quiz.dart';
import 'package:http/http.dart' as http;

class QuizDB {
  final url = Uri.parse(
      'https://flutter-eft-final-default-rtdb.firebaseio.com/question.json');
  // add question - move to CRUD admin page later
  Future<void> addQuestion(Quiz quiz) async {
    http.post(
      url,
      body: json.encode(
        {
          'title': quiz.title,
          'option': quiz.options,
        },
      ),
    );
  }

  // fetch data from db
  Future<List<Quiz>> fetchQuestion() async {
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Quiz> newQuestions = [];
      data.forEach((key, value) {
        var newQuestion = Quiz(
          id: key,
          title: value['title'],
          options: Map.castFrom(value['option']),
        );
        newQuestions.add(newQuestion);
      });
      newQuestions.shuffle();
      //newQuestions.
      return newQuestions;
    });
  }
}
