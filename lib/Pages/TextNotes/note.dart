import 'package:blog_notes/Shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blog_notes/Shared/loading.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:blog_notes/Pages/TextNotes/noteList.dart';

class Note extends StatefulWidget {
  const Note({Key? key}) : super(key: key);

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
// Collection in firestore
  var _notes = FirebaseFirestore.instance
      .collection('notes')
      .orderBy('date', descending: true);

  String searchName = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder(
          stream: _notes.snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot>
                  streamSnapshot) /* streamSnapshot will have all the data available in the documents */ {
            if (streamSnapshot.hasData) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextFormField(
                            decoration: InputDecoration(
                                fillColor: Color.fromARGB(255, 209, 209, 209),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                hintText: "Search for a note",
                                suffixIcon: Icon(Icons.search)),
                            onChanged: (value) {
                              setState(() {
                                searchName = value;
                              });
                            }),
                      ),
                      SizedBox(height: 25),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: streamSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                streamSnapshot.data!.docs[index];

                            if (searchName.isEmpty) {
                              return NoteList(
                                  documentSnapshot: documentSnapshot);
                            }
                            if (documentSnapshot['title']
                                .toString()
                                .toLowerCase()
                                .startsWith(searchName.toLowerCase())) {
                              return NoteList(
                                  documentSnapshot: documentSnapshot);
                            } else {
                              return Center(
                                child: Column(
                                  children: [
                                    SizedBox(height: 50),
                                    Container(
                                      child: Image(
                                          image:
                                              AssetImage('assets/empty.png')),
                                    ),
                                    Text('No note found')
                                  ],
                                ),
                              );
                            }
                          })
                    ],
                  ),
                ),
              );
            } else {
              return SizedBox(
                height: 600,
                child: Loading(),
              );
            }
          }),
    );
  }
}
