import 'package:flutter/material.dart';

const formTextDecoration = InputDecoration(
  fillColor: Colors.transparent,
  filled: true,
  hoverColor: Colors.transparent,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  ),
);



//  Card(
//                 child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   ListTile(
//                     leading: CircleAvatar(
//                       radius: 30.0,
//                       backgroundColor: Color.fromARGB(255, 209, 209, 209),
//                       backgroundImage: AssetImage('assets/pen.png'),
//                     ),
//                     title: Text('CHRONOS'),
//                     subtitle: Text('This is the chronos enterpreise'),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
//                         child: Text(
//                           '17:48, 24 march 2023',
//                           style: TextStyle(
//                               color: Color.fromARGB(255, 215, 215, 215)),
//                         ),
//                       ),
//                       SizedBox(width: 200),
//                       IconButton(onPressed: () {}, icon: Icon(Icons.delete))
//                     ],
//                   )
//                 ],
//               ),
//             )),