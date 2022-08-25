import 'package:flutter_engforit/Screens/contents/models/lessons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LessonDB {
  Uri _uri;
  Writing _writing;
  Speaking _speaking;
  Listening _listening;
  Reading _reading;

  Future<void> addLesson(Object lessons, String lesson, int noEx) async {
    if (lesson == 'writing'.toLowerCase()) {
      _uri = Uri.parse(
          'https://flutter-eft-final-default-rtdb.firebaseio.com/lesson_writing_$noEx.json');

      _writing = lessons;
      http.post(
        _uri,
        body: json.encode(
          {
            'question': _writing.question,
          },
        ),
      );
    } else if (lesson == 'speaking'.toLowerCase()) {
      _uri = Uri.parse(
          'https://flutter-eft-final-default-rtdb.firebaseio.com/lesson_speaking_$noEx.json');

      _speaking = lessons;
      http.post(
        _uri,
        body: json.encode(
          {
            'question': _speaking.question,
            'answer': _speaking.answer,
          },
        ),
      );
    } else if (lesson == 'listening'.toLowerCase()) {
      _uri = Uri.parse(
          'https://flutter-eft-final-default-rtdb.firebaseio.com/lesson_listening_$noEx.json');

      _listening = lessons;
      http.post(
        _uri,
        body: json.encode(
          {
            'answer': _listening.answer,
            'title': _listening.title,
            'question': _listening.question
          },
        ),
      );
    } else if (lesson == 'reading'.toLowerCase()) {
      _uri = Uri.parse(
          'https://flutter-eft-final-default-rtdb.firebaseio.com/lesson_reading_$noEx.json');
      _reading = lessons;
      http.post(
        _uri,
        body: json.encode(
          {
            'title': _reading.title,
            'question': _reading.question,
            'answer': _reading.answer,
            'passage': _reading.passage,
            'titlePassage': _reading.titlePassage,
          },
        ),
      );
    }
  }

  Future<List<Object>> editLessonDB(int noEx, String lesson) async {
    List<Object> lessons = [];
    if (lesson == 'writing'.toLowerCase()) {
      _uri = Uri.parse(
          'https://flutter-eft-final-default-rtdb.firebaseio.com/lesson_writing_$noEx.json');
      return http.get(_uri).then((response) {
        var data = json.decode(response.body) as Map<dynamic, dynamic>;
        data.forEach((key, value) {
          var newQuestion = Writing(
            question: value['question'],
          );
          lessons.add(newQuestion);
        });
        return lessons;
      });
    } else if (lesson == 'reading'.toLowerCase()) {
      _uri = Uri.parse(
          'https://flutter-eft-final-default-rtdb.firebaseio.com/lesson_reading_$noEx.json');
      return http.get(_uri).then((response) {
        var data = json.decode(response.body) as Map<dynamic, dynamic>;
        data.forEach((key, value) {
          var newQuestion = Reading(
              question: value['question'],
              title: value['title'],
              answer: Map.castFrom(value['answer']),
              passage: value['passage'],
              titlePassage: value['titlePassage']);
          lessons.add(newQuestion);
        });
        return lessons;
      });
    } else if (lesson == 'speaking'.toLowerCase()) {
      _uri = Uri.parse(
          'https://flutter-eft-final-default-rtdb.firebaseio.com/lesson_speaking_$noEx.json');
      return http.get(_uri).then((response) {
        var data = json.decode(response.body) as Map<dynamic, dynamic>;
        data.forEach((key, value) {
          var newQuestion = Speaking(
            question: value['question'],
            answer: Map.castFrom(value['answer']),
          );
          lessons.add(newQuestion);
        });
        return lessons;
      });
    } else if (lesson == 'listening'.toLowerCase()) {
      _uri = Uri.parse(
          'https://flutter-eft-final-default-rtdb.firebaseio.com/lesson_listening_$noEx.json');
      return http.get(_uri).then((response) {
        var data = json.decode(response.body) as Map<dynamic, dynamic>;
        data.forEach((key, value) {
          var newQuestion = Listening(
            question: value['question'],
            answer: Map.castFrom(value['answer']),
            title: value['title'],
          );
          lessons.add(newQuestion);
        });
        return lessons;
      });
    } else {
      return ['Wrong type'];
    }
  }

  Future<List<Object>> fetchLessonDB(int noEx, String lesson) async {
    List<Object> lessons = [];
    if (lesson == 'writing'.toLowerCase()) {
      _uri = Uri.parse(
          'https://flutter-eft-final-default-rtdb.firebaseio.com/lesson_writing_$noEx.json');
      return http.get(_uri).then((response) {
        var data = json.decode(response.body) as Map<dynamic, dynamic>;
        data.forEach((key, value) {
          var newQuestion = Writing(
            id: key,
            question: value['question'],
          );
          lessons.add(newQuestion);
        });
        return lessons;
      });
    } else if (lesson == 'reading'.toLowerCase()) {
      _uri = Uri.parse(
          'https://flutter-eft-final-default-rtdb.firebaseio.com/lesson_reading_$noEx.json');
      return http.get(_uri).then((response) {
        var data = json.decode(response.body) as Map<dynamic, dynamic>;
        data.forEach((key, value) {
          var newQuestion = Reading(
            id: key,
            question: value['question'],
            title: value['title'],
            answer: Map.castFrom(value['answer']),
            passage: value['passage'],
            titlePassage: value['titlePassage'],
          );
          lessons.add(newQuestion);
        });
        return lessons;
      });
    } else if (lesson == 'speaking'.toLowerCase()) {
      _uri = Uri.parse(
          'https://flutter-eft-final-default-rtdb.firebaseio.com/lesson_speaking_$noEx.json');
      return http.get(_uri).then((response) {
        var data = json.decode(response.body) as Map<dynamic, dynamic>;
        data.forEach((key, value) {
          var newQuestion = Speaking(
            id: key,
            question: value['question'],
            answer: Map.castFrom(value['answer']),
          );
          lessons.add(newQuestion);
        });
        return lessons;
      });
    } else if (lesson == 'listening'.toLowerCase()) {
      _uri = Uri.parse(
          'https://flutter-eft-final-default-rtdb.firebaseio.com/lesson_listening_$noEx.json');
      return http.get(_uri).then((response) {
        var data = json.decode(response.body) as Map<dynamic, dynamic>;
        data.forEach((key, value) {
          var newQuestion = Listening(
            id: key,
            question: value['question'],
            answer: Map.castFrom(value['answer']),
            title: value['title'],
          );
          lessons.add(newQuestion);
        });
        return lessons;
      });
    } else {
      return ['Wrong type'];
    }
  }
}
