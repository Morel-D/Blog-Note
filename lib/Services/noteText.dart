import 'package:blog_notes/Models/blogs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final CollectionReference _notes =
    FirebaseFirestore.instance.collection("notes");

class NoteText {
// CRUD Operation

// Create data

  Future<Blogs?> createBlog(var id, String title, String text) async {
    try {
      Map<String, dynamic> data = <String, dynamic>{
        "id": id,
        "title": title,
        "text": text
      };
      _notes.add(data);
    } catch (e) {
      print('Something went wrong ${e.toString()}');
    }
  }

// Delete data

  Future<void> deleteBlog(String noteId) async {
    await _notes.doc(noteId).delete();
  }

// Update data

// Read Data
}
