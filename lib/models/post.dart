import 'package:flutter/widgets.dart';
import 'package:draw/draw.dart' as DRAW;

import 'package:postdex/models/comment.dart';
import 'package:postdex/models/post_content.dart';

class Post {
  Post({@required this.submission});

  DRAW.Submission submission;
  String get title => submission.title;
  String get submitter => submission.author;
  String get flair => submission.authorFlairText;
  String get subreddit => submission.subreddit.displayName;
  int get upvotes => submission.upvotes;
  int get downvotes => submission.downvotes;
  int get score => upvotes - downvotes;
  DateTime get submissionDate => submission.createdUtc;
  List<Comment> get comments => [Comment.getExample()];

  PostContent get content => PostContent.fromDrawSubmission(submission);
}
