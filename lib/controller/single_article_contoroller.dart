import 'package:get/get.dart';
import 'package:techblog_githubbased/component/api_constant.dart';
import 'package:techblog_githubbased/models/article_info_model.dart';
import 'package:techblog_githubbased/models/article_model.dart';
import 'package:techblog_githubbased/models/tag_model.dart';
import 'package:techblog_githubbased/servisec/dio_services.dart';

class SingleArticleContoroller extends GetxController {
  RxInt Id = RxInt(0);
  RxBool loading = true.obs;
  var userId = "";
  Rx<ArticleInfoModel> articleinfomodel = ArticleInfoModel().obs;
  RxList<TagModel> tagList = RxList();
  RxList<ArticleModel> reletaedList = RxList();

  getArtileInfo() async {
    //  RxBool loading=true.obs;

    var response = await DioServices().getMethod(
        '${ApiConstant.baseurl}article/get.php?command=info&id=$Id&user_id=$userId');

    if (response.statusCode == 200) {
      articleinfomodel.value = ArticleInfoModel.fromJson(response.data);

      tagList.clear();
      response.data['tags'].forEach((element) {
        tagList.add(TagModel.fromJson(element));
      });
      
      reletaedList.clear();
      response.data['related'].forEach((element){

      reletaedList.add(ArticleModel.fromJson(element));




      });




    }
  }
}
