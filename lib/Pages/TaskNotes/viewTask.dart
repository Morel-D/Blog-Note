import 'package:flutter/material.dart';

class ViewTask extends StatefulWidget {
  const ViewTask({Key? key}) : super(key: key);

  @override
  State<ViewTask> createState() => _ViewTaskState();
}

class _ViewTaskState extends State<ViewTask> {
  bool? value = false;
  var text = TextDecoration.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: SafeArea(
                child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Divider(),
              SizedBox(height: 5),
              Text(
                "5 Tasks",
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 145, 145, 145)),
              ),
              SizedBox(height: 20),
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
                        "Washing the dishes",
                        style: TextStyle(decoration: text),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ))));
  }
}
