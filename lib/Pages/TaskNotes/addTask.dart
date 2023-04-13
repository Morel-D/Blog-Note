import 'package:flutter/material.dart';
import 'package:blog_notes/Shared/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blog_notes/Models/task.dart';
import 'package:blog_notes/Services/noteTask.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime date = DateTime.now();

  final _formKey = GlobalKey<FormState>();
  NoteTask _task = NoteTask();

  // List<String> task = [];
  String text = "";
  String title = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Color.fromARGB(255, 87, 87, 87),
          ),
          title: Text(
            'Add TaskList',
            style:
                TextStyle(color: Color.fromARGB(255, 87, 87, 87), fontSize: 24),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: Icon(
                Icons.list,
                color: Color.fromARGB(255, 87, 87, 87),
              ),
            )
          ],
          backgroundColor: Color.fromARGB(255, 249, 249, 249),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Title
                TextFormField(
                    decoration: formTextDecoration.copyWith(hintText: "Tilte"),
                    onChanged: (value) {
                      title = value;
                    }),
                // Task
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 22,
                  decoration: formTextDecoration.copyWith(
                      hintText: "Take Notes (One line = one task)"),
                  onChanged: (value) {
                    text = value;
                  },
                ),
                // Button
                Visibility(
                  // visible: _btn,
                  child: SizedBox(
                    height: 50,
                    width: 150,
                    child: TextButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          List<String> task = text.split("\n");
                          await _task.createTask(title, text, task, date);

                          print("Data added");
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        "Add Task",
                        style: TextStyle(color: Colors.white),
                      ),
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
