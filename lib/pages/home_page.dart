import 'package:flutter/material.dart';

import 'package:intl/date_symbol_data_local.dart';

import 'package:postdex/models/_constants.dart';
import 'package:postdex/models/post.dart';
import 'package:postdex/views/post_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  final String title = "Postdex";

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Post testPost = Post.getExample();

  @override
  initState() {
    super.initState();
    initializeDateFormatting("nl");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: (Constants.reddit == null)
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.teal))
            : ListView(
                children: Post
                    .generateStubs(10)
                    .map((post) => PostView(post))
                    .toList()),
      ),
    );
  }
}