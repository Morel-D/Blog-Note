import 'package:blog_notes/Services/noteTask.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:blog_notes/Shared/constant.dart';

class EditTTask extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  EditTTask({required this.documentSnapshot});

  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    DateTime date = DateTime.now();

    NoteTask _noteTask = NoteTask();

    _titleController.text = documentSnapshot['title'];
    List<dynamic> taskSnap = documentSnapshot['task'];
    _textController.text = taskSnap.join("\n");

    String newTitle = "";
    String newTexts = "";
    DateTime newDate = DateTime.now();

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Color.fromARGB(255, 87, 87, 87),
          ),
          title: Text(
            'Edit TaskList',
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
                  controller: _titleController,
                ),
                // Task
                TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 22,
                    decoration: formTextDecoration.copyWith(
                        hintText: "Take Notes (One line = one task)"),
                    controller: _textController),

                // Button
                Visibility(
                  // visible: _btn,
                  child: SizedBox(
                    height: 50,
                    width: 150,
                    child: TextButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          newTitle = _titleController.text;
                          newTexts = _textController.text;

                          List<String> newTask = newTexts.split("\n");

                          var task = {
                            "date": newDate,
                            "task": newTask,
                            "title": newTitle
                          };

                          await _noteTask.updateTask(documentSnapshot.id, task);

                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        "Update Task",
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
