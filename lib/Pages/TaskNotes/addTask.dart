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
  String title = "";
  String task = "";
  DateTime date = DateTime.now();

  final _formKey = GlobalKey<FormState>();
  NoteTask _task = NoteTask();

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
                TextFormField(
                    decoration: formTextDecoration.copyWith(hintText: "Tilte"),
                    onChanged: (value) {
                      title = value;
                    }),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  decoration:
                      formTextDecoration.copyWith(hintText: "Take Notes"),
                  onChanged: (value) {
                    task = value;
                  },
                ),
                Visibility(
                  // visible: _btn,
                  child: SizedBox(
                    height: 50,
                    width: 150,
                    child: TextButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await _task.createTask(title, task, date);
                        }

                        // Navigator.of(context).pop();
                      },
                      child: Text(
                        "Add Task",
                        style: TextStyle(color: Colors.white),
                      ),
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
