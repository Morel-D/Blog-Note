import 'package:flutter/material.dart';

import '../../Shared/loading.dart';

class ViewTask extends StatefulWidget {
  final documentSnapshot;

  ViewTask({required this.documentSnapshot});

  @override
  State<ViewTask> createState() => _ViewTaskState();
}

class _ViewTaskState extends State<ViewTask> {
  bool? value = false;
  var text = TextDecoration.none;

  @override
  Widget build(BuildContext context) {
    List<dynamic> taskText = widget.documentSnapshot['task'];
    var numberOfTask = taskText.length <= 1 ? "Task" : "Tasks";

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Color.fromARGB(255, 87, 87, 87),
          ),
          title: Text(
            "${widget.documentSnapshot['title']}",
            style:
                TextStyle(color: Color.fromARGB(255, 87, 87, 87), fontSize: 20),
          ),
          backgroundColor: Color.fromARGB(255, 249, 249, 249),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit,
                          color: Color.fromARGB(255, 54, 54, 54))),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete,
                          color: Color.fromARGB(255, 54, 54, 54))),
                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${taskText.length} ${numberOfTask}",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 144, 144, 144))),
              SizedBox(height: 10),
              for (var texts in taskText)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Row(
                      children: [
                        Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.black,
                            value: this.value,
                            onChanged: (bool? newValue) {
                              setState(() {
                                this.value = newValue;
                                if (this.value == true) {
                                  setState(() {
                                    text = TextDecoration.lineThrough;
                                  });
                                } else {
                                  text = TextDecoration.none;
                                }
                              });
                            }),
                        SizedBox(width: 15),
                        Text(
                          "${texts}",
                          style: TextStyle(decoration: text),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        )));
  }
}
