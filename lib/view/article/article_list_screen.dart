import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog_githubbased/component/my_component.dart';
import 'package:techblog_githubbased/controller/article/list_article_contoroller.dart';
import 'package:techblog_githubbased/controller/article/single_article_contoroller.dart';

// ignore: must_be_immutable
class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key, required this.title});

  var title;

  ListArticleContoroller listarticleContoroller =
      Get.put(ListArticleContoroller());

  SingleArticleContoroller singleArticleContoroller =
      Get.put(SingleArticleContoroller());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: appBar(title),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Obx(() => ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: listarticleContoroller.articleList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      singleArticleContoroller.getArtileInfo(
                          listarticleContoroller.articleList[index].id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Get.height / 6,
                            width: Get.width / 3,
                            child: CachedNetworkImage(
                              imageUrl: listarticleContoroller
                                  .articleList[index].image!,
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(30)),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover)),
                                );
                              },
                              placeholder: (context, url) => const Loading(),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.image_not_supported_rounded,
                                color: Colors.grey,
                                size: 50,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  listarticleContoroller
                                      .articleList[index].title!,
                                  style: textTheme.bodySmall,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    listarticleContoroller
                                        .articleList[index].author!,
                                    style: textTheme.bodySmall,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "${listarticleContoroller.articleList[index].view!} بازدید",
                                    style: textTheme.bodySmall,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}
