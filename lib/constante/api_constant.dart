class ApiUrlConstant {
  static const hostDlUrl = "https://techblog.sasansafari.com";
  static const baseurl = "https://techblog.sasansafari.com/Techblog/api/";
  static const gethomeItems = '${baseurl}home/?command=index';
  static const getArticlepublishedByMe =
      '${baseurl}article/get.php?command=published_by_me&user_id=';
  static const getArticleList =
      '${baseurl}article/get.php?command=new&user_id=';
  static const postRegister = "${baseurl}register/action.php";
  static const gettaglist = "${baseurl}article/get.php?command=tags";
  static const postarticle = "${baseurl}article/post.php";
  static const getpodcastfile =
      "${baseurl}podcast/get.php?command=get_files&podcats_id=";
}

class ApiArticleKeyConstance {
  static const title = "title";
  static const content = "content";
  static const catId = "cat_id";
  static const tagList = "tag_list";
  static const userId = "user_id";
  static const image = "image";
  static const command = "command";
}
