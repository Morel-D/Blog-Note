import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:blog_notes/Shared/constant.dart';
import 'package:blog_notes/Services/noteText.dart';

class EditNote extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  EditNote({required this.documentSnapshot});

  final NoteText _noteText = NoteText();

  final CollectionReference _notes =
      FirebaseFirestore.instance.collection('notes');

  final TextEditingController _titleControllers = TextEditingController();

  final TextEditingController _textControllers = TextEditingController();

  String newTitle = "";
  String newText = "";

  bool _btn = false;

  DateTime newDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    if (documentSnapshot != null) {
      _textControllers.text = documentSnapshot['text'];
      _titleControllers.text = documentSnapshot['title'];
    }

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
                padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: Icon(
                  Icons.edit,
                  color: Color.fromARGB(255, 87, 87, 87),
                ))
          ],
          backgroundColor: Color.fromARGB(255, 249, 249, 249),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextFormField(
                decoration: formTextDecoration.copyWith(hintText: "Tilte"),
                controller: _titleControllers,
              ),
              TextFormField(
                maxLines: 17,
                decoration: formTextDecoration.copyWith(hintText: "Take Notes"),
                controller: _textControllers,
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: TextButton(
                  onPressed: () async {
                    newTitle = _titleControllers.text;
                    newText = _textControllers.text;

                    var noteFeild = {
                      "title": newTitle,
                      "text": newText,
                      "date": newDate
                    };

                    await _noteText.updateBlog(documentSnapshot.id, noteFeild);

                    Navigator.of(context).pop(true);
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
        ));
  }
}
