import 'package:blog_notes/Services/noteText.dart';
import 'package:blog_notes/Shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
// Collection in firestore
  final CollectionReference _notes =
      FirebaseFirestore.instance.collection('notes');

  final NoteText _noteText = NoteText();
  final TextEditingController _titleControllers = TextEditingController();
  final TextEditingController _textControllers = TextEditingController();

  String newTitle = "";
  String newText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addNote');
        },
        backgroundColor: Color.fromARGB(255, 25, 25, 25),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          'Notes',
          style:
              TextStyle(color: Color.fromARGB(255, 87, 87, 87), fontSize: 24),
        ),
        backgroundColor: Color.fromARGB(255, 249, 249, 249),
        elevation: 0,
      ),
      // StreamBuilder helps you to keep a percistence connection with firestore database
      body: SingleChildScrollView(
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
                                // icon: Icon(Icons.search),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                hintText: "Search for a note"),
                          ),
                        ),
                        SizedBox(height: 25),
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: streamSnapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  streamSnapshot.data!.docs[index];

                              return Card(
                                  child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: CircleAvatar(
                                        radius: 30.0,
                                        backgroundColor:
                                            Color.fromARGB(255, 209, 209, 209),
                                        backgroundImage:
                                            AssetImage('assets/pen.png'),
                                      ),
                                      title: Text(documentSnapshot['title']),
                                      subtitle: Text(documentSnapshot['text']),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              25, 0, 0, 0),
                                          child: Text(
                                            '17:48, 24 march 2023',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 215, 215, 215)),
                                          ),
                                        ),
                                        SizedBox(width: 160),
                                        IconButton(
                                            onPressed: () async {
                                              await _noteText.deleteBlog(
                                                  documentSnapshot.id);
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.redAccent,
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              if (documentSnapshot != null) {
                                                _textControllers.text =
                                                    documentSnapshot['text'];

                                                _titleControllers.text =
                                                    documentSnapshot['title'];
                                              }

                                              showModalBottomSheet(
                                                  context: context,
                                                  builder: (BuildContext ctx) {
                                                    padding:
                                                    EdgeInsets.only(
                                                        top: 20,
                                                        left: 20,
                                                        right: 20,
                                                        // prevent the soft keyboard from covering text fields
                                                        bottom:
                                                            MediaQuery.of(ctx)
                                                                    .viewInsets
                                                                    .bottom +
                                                                20);
                                                    return Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Form(
                                                          child: Column(
                                                        children: [
                                                          TextFormField(
                                                              controller:
                                                                  _titleControllers,
                                                              decoration:
                                                                  formTextDecoration),
                                                          TextFormField(
                                                              controller:
                                                                  _textControllers,
                                                              decoration:
                                                                  formTextDecoration),
                                                          SizedBox(
                                                            height: 50,
                                                            width: 150,
                                                            child: TextButton(
                                                              onPressed:
                                                                  () async {
                                                                newText =
                                                                    _textControllers
                                                                        .text;

                                                                newTitle =
                                                                    _titleControllers
                                                                        .text;

                                                                await _notes
                                                                    .doc(
                                                                        documentSnapshot
                                                                            .id)
                                                                    .update({
                                                                  "title":
                                                                      newTitle,
                                                                  "text":
                                                                      newText
                                                                });

                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Text(
                                                                "Update Note",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              style: TextButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .black),
                                                            ),
                                                          )
                                                        ],
                                                      )),
                                                    );
                                                  });
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
                            })
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
