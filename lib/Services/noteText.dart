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

// Get Data

  // Future<QuerySnapshot?> getBlog() async {
  //   try {
  //     var snapshot = FirebaseFirestore.instance
  //         .collection("notes")
  //         .doc("sC9WB2AVlCjozcVcMLkO")
  //         .get();
  //     print(snapshot);
  //   } catch (e) {
  //     print("Something is wrong : ${e.toString()}");
  //   }
  // }

  // delete data

  Future<void> deleteBlog(String noteId) async {
    await _notes.doc(noteId).delete();
  }

  // static Blogs fromJson(Map<String, dynamic> json) =>
  //     Blogs(tile: json['title'], text: json['text']);

  // Read Data
  // Stream<List<Blogs>> readBlog()  {
  //    _notes.snapshots().map((event) => event.docs.map((e) => Blogs.fromJson(e.data()))).toList());
  // }
}
