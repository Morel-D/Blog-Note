import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:blog_notes/Pages/TextNotes/note.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SpeedDial(
          direction: SpeedDialDirection.left,
          animatedIcon: AnimatedIcons.add_event,
          animatedIconTheme: IconThemeData(size: 28.0),
          backgroundColor: Color.fromARGB(255, 25, 25, 25),
          visible: true,
          curve: Curves.elasticInOut,
          children: [
            SpeedDialChild(
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/addNote');
                },
                backgroundColor: Colors.blueAccent),
            SpeedDialChild(
              child: Icon(
                Icons.list,
                color: Colors.white,
              ),
              backgroundColor: Colors.greenAccent,
              onTap: () {
                Navigator.pushNamed(context, '/addTask');
              },
            ),
            SpeedDialChild(
              child: Icon(
                Icons.mic_rounded,
                color: Colors.white,
              ),
              backgroundColor: Color.fromARGB(255, 240, 105, 202),
              onTap: () {
                // Navigator.pushNamed(context, '/addTask');
              },
            ),
            SpeedDialChild(
              child: Icon(
                Icons.image,
                color: Colors.white,
              ),
              backgroundColor: Color.fromARGB(255, 226, 211, 40),
              onTap: () {
                // Navigator.pushNamed(context, '/addTask');
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
                height: 700,
                width: 500,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 25, 25, 25),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(400),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notes',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Text(
                        'The worlds records in your hands',
                        style: TextStyle(
                            color: Color.fromRGBO(214, 214, 214, 0.695),
                            fontSize: 15,
                            fontFamily: AutofillHints.middleName),
                      ),
                    ],
                  ),
                )),
            Positioned(
              left: 90,
              top: 250,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                          height: 130,
                          width: 150,
                          child: TextButton(
                            onPressed: () {},
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.blueAccent),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                                Text(
                                  "Text Notes",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white),
                          )),
                      SizedBox(
                        width: 50,
                      ),
                      SizedBox(
                          height: 130,
                          width: 150,
                          child: TextButton(
                            onPressed: () {},
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.greenAccent),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Icon(
                                          Icons.list,
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                                Text(
                                  "Task List",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white),
                          ))
                    ],
                  ),
                  SizedBox(height: 23),
                  Row(
                    children: [
                      SizedBox(
                          height: 130,
                          width: 150,
                          child: TextButton(
                            onPressed: () {},
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Color.fromARGB(
                                              255, 226, 211, 40)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Icon(
                                          Icons.image,
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                                Text(
                                  "Gallery",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white),
                          )),
                      SizedBox(
                        width: 50,
                      ),
                      SizedBox(
                          height: 130,
                          width: 150,
                          child: TextButton(
                            onPressed: () {},
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Color.fromARGB(
                                              255, 240, 105, 202)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Icon(
                                          Icons.mic,
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                                Text(
                                  "Voice Note",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
