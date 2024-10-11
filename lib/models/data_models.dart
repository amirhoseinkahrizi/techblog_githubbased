class HashTagmodels {
  String title;

  HashTagmodels({required this.title});
}

class BlogModels {
  int id;
  String imageurl;
  String title;
  String imagewriterurl;
  String writer;
  String date;
  String content;
  String views;

  BlogModels(
      {required this.id,
      required this.title,
      required this.imageurl,
      required this.imagewriterurl,
      required this.writer,
      required this.date,
      required this.content,
      required this.views});
}

class PodcastModels {
  int id;
  String imageurl;
  String title;
  String imagewriterurl;
  String writer;
  String date;
  String content;
  String views;

  PodcastModels(
      {required this.id,
      required this.title,
      required this.imageurl,
      required this.imagewriterurl,
      required this.writer,
      required this.date,
      required this.content,
      required this.views});
}
