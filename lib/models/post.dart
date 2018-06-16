import 'package:flutter/material.dart';

import 'package:postdex/models/post_content_type.dart';
import 'package:postdex/models/subreddit.dart';
import 'package:postdex/models/comment.dart';
import 'package:postdex/models/user.dart';

class Post {
  Post(
      {this.title,
      this.submitter,
      this.flair,
      this.subreddit,
      this.upvotes,
      this.downvotes,
      this.submissionDate,
      this.comments,
      this.contentType});

  String title;
  User submitter;
  String flair;
  Subreddit subreddit;
  int upvotes;
  int downvotes;
  int get score => upvotes - downvotes;
  DateTime submissionDate;
  List<Comment> comments;
  PostContentType contentType;

  static List<Post> generateStubs(int amount) {
    List<Post> result = [];
    for (var i = 0; i < amount; i++) {
      Post newPost = Post.getExample();
      newPost.title = newPost.title + i.toString();
      newPost.upvotes = newPost.upvotes + i;
      newPost.downvotes = newPost.downvotes - i;
      newPost.contentType =
          ((i + 1) % 3 == 0) ? PostContentType.image : PostContentType.text;
      result.add(newPost);
    }
    return result;
  }

  factory Post.getExample() => Post(
      title: "ExampleTitle",
      submitter: User.getExample(),
      subreddit: Subreddit.getExample(),
      upvotes: 420,
      downvotes: 69,
      submissionDate: DateTime.now(),
      contentType: PostContentType.text,
      comments: <Comment>[Comment.getExample()]);
}
