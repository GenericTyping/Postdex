import 'package:postdex/models/user.dart';

class Comment {
  Comment({this.submitter, this.content});

  User submitter;
  String content;

  factory Comment.getExample() => Comment(
      submitter: User(), content: "#Hi there!\nThis is a markdown comment.");
}
