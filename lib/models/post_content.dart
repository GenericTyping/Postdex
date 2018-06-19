import 'package:flutter/widgets.dart';
import 'package:draw/draw.dart';

import 'package:postdex/models/post_content_type.dart';

class PostContent<T> {
  PostContent({@required this.type, @required this.data}) {
    switch (this.type) {
      case PostContentType.text:
        assert(this.data is String);
        break;
      case PostContentType.image:
        assert(this.data is ImageProvider);
        break;
      default:
        break;
    }
  }

  PostContentType type;
  T data;

  static PostContent fromDrawSubmission(Submission submission) {
    if (submission.isSelf)
      return PostContent<String>(
        type: PostContentType.text,
        data: submission.selftext,
      );
    else if (submission.data["post_hint"] == "link") {
      return PostContent<String>(type: PostContentType.link, data: submission.url.toString());
    } else if (submission.data["post_hint"] == "image") {
      return PostContent<ImageProvider>(
          type: PostContentType.image,
          data: NetworkImage(submission.url.toString()));
    } else {
      return PostContent<String>(
        type: PostContentType.text,
        data: "Video or something...",
      );
    }
  }
}
