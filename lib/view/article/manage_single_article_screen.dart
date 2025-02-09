import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:techblog_githubbased/component/dimens.dart';
import 'package:techblog_githubbased/constante/my_colors.dart';
import 'package:techblog_githubbased/component/my_component.dart';
import 'package:techblog_githubbased/constante/my_string.dart';
import 'package:techblog_githubbased/controller/article/manage_article_contoroller.dart';
import 'package:techblog_githubbased/controller/home_screen_contoroller.dart';
import 'package:techblog_githubbased/controller/pickfile_contoroller.dart';
import 'package:techblog_githubbased/gen/assets.gen.dart';
import 'package:techblog_githubbased/servisec/pickfile.dart';
import 'package:techblog_githubbased/view/article/edit_article_content.dart';

// ignore: must_be_immutable
class ManageSingleArticleScreen extends StatelessWidget {
  ManageSingleArticleScreen({super.key});
  var managearticlecontoroller = Get.find<ManageArticleContoroller>();
  PickfileContoroller pickfileContoroller = Get.put(PickfileContoroller());
  var homeScreenContoroler = Get.find<HomeScreenContoroler>();
  getTitile() {
    Get.defaultDialog(
        title: MyStrings.edittitlearticle,
        backgroundColor: SolidColors.maincolor,
        titleStyle: const TextStyle(color: SolidColors.scafoldColors),
        content: TextField(
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            hintText: "اینجا بنویس",
          ),
          controller: managearticlecontoroller.TitletextEditingController,
        ),
        confirm: ElevatedButton(
            onPressed: () {
              managearticlecontoroller.updatetitle();
              Get.back();
            },
            child: const Text("تایید")));
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: Get.height / 3,
                        width: Get.width,
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: Gradiant.blogpostgradiant,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                          child: pickfileContoroller.file.value.name ==
                                  "nothing"
                              ? CachedNetworkImage(
                                  imageUrl: managearticlecontoroller
                                      .articleinfomodel.value.image!,
                                  errorWidget: (context, url, error) {
                                    return Assets.images.singleplaceholder
                                        .image();
                                  },
                                  placeholder: (context, url) =>
                                      const Loading(),
                                )
                              : Image.file(
                                  fit: BoxFit.cover,
                                  File(pickfileContoroller.file.value.path!)),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: 20,
                      right: 20,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                      )),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          pickfile();
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)),
                              color: SolidColors.maincolor),
                          height: Get.height / 18,
                          width: Get.width / 3,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                MyStrings.selectyoureimage,
                                style: textTheme.bodyMedium,
                              ),
                              const Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      getTitile();
                    },
                    child: SeeMoreBlog(
                        bodymargin: Dimens.bodyMargin,
                        textTheme: textTheme,
                        title: MyStrings.edittitlearticle),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, Dimens.bodyMargin, 0),
                child: RichText(
                  text: TextSpan(
                      text:
                          managearticlecontoroller.articleinfomodel.value.title,
                      style: textTheme.displayLarge),
                  softWrap: true,
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: Get.height / 30,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: GestureDetector(
                      onTap: () => Get.to(EditArticleContent()),
                      child: SeeMoreBlog(
                          bodymargin: Dimens.bodyMargin,
                          textTheme: textTheme,
                          title: MyStrings.editmaincontentarticle),
                    ),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, Dimens.bodyMargin, 0),
                  child: HtmlWidget(
                    managearticlecontoroller.articleinfomodel.value.content!,
                    textStyle: textTheme.displayLarge,
                  )),
              SizedBox(
                height: Get.height / 20,
              ),
              GestureDetector(
                onTap: () {
                  chooseCatsBotoomSheet(textTheme);
                },
                child: SeeMoreBlog(
                    bodymargin: Dimens.bodyMargin,
                    textTheme: textTheme,
                    title: MyStrings.selectcategory),
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              Text(
                managearticlecontoroller.articleinfomodel.value.catName == null
                    ? "هیچ دسته بندی انتخاب نشده"
                    : managearticlecontoroller.articleinfomodel.value.catName!,
                style: textTheme.displayLarge,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () async =>
                      await managearticlecontoroller.storeArticle(),
                  child: managearticlecontoroller.loading.value
                      ? const Text("در حال ارسال مقاله")
                      : const Text("ارسال مقاله"))
            ],
          ),
        ),
      ),
    );
  }

  Widget cats(TextTheme texttheme) {
    return SizedBox(
        height: Get.height / 1.8,
        child: GridView.builder(
          itemCount: homeScreenContoroler.tagList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                managearticlecontoroller.articleinfomodel.update((val) {
                  val?.catId = homeScreenContoroler.tagList[index].id;
                  val?.catName = homeScreenContoroler.tagList[index].title;
                  Get.back();
                });
              },
              child: Container(
                height: 15,
                width: 15,
                decoration: const BoxDecoration(
                    color: SolidColors.buttencolots,
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                    border: Border.fromBorderSide(
                        BorderSide(width: 1.5, color: Colors.grey))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      homeScreenContoroler.tagList[index].title!,
                      style: texttheme.displaySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
        ));
  }

  chooseCatsBotoomSheet(TextTheme textTheme) {
    Get.bottomSheet(
        isScrollControlled: true,
        persistent: true,
        Container(
          height: Get.height / 1.5,
          width: Get.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height / 35,
                ),
                Text(
                  "انتخاب دسته بندی",
                  style: textTheme.displayLarge,
                ),
                SizedBox(
                  height: Get.height / 35,
                ),
                cats(textTheme)
              ],
            ),
          ),
        ));
  }
}
