import 'package:flutter/material.dart';

import 'package:postdex/views/post_view.dart';
import 'package:postdex/views/comment_view.dart';

class PostPage extends StatefulWidget {
  PostPage({this.postView});

  final PostView postView;

  static Route<dynamic> route(PostView postView) => MaterialPageRoute(
      builder: (context) => PostPage(
            postView: postView,
          ));

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.postView.post.title),
      ),
      body: ListView(
        children: <Widget>[widget.postView]..addAll(widget
            .postView.post.comments
            .map((comment) => CommentView(comment))),
      ),
    );
  }
}
