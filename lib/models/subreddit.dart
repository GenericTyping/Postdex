class Subreddit{
  Subreddit({this.title, this.subscribers});

  String title;
  int subscribers;

  factory Subreddit.getExample() => Subreddit(title: "ExampleSubreddit", subscribers: 76);
}