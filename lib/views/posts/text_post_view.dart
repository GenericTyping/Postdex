import 'package:flutter/material.dart';

class TextPostView extends StatefulWidget {
  @override
  _TextPostViewState createState() => _TextPostViewState();
}

class _TextPostViewState extends State<TextPostView> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello viewers!",
      style: TextStyle(color: Colors.teal, fontSize: 40.0),
      textAlign: TextAlign.center,
    );
  }
}
