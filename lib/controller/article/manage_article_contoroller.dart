import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog_githubbased/constante/api_constant.dart';
import 'package:techblog_githubbased/constante/commands.dart';
import 'package:techblog_githubbased/constante/storage_const.dart';
import 'package:techblog_githubbased/controller/pickfile_contoroller.dart';
import 'package:techblog_githubbased/models/article_info_model.dart';
import 'package:techblog_githubbased/models/article_model.dart';
import 'package:techblog_githubbased/servisec/dio_services.dart';

class ManageArticleContoroller extends GetxController {
  var myUserId = GetStorage().read(StoraegKey().userId);

  TextEditingController TitletextEditingController = TextEditingController();
  RxList<ArticleModel> articleList = RxList.empty();
  Rx<ArticleInfoModel> articleinfomodel = ArticleInfoModel(
          """اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن1 """,
          "salam kooni",
          """ من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی""")
      .obs;
  RxBool loading = false.obs;
  @override
  onInit() {
    super.onInit();
    getManagedArticle();
  }

  getManagedArticle() async {
    loading.value = true;
    var response = await DioServices()
        .getMethod("${ApiUrlConstant.getArticlepublishedByMe}$myUserId");

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
        log(response.data.toString());
      });
    }
    loading.value = false;
  }

  updatetitle() {
    articleinfomodel.update(
      (val) {
        val!.title = TitletextEditingController.text;
      },
    );
  }

  storeArticle() async {
    loading.value = true;
    var fileContoroller = Get.find<PickfileContoroller>();
    log("userId$myUserId");
    Map<String, dynamic> map = {
      ApiArticleKeyConstance.title: articleinfomodel.value.title!,
      ApiArticleKeyConstance.content: articleinfomodel.value.content!,
      ApiArticleKeyConstance.catId: articleinfomodel.value.catId!,
      ApiArticleKeyConstance.tagList: "[]",
      ApiArticleKeyConstance.userId: myUserId,
      ApiArticleKeyConstance.image:
          await dio.MultipartFile.fromFile(fileContoroller.file.value.path!),
      ApiArticleKeyConstance.command: Commands.store
    };
    log("mapppppp$map");
    var response =
        await DioServices().postMethod(map, ApiUrlConstant.postarticle);
    log("send article${response.data}");
    loading.value = false;
  }
}
