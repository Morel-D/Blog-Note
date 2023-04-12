import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
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
        ),
        body: SingleChildScrollView(
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
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.transparent)),
                    hintText: "Search for a list",
                    suffixIcon: Icon(Icons.search)),
              ),
              SizedBox(height: 15),
              Card(
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
                      title: Text("Something to do"),
                      subtitle: Text("5 Tasks",
                          overflow: TextOverflow.ellipsis, maxLines: 2),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                          child: Text("23/03/2021"),
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
              )),
            ],
          ),
        ))));
  }
}
