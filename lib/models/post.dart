import 'package:flutter/widgets.dart';
import 'package:postdex/models/_constants.dart';

import 'package:postdex/models/post_content.dart';
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
      this.content});

  String title;
  User submitter;
  String flair;
  Subreddit subreddit;
  int upvotes;
  int downvotes;
  int get score => upvotes - downvotes;
  DateTime submissionDate;
  List<Comment> comments;
  PostContent content;

  static List<Post> generateStubs(int amount) {
    List<Post> result = [];
    for (var i = 0; i < amount; i++) {
      Post newPost = Post.getExample();
      newPost.title = newPost.title + i.toString();
      newPost.upvotes = newPost.upvotes + i;
      newPost.downvotes = newPost.downvotes - i;
      if ((i + 1) % 8 == 0) {
        newPost.content.data = Constants.loremIpsum;
      } else if ((i + 1) % 3 == 0) {
        newPost.content.type = PostContentType.image;
        newPost.content.data = AssetImage("assets/images/placeholders/1.png");
      }
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
      content:
          PostContent(type: PostContentType.text, data: "ExampleContentText"),
      comments: <Comment>[Comment.getExample()]);
}
