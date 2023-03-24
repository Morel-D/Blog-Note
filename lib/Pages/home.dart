import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: Padding(
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
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.transparent)),
                    hintText: "Search for a note"),
              ),
            ),
            SizedBox(height: 25),
            Card(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Color.fromARGB(255, 209, 209, 209),
                      backgroundImage: AssetImage('assets/pen.png'),
                    ),
                    title: Text('CHRONOS'),
                    subtitle: Text('This is the chronos enterpreise'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Text(
                          '17:48, 24 march 2023',
                          style: TextStyle(
                              color: Color.fromARGB(255, 215, 215, 215)),
                        ),
                      ),
                      SizedBox(width: 200),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                    ],
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
