import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:postdex/models/comment.dart';

class CommentView extends StatelessWidget {
  CommentView(this.comment);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20.0),
      child: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(comment.submitter, style: TextStyle(color: Colors.grey)),
            Divider(),
            MarkdownBody(data: comment.content)
          ],
        ),
      ),
    );
  }
}
