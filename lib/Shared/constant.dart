import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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

SpeedDial buildSpeedDial() {
  return SpeedDial(
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
            //  Navigator.pushNamed(context, '/addNote');
          },
          backgroundColor: Colors.blueAccent),
      SpeedDialChild(
          child: Icon(
            Icons.list,
            color: Colors.white,
          ),
          backgroundColor: Colors.greenAccent),
    ],
  );
}


// FloatingActionButton(
//         onPressed: () {
//           Navigator.pushNamed(context, '/addNote');
//         },
//         backgroundColor: Color.fromARGB(255, 25, 25, 25),
//         child: Icon(Icons.add),
//       ),



