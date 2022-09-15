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
  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();
  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool? toggleTodoStatus(Todo todo) {
    todo.isDone = true;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String descriptions) {
    todo.title = title;
    todo.descriptions = descriptions;

    notifyListeners();
  }
}
