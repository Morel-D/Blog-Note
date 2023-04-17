import 'package:blog_notes/Pages/TextNotes/addNote.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:blog_notes/Pages/home.dart';
import 'package:blog_notes/Pages/TaskNotes/addTask.dart';

import 'package:blog_notes/Pages/TextNotes/note.dart';
import 'package:blog_notes/Pages/TaskNotes/task.dart';
import 'package:blog_notes/Pages/GalleryNotes/addGallery.dart';

import 'package:blog_notes/Pages/TaskNotes/viewTask.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        '/addNote': (context) => AddNote(),
        '/addTask': (context) => AddTask(),
        '/gallery': (context) => AddGallery(),

        // home pages
        '/note': (context) => Note(),
        '/task': (context) => Task(),
      },
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
