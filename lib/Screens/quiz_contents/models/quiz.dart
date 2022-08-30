import 'package:flutter/material.dart';

class Quiz {
  final String id;
  final String title;
  final Map<String, bool> options;
  // options will be like - {'1': true, '2': false} = something like this

  Quiz({@required this.title, @required this.options, this.id});

  // override toString method to print the question to console
  @override
  String toString() {
    return 'Question(title: $title, options: $options)';
  }
}
