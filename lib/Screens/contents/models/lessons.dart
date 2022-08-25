import 'package:flutter/widgets.dart';

class Lesson {
  String id;
  Lesson({this.id});
  @override
  String toString() {
    return 'Lesson(id: $id)';
  }
}

class Listening extends Lesson {
  final String title;
  final String question;
  // options will be like - {'1': true, '2': false} = something like this
  final Map<String, bool> answer;
  Listening({id, @required this.title, @required this.question, @required this.answer}) : super(id: id);

  //Listening().uid = lessons.id;
  @override
  String toString() {
    return 'Listening(title: $title, question: $question, answer: $answer})';
  }
}

class Writing extends Lesson {
  final String question;
  Writing({
    id,
    @required this.question,
  }) : super(id: id);
  @override
  String toString() {
    return 'Writing( question: $question)';
  }
}

class Reading extends Lesson {
  final String title;
  final String question;
  final String passage;
  final String titlePassage;
  // options will be like - {'1': true, '2': false} = something like this
  final Map<String, bool> answer;
  Reading({
    id,
    @required this.question,
    @required this.title,
    @required this.passage,
    @required this.titlePassage,
    @required this.answer,
  }) : super(id: id);

  @override
  String toString() {
    return 'Reading(title: $title, question: $question, passage: $passage, titlePassage: $titlePassage, answer: $answer)';
  }
}

class Speaking extends Lesson {
  final String question;
  // options will be like - {'1': true, '2': false} = something like this
  final Map<String, bool> answer;

  Speaking({
    id,
    @required this.question,
    @required this.answer,
  }) : super(id: id);
  @override
  String toString() {
    return 'Speaking(question: $question, answer: $answer)';
  }
}
