import 'package:blog_notes/Pages/TaskNotes/taskList.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blog_notes/Shared/loading.dart';
import 'package:blog_notes/Services/noteTask.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  // Collection inf firestore
  var _tasks = FirebaseFirestore.instance
      .collection("tasks")
      .orderBy('date', descending: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/addTask');
          },
          backgroundColor: Color.fromARGB(255, 25, 25, 25),
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          leading: BackButton(
            color: Color.fromARGB(255, 87, 87, 87),
          ),
          title: Text(
            'TaskNote',
            style:
                TextStyle(color: Color.fromARGB(255, 87, 87, 87), fontSize: 24),
          ),
          backgroundColor: Color.fromARGB(255, 249, 249, 249),
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: StreamBuilder(
          stream: _tasks.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshot) {
            if (streamsnapshot.hasData) {
              return SafeArea(
                child: Container(
                    child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      TextFormField(
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
                            hintText: "Search for a list",
                            suffixIcon: Icon(Icons.search)),
                      ),
                      SizedBox(height: 15),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: streamsnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                streamsnapshot.data!.docs[index];

                            return TaskList(documentSnapshot: documentSnapshot);
                          })
                    ],
                  ),
                )),
              );
            } else if (streamsnapshot.connectionState ==
                ConnectionState.waiting) {
              return SizedBox(
                height: 600,
                child: Loading(),
              );
            } else {
              return SizedBox(
                height: 600,
                child: Loading(),
              );
            }
          },
        )));
  }
}
