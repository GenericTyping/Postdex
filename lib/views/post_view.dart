import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

import 'package:postdex/models/post.dart';
import 'package:postdex/models/post_content_type.dart';

class PostView extends StatefulWidget {
  PostView(this.post);

  final Post post;

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  Text _buildPostTitle() => Text(widget.post.title,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white));

  Widget _buildPostContent() {
    switch (widget.post.content.type) {
      case PostContentType.text:
        return _buildPostContentText();
      case PostContentType.image:
        return _buildPostContentImage();
      default:
        return Text("Some other form of content.");
    }
  }

  Widget _buildPostContentImage() {
    return Image(
      image: widget.post.content.data,
      fit: BoxFit.cover,
      height: 300.0,
      width: double.infinity,
    );
  }

  Widget _buildPostContentText() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: MarkdownBody(data: widget.post.content.data, onTapLink: launch),
    );
  }

  Widget _buildPostControls() {
    Widget _buildControlBlock({IconData icon, String value}) {
      return Row(
        children: <Widget>[Icon(icon, color: Colors.teal[800]), Text(value)],
      );
    }

    Widget _scoreBlock = _buildControlBlock(
        icon: Icons.arrow_upward, value: widget.post.score.toString());
    Widget _submitterBlock = _buildControlBlock(
        icon: Icons.person, value: widget.post.submitter.username);
    Widget _dateBlock = _buildControlBlock(
        icon: Icons.calendar_today,
        value: DateFormat.yMd('nl').format(widget.post.submissionDate));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _scoreBlock,
        _submitterBlock,
        _dateBlock
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(),
      elevation: 3.0,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.teal[300],
            child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Row(
                children: <Widget>[
                  _buildPostTitle(),
                ],
              ),
            ),
          ),
          _buildPostContent(),
          new Container(
              color: Colors.teal[100],
              child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildPostControls(),
              ))
        ],
      ),
    );
  }
}
