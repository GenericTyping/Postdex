import 'package:flutter/material.dart';

import 'package:postdex/models/post.dart';
import 'package:postdex/models/post_content_type.dart';

class PostView extends StatefulWidget {
  PostView(this.post);

  final Post post;

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  Widget _buildPostContent() {
    switch (widget.post.contentType) {
      case PostContentType.text:
        return Text("Post Content Text!");
      case PostContentType.image:
        return Text("Post Content Image!",
            style: TextStyle(fontStyle: FontStyle.italic));
      default:
        return Text("Post Content Default!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Divider(),
        Text(widget.post.title, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(widget.post.submitter.username,
            style: TextStyle(fontStyle: FontStyle.italic)),
        _buildPostContent()
      ],
    );
  }
}
