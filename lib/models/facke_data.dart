import 'package:techblog_githubbased/gen/assets.gen.dart';
import 'package:techblog_githubbased/models/data_models.dart';

Map posterData = {
  "posterimage": Assets.images.poster.path,
  "postertitle": "  دوازده قدم تا برنامه نویسی",
  "posertwriter": "ملیکا عزیز",
  "posterdate": "یک روز پیشو",
  "posterviewe": "421"
};

List<HashTagmodels> taglist = [
  HashTagmodels(title: "جاوا"),
  HashTagmodels(title: "کاتلین"),
  HashTagmodels(title: "وب"),
  HashTagmodels(title: "هوش مصنوعی"),
  HashTagmodels(title: "ios"),
  HashTagmodels(title: "دارت"),
];
List<HashTagmodels> selectedtag = [];

List<BlogModels> bloglist = [
  BlogModels(
      id: 0,
      title:
          " توسعه برنامه نویسی توسعه برنامه نویسی توسعه برنامه نویسی توسعه برنامه نویسی توسعه برنامه نویسی",
      imageurl:
          "https://cdn.entekhab.ir/files/fa/news/1402/12/1/1605099_749.jpg",
      imagewriterurl:
          "https://www.iconsdb.com/icons/preview/gray/contacts-xxl.png",
      writer: "امیرحسین کهریزی",
      date: "یک روز پیش",
      content: "content",
      views: "320"),
  BlogModels(
      id: 1,
      title:
          "آموزش برنامه نویسی آموزش برنامه نویسی آموزش برنامه نویسی آموزش برنامه نویسی",
      imageurl:
          "https://expresswriters.com/wp-content/uploads/2015/09/google-new-logo-450x450.jpg",
      imagewriterurl:
          "https://www.iconsdb.com/icons/preview/gray/contacts-xxl.png",
      writer: "ساسان صفری",
      date: "یک روز پیش",
      content: "content",
      views: "320"),
  BlogModels(
      id: 2,
      title:
          " توسعه هوش مصنوعی توسعه هوش مصنوعی توسعه هوش مصنوعی توسعه هوش مصنوعی توسعه هوش مصنوعی توسعه هوش مصنوعی",
      imageurl:
          "https://cdn0.iconfinder.com/data/icons/most-usable-logos/120/Amazon-512.png",
      imagewriterurl:
          "https://www.iconsdb.com/icons/preview/gray/contacts-xxl.png",
      writer: " حسن جابری",
      date: "دو روز پیش",
      content: "content",
      views: "320")
];

List<PodcastModels> podcastlist = [
  PodcastModels(
      id: 0,
      title: "رادیو فلاتر",
      imageurl:
          "https://motamem.org/wp-content/uploads/2017/12/what-is-a-podcast.jpg",
      imagewriterurl:
          "https://www.iconsdb.com/icons/preview/gray/contacts-xxl.png",
      writer: "امیرحسین کهریزی",
      date: "یک روز پیش",
      content: "content",
      views: "320"),
  PodcastModels(
      id: 1,
      title: "کد گیک",
      imageurl:
          "https://rayamarketing.com/uploads/blog/Create-Podcast-Instagram/Create-Podcast-Instagram.%D9%BE%D8%A7%D8%AF%DA%A9%D8%B3%D8%AA_1615143695.jpg",
      imagewriterurl:
          "https://www.iconsdb.com/icons/preview/gray/contacts-xxl.png",
      writer: "ساسان صفری",
      date: "یک روز پیش",
      content: "content",
      views: "320"),
  PodcastModels(
      id: 2,
      title: "رادیو کد یاد",
      imageurl:
          "https://rayamarketing.com/uploads/files/panelUpload/1b22c17319d227847ee4a64cde7ed50e.jpeg",
      imagewriterurl:
          "https://www.iconsdb.com/icons/preview/gray/contacts-xxl.png",
      writer: " حسن جابری",
      date: "دو روز پیش",
      content: "content",
      views: "320"),
];
