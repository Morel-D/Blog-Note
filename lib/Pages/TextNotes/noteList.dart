import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:blog_notes/Services/noteText.dart';
import 'package:blog_notes/Pages/TextNotes/editNote.dart';
import 'package:intl/intl.dart';

class NoteList extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  NoteList({required this.documentSnapshot});

  final CollectionReference _notes =
      FirebaseFirestore.instance.collection('notes');

  final NoteText _noteText = NoteText();

  @override
  Widget build(BuildContext context) {
    Timestamp timestamp = documentSnapshot['date'];
    DateTime dateTime = timestamp.toDate();

    return Card(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              backgroundColor: Color.fromARGB(255, 209, 209, 209),
              backgroundImage: AssetImage('assets/pen.png'),
            ),
            title: Text(documentSnapshot['title']),
            subtitle: Text(documentSnapshot['text'],
                overflow: TextOverflow.ellipsis, maxLines: 2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                child: Text(
                  DateFormat.yMMMd().add_jm().format(dateTime).toString(),
                  style: TextStyle(color: Color.fromARGB(255, 215, 215, 215)),
                ),
              ),
              SizedBox(width: 160),
              IconButton(
                  onPressed: () async {
                    await _noteText.deleteBlog(documentSnapshot.id);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EditNote(documentSnapshot: documentSnapshot)));
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.yellowAccent,
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
