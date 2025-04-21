import 'package:get/get.dart';
import 'package:techblog_githubbased/controller/article/list_article_contoroller.dart';
import 'package:techblog_githubbased/controller/article/manage_article_contoroller.dart';
import 'package:techblog_githubbased/controller/register_contoroller.dart';
import 'package:techblog_githubbased/controller/article/single_article_contoroller.dart';

class Articlebinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ListArticleContoroller());

    Get.lazyPut(() => SingleArticleContoroller());
  }
}

class Registerbinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterContoroller());
  }
}

class ArticleManagerbinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManageArticleContoroller());
  }
}
