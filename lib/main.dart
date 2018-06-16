import 'package:flutter/material.dart';
import 'package:postdex/models/post.dart';
import 'package:postdex/views/post_view.dart';

import 'package:postdex/views/posts/text_post_view.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Postdex',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new MyHomePage(title: 'Postdex'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Post testPost = Post.getExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: new ListView(
          children: Post.generateStubs(10).map((post) => PostView(post)).toList()
        ),
      ),
    );
  }
}
