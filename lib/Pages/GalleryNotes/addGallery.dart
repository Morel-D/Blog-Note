import 'package:flutter/material.dart';
import 'package:blog_notes/Shared/constant.dart';

class AddGallery extends StatefulWidget {
  const AddGallery({Key? key}) : super(key: key);

  @override
  _AddGalleryState createState() => _AddGalleryState();
}

class _AddGalleryState extends State<AddGallery> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Color.fromARGB(255, 87, 87, 87),
          ),
          title: Text(
            'Create a gallery',
            style:
                TextStyle(color: Color.fromARGB(255, 87, 87, 87), fontSize: 24),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: Icon(
                Icons.list,
                color: Color.fromARGB(255, 87, 87, 87),
              ),
            )
          ],
          backgroundColor: Color.fromARGB(255, 249, 249, 249),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Title
                TextFormField(
                    decoration: formTextDecoration.copyWith(hintText: "Tilte")),
// image upload
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Upload Image",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(backgroundColor: Colors.black),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  width: 400,
                  child: Container(
                      child: Column(
                    children: [
                      Image(image: AssetImage("assets/empty.png")),
                      Text(
                        "No Image Found",
                        style: TextStyle(
                            color: Color.fromARGB(170, 158, 158, 158)),
                      )
                    ],
                  )),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Create Gallery",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(backgroundColor: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
