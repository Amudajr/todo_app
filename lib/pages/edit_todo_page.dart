import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/todo_model.dart';
import 'package:to_do_app/providers/todo.dart';
import 'package:to_do_app/widgets/todoFormWidget.dart';
import 'package:to_do_app/widgets/todoWidget.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;
  const EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  late String title;
  late String descriptions;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    title = widget.todo.title;
    descriptions = widget.todo.descriptions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              final provider =
                  Provider.of<TodosProvider>(context, listen: false);
              provider.removeTodo(widget.todo);

              Navigator.of(context).pop();
            },
          )
        ],
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_sharp),
        ),
        title: Text(
          "Edit Todo",
          style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Form(
          key: _formKey,
          child: TodoFormWidget(
            title: title,
            descriptions: descriptions,
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescriptions: (descriptions) =>
                setState(() => this.descriptions = descriptions),
            onSavedTodo: saveTodo,
          ),
        ),
      ),
    );
  }

  void saveTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);

      provider.updateTodo(widget.todo, title, descriptions);

      Navigator.of(context).pop();
    }
  }
}
