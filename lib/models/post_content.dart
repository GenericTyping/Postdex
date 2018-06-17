import 'package:flutter/widgets.dart';

import 'package:postdex/models/post_content_type.dart';

class PostContent {
  PostContent({this.type, this.data}) {
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
  dynamic data;
  /*Check in constructor if .runtimeType matches the given 'data'.*/
}
