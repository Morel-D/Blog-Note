import 'package:blog_notes/Models/blogs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

final CollectionReference _notes =
    FirebaseFirestore.instance.collection("notes");

class NoteText {
// CRUD Operation

// Create data

  Future<NoteText?> createBlog(String title, String text) async {
    try {
      Map<String, dynamic> data = <String, dynamic>{
        "title": title,
        "text": text
      };
      _notes.add(data);
    } catch (e) {
      print('Something went wrong ${e.toString()}');
    }
  }
}
