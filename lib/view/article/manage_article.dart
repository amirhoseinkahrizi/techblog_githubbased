import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:techblog_githubbased/component/my_component.dart';
import 'package:techblog_githubbased/constante/my_string.dart';
import 'package:techblog_githubbased/controller/article/manage_article_contoroller.dart';
import 'package:techblog_githubbased/gen/assets.gen.dart';
import 'package:techblog_githubbased/main.dart';

class ManageArticle extends StatelessWidget {
  ManageArticle({super.key});
  var manageArticleContorolled = Get.find<ManageArticleContoroller>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: appBar("مدریت مقاله ها"),
      body: SafeArea(
        child: Obx(() => manageArticleContorolled.loading.value
            ? const Center(child: Loading())
            : manageArticleContorolled.articleList.isNotEmpty
                ? ListView.builder(
                    itemCount: manageArticleContorolled.articleList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: Get.height / 8,
                              width: Get.width / 4,
                              child: CachedNetworkImage(
                                imageUrl: manageArticleContorolled
                                    .articleList[index].image!,
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(25)),
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover)),
                                  );
                                },
                                errorWidget: (context, url, error) {
                                  return const Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 50,
                                    color: Colors.grey,
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 250,
                                child: Text(
                                  manageArticleContorolled
                                      .articleList[index].title!,
                                  style: textTheme.displayLarge,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    manageArticleContorolled
                                        .articleList[index].author!,
                                    style: textTheme.bodySmall,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "بازدید:${manageArticleContorolled.articleList[index].view!}",
                                    style: textTheme.bodySmall,
                                  ),
                                  const SizedBox(
                                    width: 100,
                                  ),
                                  Text(
                                    manageArticleContorolled
                                        .articleList[index].status!,
                                    style: textTheme.bodySmall,
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  )
                : EmptyStateWidget(textTheme: textTheme)),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(NamedRoute.routemanagesinglearticle);
          },
          style: ButtonStyle(
            fixedSize:
                WidgetStatePropertyAll(Size(Get.width / 3, Get.height / 15)),
          ),
          child: const Text(
            MyStrings.letsGotoWriteArticle,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: Get.height / 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.icons.techbotUnhappy,
                height: 200,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: MyStrings.wellcomeThechbotUnhappy,
                    style: textTheme.headlineMedium))
          ],
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {},
                child: const Text(MyStrings.letsGotoWriteArticle))
          ],
        )
      ],
    );
  }
}
