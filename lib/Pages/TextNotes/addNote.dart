import 'package:blog_notes/Models/blogs.dart';
import 'package:blog_notes/Services/noteText.dart';
import 'package:flutter/material.dart';
import 'package:blog_notes/Shared/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final NoteText _notes = NoteText();
  final _formKey = GlobalKey<FormState>();

  String text = "";
  String title = "";

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Color.fromARGB(255, 87, 87, 87),
          ),
          title: Text(
            'Add Note',
            style:
                TextStyle(color: Color.fromARGB(255, 87, 87, 87), fontSize: 24),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.check,
                    color: Color.fromARGB(255, 87, 87, 87),
                  )),
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
                  onChanged: (value) => title = value,
                ),
                TextFormField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.multiline,
                  maxLines: 17,
                  decoration:
                      formTextDecoration.copyWith(hintText: "Take Notes"),
                  onChanged: (value) => text = value,
                ),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        var id = FirebaseFirestore.instance
                            .collection("notes")
                            .doc();
                        await _notes.createBlog(id, title, text, date);
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Add Note",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(backgroundColor: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
