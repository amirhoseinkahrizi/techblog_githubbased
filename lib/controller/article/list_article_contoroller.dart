import 'package:get/get.dart';
import 'package:techblog_githubbased/constante/api_constant.dart';
import 'package:techblog_githubbased/models/article_model.dart';
import 'package:techblog_githubbased/models/tag_model.dart';
import 'package:techblog_githubbased/servisec/dio_services.dart';

class ListArticleContoroller extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = true.obs;
  RxList<TagModel> taglist = RxList();
  RxList<ArticleModel> relatedList = RxList();
  @override
  onInit() {
    super.onInit();
    getlist();
  }

  getlist() async {
    //  RxBool loading=true.obs;
    var response = await DioServices().getMethod(ApiUrlConstant.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));

        //  RxBool loading=false.obs;
      });
    }
  }

  getArticleListWithTagsId(String iD) async {
    //  RxBool loading=true.obs;

    taglist = RxList();

    var response = await DioServices().getMethod(
        '${ApiUrlConstant.baseurl}article/get.php?command=get_articles_with_tag_id&tag_id=$iD&user_id=');

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));

        //  RxBool loading=false.obs;
      });
    }
  }

  getTagsList() async {
    taglist = RxList();

    var response = await DioServices().getMethod(ApiUrlConstant.getArticleList);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        taglist.add(TagModel.fromJson(element));
      });
    }
  }
}
