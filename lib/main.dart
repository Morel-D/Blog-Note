import 'package:blog_notes/Pages/addNote.dart';
import 'package:flutter/material.dart';
import 'package:blog_notes/Pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => Home(),
        '/addNote': (context) => AddNote()
      },
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
