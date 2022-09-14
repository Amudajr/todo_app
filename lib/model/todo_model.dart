import 'package:flutter/cupertino.dart';

class TodoField {
  static const createdTime = 'craetedTime';
}

class Todo {
  DateTime? createdTime;
  String? title;
  String? descriptions;
  String? id;
  bool? isDone;

  Todo(
      {required this.createdTime,
      required this.title,
      this.descriptions = "",
      this.id,
      this.isDone});
}
