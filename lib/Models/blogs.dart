import 'package:cloud_firestore/cloud_firestore.dart';

class Blogs {
  final String id;
  final String tile;
  final String text;
  final DateTime date;

  Blogs(
      {required this.date,
      required this.id,
      required this.tile,
      required this.text});
}
