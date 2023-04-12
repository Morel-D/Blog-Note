import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskList extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  TaskList({required this.documentSnapshot});

  // final CollectionReference _tasks =
  //     FirebaseFirestore.instance.collection("tasks");

  @override
  Widget build(BuildContext context) {
    Timestamp timestamp = documentSnapshot['date'];
    DateTime dateTime = timestamp.toDate();

    var task = documentSnapshot['title'];

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
              title: Text(documentSnapshot['title']),
              subtitle: Text('Loading...')),
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
