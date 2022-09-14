import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoFormWidget extends StatelessWidget {
  late String title = "";
  late String descriptions = "";
  late ValueChanged<String> onChangedTitle;
  late ValueChanged<String> onChangedDescriptions;
  final VoidCallback onSavedTodo;

  TodoFormWidget({
    Key? key,
    this.title = "",
    this.descriptions = "",
    required this.onChangedTitle,
    required this.onChangedDescriptions,
    required this.onSavedTodo,
  }) : super(key: key);

  Widget build(BuildContext context) => SingleChildScrollView(
          child: Column(
        children: [
          buildTitle(),
          SizedBox(
            height: 10,
          ),
          buildDescription(),
          SizedBox(
            height: 10,
          ),
          buildSavedButton(),
        ],
      ));
  Widget buildTitle() => TextFormField(
      maxLines: 1,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter Your Todo Title";
        }
        return null;
      },
      onChanged: onChangedTitle,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: "Title",
      ));

  Widget buildDescription() => TextFormField(
      maxLines: 5,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter Your Todo Description";
        }
        return null;
      },
      onChanged: onChangedDescriptions,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: "Descriptions",
      ));
  Widget buildSavedButton() => InkWell(
        onTap: onSavedTodo,
        child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black),
          child: Center(
            child: Text(
              "Save",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
}
