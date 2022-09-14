import 'package:flutter/cupertino.dart';
import 'package:to_do_app/model/todo_model.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
        createdTime: DateTime.now(),
        title: "Hi TAde",
        descriptions: "I love you"),
    Todo(
        createdTime: DateTime.now(),
        title: "Hi TAde",
        descriptions: "I love you"),
    Todo(
        createdTime: DateTime.now(),
        title: "Hi TAde",
        descriptions: "I love you"),
  ];
  List<Todo> get todos => _todos.toList();
  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }
}
