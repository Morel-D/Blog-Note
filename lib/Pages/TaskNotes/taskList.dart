import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskList extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;

  TaskList({required this.documentSnapshot});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    Timestamp timestamp = widget.documentSnapshot['date'];
    DateTime dateTime = timestamp.toDate();
    var task = widget.documentSnapshot['title'];

    hasData() async {
      var taskDoc = await FirebaseFirestore.instance
          .collection('tasks')
          .doc('fQC6Xaawu7pS5W4NXhYD')
          .snapshots();

      taskDoc.forEach((element) {
        Map<String, dynamic> data = element['task'];
        data.forEach((key, value) {
          List<dynamic> data2 = value;
          data2.forEach((element) {
            print(element);
          });
        });
      });
    }

    return Card(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              backgroundColor: Color.fromARGB(255, 209, 209, 209),
              backgroundImage: AssetImage('assets/list.jpg'),
            ),
            title: Text(widget.documentSnapshot['title']),
            subtitle: FutureBuilder(
                future:
                    FirebaseFirestore.instance.collection("tasks").doc().get(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    hasData();
                    return Container();
                  } else {
                    print("No data");
                    return Container();
                  }
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                child: Text(
                  DateFormat.yMMMd().add_jm().format(dateTime).toString(),
                  style: TextStyle(color: Color.fromARGB(255, 215, 215, 215)),
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () async {},
                      icon: Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      )),
                  IconButton(
                      onPressed: () async {},
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.blueAccent,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: Colors.yellowAccent,
                      )),
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
