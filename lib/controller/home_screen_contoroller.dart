import 'package:get/get.dart';
import 'package:techblog_githubbased/component/api_constant.dart';
import 'package:techblog_githubbased/models/article_model.dart';
import 'package:techblog_githubbased/models/podcast_model.dart';
import 'package:techblog_githubbased/models/poster_model.dart';
import 'package:techblog_githubbased/models/tag_model.dart';
import 'package:techblog_githubbased/servisec/dio_services.dart';

class HomeScreenContoroler extends GetxController {
  RxBool loading = true.obs;
  RxList<TagModel> tagList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcast = RxList();
  Rx<PosterModel> poster = PosterModel().obs;

  @override
  onInit() {
    super.onInit();
    getMomeItems();
  }

  getMomeItems() async {
     loading.value=true;
    var response = await DioServices().getMethod(ApiConstant.gethomeItems);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });

      response.data['top_podcasts'].forEach((element) {
        topPodcast.add(PodcastModel.fromJson(element));
      });

      response.data["tags"].forEach((element) {
        tagList.add(TagModel.fromJson(element));
      });

      poster.value = PosterModel.fromJson(response.data['poster']);

      loading.value = false;
    }
  }
}
