import 'package:flutter/material.dart';
import 'package:blog_notes/Shared/constant.dart';
import 'package:blog_notes/Services/noteText.dart';

class EditNote extends StatefulWidget {
  const EditNote({Key? key}) : super(key: key);

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  final NoteText _notes = NoteText();
  final _formKey = GlobalKey<FormState>();

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
            'Edit Note',
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
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Update Note",
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
