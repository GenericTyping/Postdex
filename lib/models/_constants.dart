import 'dart:async';

import 'package:draw/draw.dart';

// REMOVE THIS
import 'package:postdex/_credentials.dart';

// DEFINE THESE YOURSELF:

// String kClientId;
// String kSecret;
// String kAgentName;

class Constants {
  static Reddit reddit;

  static Future<Null> initializeRedditUser(String username, String password) async {
    Constants.reddit = await Reddit.createInstance(
      clientId: kClientId,
      clientSecret: kSecret,
      userAgent: kAgentName,
      username: username,
      password: password,
    );
  }

  static String loremIpsum = "# Lorem ipsum dolor sit amet\nconsectetur [adipiscing elit](http://generictyping.com/), sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
}
