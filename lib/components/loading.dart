import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter_spinkit/flutter_spinkit.dart";

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitRotatingCircle(
      color: Colors.blue,
      size: 100.0,
    ));
  }
}
