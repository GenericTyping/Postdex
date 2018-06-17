import 'package:draw/draw.dart';
import 'package:postdex/_credentials.dart';

class Constants {
  static Reddit reddit;

  static void initializeReddit() async {
    Constants.reddit = await Reddit.createInstance(
      clientId: kClientId,
      clientSecret: kSecret,
      userAgent: kAgentName,
      username: kUsername,
      password: kPassword,
    );
  }
}
