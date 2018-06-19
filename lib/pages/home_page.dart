import 'dart:async';

import 'package:flutter/material.dart';

import 'package:intl/date_symbol_data_local.dart';

import 'package:draw/draw.dart';

import 'package:postdex/models/_constants.dart';
import 'package:postdex/models/post.dart';
import 'package:postdex/pages/post_page.dart';
import 'package:postdex/views/post_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  final String title = "Postdex";

  static Route<dynamic> get route =>
      MaterialPageRoute(builder: (context) => HomePage());

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
    initializeDateFormatting("nl");
  }

  List<Submission> submissions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder<Submission>(
            stream: Constants.reddit.front
                .top()
                .map((content) => content as Submission),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                submissions.add(snapshot.data);

                return ListView.builder(
                  itemCount: submissions.length,
                  itemBuilder: (context, index) {
                    PostView newPostView = PostView(
                        key: ValueKey<String>(submissions.elementAt(index).id),
                        post: Post(submission: submissions.elementAt(index)));

                    return InkWell(
                      onTap: () => Navigator
                          .of(context)
                          .push(PostPage.route(newPostView)),
                      child: newPostView,
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.red,
                );
              } else {
                return CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.teal),
                );
              }
            }),
      ),
    );
  }
}
