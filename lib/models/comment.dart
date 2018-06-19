class Comment {
  Comment({this.submitter, this.content});

  String submitter;
  String content;

  factory Comment.getExample() => Comment(
        submitter: "ExampleCommentSubmitter",
        content: "# Hi there!\nThis is a markdown comment.",
      );
}
