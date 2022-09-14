import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/todo_model.dart';
import 'package:to_do_app/providers/todo.dart';
import 'package:to_do_app/widgets/todoWidget.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return ListView.separated(
      separatorBuilder: (context, index) => Container(
        height: 8,
      ),
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(12),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoWidget(todo: todo);
      },
    );
  }
}
