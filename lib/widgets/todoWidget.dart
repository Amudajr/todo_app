import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/todo_model.dart';
import 'package:to_do_app/pages/edit_todo_page.dart';
import 'package:to_do_app/providers/todo.dart';
import 'package:to_do_app/utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({required this.todo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDone = false;
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
          startActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (_) => editTodo(context, todo),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                flex: 2,
                onPressed: (_) => deleteTod(BuildContext, context, todo),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: buildTodo(context)),
    );
  }

  Container buildTodo(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      color: Colors.white,
      child: Row(
        children: [
          Checkbox(
              activeColor: Colors.blue,
              checkColor: Colors.white,
              value: todo.isDone,
              onChanged: (_) {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                final isDone = provider.toggleTodoStatus(todo);

                Utils.showSnackBar(
                  context,
                  isDone! ? "Task Completed" : "Task Marked Complete",
                );
              }),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.title.toString(),
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              if (todo.descriptions.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    todo.descriptions.toString(),
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                ),
            ],
          )),
        ],
      ),
    );
  }

  void deleteTod(BuildContext, context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted Task Successfully');
  }

  void editTodo(BuildContext context, Todo todo) => Navigator.push(context,
      MaterialPageRoute(builder: (context) => EditTodoPage(todo: todo)));
}
