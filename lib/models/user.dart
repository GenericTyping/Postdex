class User {
  User({this.username, this.commentKarma, this.postKarma});

  String username;
  int commentKarma;
  int postKarma;

  factory User.getExample() =>
      User(username: "ExampleUsername", commentKarma: 4982, postKarma: 19689);
}
