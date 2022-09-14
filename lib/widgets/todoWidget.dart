import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/model/todo_model.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({required this.todo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {},
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
              onPressed: (_) {},
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: buildTodo(context));
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
              value: false,
              onChanged: (_) {}),
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
              if (todo.descriptions!.isNotEmpty)
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
}
