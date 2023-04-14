import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:blog_notes/Models/task.dart';

final CollectionReference _tasks =
    FirebaseFirestore.instance.collection('tasks');

class NoteTask {
// CRUD operation

// Create The task

  Future<Task?> createTask(
      String title, String text, List<String> task, var date) async {
    try {
      Map<String, dynamic> data = <String, dynamic>{
        "title": title,
        "task": task,
        "date": date
      };
      await _tasks.add(data);
    } catch (e) {
      print("Something is wrong : ${e.toString()}");
    }
  }

// Update the task

  Future<void> updateTask(String taskId, Map<String, dynamic> task) async {
    try {
      await _tasks.doc(taskId).update(task);
    } catch (e) {
      print('Something is wrong ${e.toString()}');
    }
  }

// Delete the task

  Future<void> deleteTask(String taskId) async {
    try {
      await _tasks.doc(taskId).delete();
    } catch (e) {
      print("Somthing wrong has occur ${e.toString()}");
    }
  }
}
