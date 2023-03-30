import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
          child: SpinKitCubeGrid(
        color: Color.fromARGB(255, 87, 87, 87),
        size: 50.0,
      )),
    );
  }
}
