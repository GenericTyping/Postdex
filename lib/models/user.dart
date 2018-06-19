import 'dart:async';

import 'package:draw/draw.dart';

import 'package:postdex/models/_constants.dart';

class User {
  User({this.username, this.commentKarma, this.postKarma});

  String username;
  int commentKarma;
  int postKarma;

  factory User.getExample() => User(
        username: "ExampleUsername",
        commentKarma: 4982,
        postKarma: 19689,
      );
}
