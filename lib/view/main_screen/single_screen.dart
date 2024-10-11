import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog_githubbased/component/my_colors.dart';
import 'package:techblog_githubbased/component/my_component.dart';
import 'package:techblog_githubbased/component/my_string.dart';
import 'package:techblog_githubbased/controller/list_article_contoroller.dart';
import 'package:techblog_githubbased/controller/single_article_contoroller.dart';
import 'package:techblog_githubbased/gen/assets.gen.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:techblog_githubbased/view/article_list_screen.dart';

class SingleScreen extends StatefulWidget {
  const SingleScreen({super.key});

  @override
  State<SingleScreen> createState() => _SingleScreenState();
}

class _SingleScreenState extends State<SingleScreen> {
  SingleArticleContoroller singleArticleContoroller =
      Get.put(SingleArticleContoroller());

  @override
  void initState() {
    super.initState();
    singleArticleContoroller.getArtileInfo();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(
            () => Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: singleArticleContoroller
                            .articleinfomodel.value.image!,
                        imageBuilder: (context, imageProvider) {
                          return Image(image: imageProvider);
                        },
                        errorWidget: (context, url, error) =>
                            Image.asset(Assets.images.singleplaceholder.path),
                        placeholder: (context, url) => const loading(),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 60,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: Gradiant.singleAppbarGradiant,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(width: 20),
                              Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              Expanded(child: SizedBox()),
                              Icon(
                                Icons.bookmark_border_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, bottom: 20),
                  child: Text(
                    singleArticleContoroller.articleinfomodel.value.title!,
                    style: textTheme.displayLarge,
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Image(
                        image: AssetImage(Assets.images.avatarscreen.path),
                        height: Get.height / 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        singleArticleContoroller.articleinfomodel.value.author!,
                        style: textTheme.bodySmall,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        singleArticleContoroller
                            .articleinfomodel.value.createdAt!,
                        style: textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                /////content text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HtmlWidget(

                    
                    singleArticleContoroller.articleinfomodel.value.content!, 
                    onLoadingBuilder: (context, element, loadingProgress) =>
                        const loading(),
                    enableCaching: true,
                    textStyle: textTheme.headlineMedium,
                    
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: singleArticleContoroller.tagList.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: index == 0 ? 25 : 15),
                        child: GestureDetector (
                          onTap: () async{
                            var tagID=  singleArticleContoroller.tagList[index].id!;
                            await Get.find<ListArticleContoroller>().getArticleListWithTagsId(tagID);
                            Get.to(ArticleListScreen());
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                color: SolidColors.tagcolors,
                                border: Border.fromBorderSide(
                                    BorderSide(color: SolidColors.tagborder))),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                ImageIcon(
                                  Assets.icons.hashtag.provider(),
                                  color: Colors.black45,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  singleArticleContoroller.tagList[index].title!,
                                  style: textTheme.bodySmall,
                                ),
                                const SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 250, bottom: 30),
                  child:
                      Text(MyStrings.relatednote, style: textTheme.titleMedium),
                ),
                SizedBox(
                  height: 300,
                  child: Obx(
                    () => ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: singleArticleContoroller.reletaedList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: index == 0 ? 25 : 15),
                          child: Column(
                            children: [
                              SizedBox(
                                height: Get.height / 5.7,
                                width: Get.width / 2.5,
                                child: Stack(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: singleArticleContoroller
                                          .reletaedList[index].image!,
                                      imageBuilder: (context, imageProvider) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(25)),
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.fill)),
                                          foregroundDecoration:
                                              const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(Radius
                                                          .circular(25)),
                                                  gradient: LinearGradient(
                                                      colors: Gradiant
                                                          .blogpostgradiant,
                                                      begin: Alignment
                                                          .bottomCenter,
                                                      end: Alignment.center)),
                                        );
                                      },
                                      placeholder: (context, url) =>
                                          const loading(),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons
                                              .image_not_supported_outlined),
                                    ),
                                    Positioned(
                                        bottom: 10,
                                        right: 10,
                                        left: 10,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(singleArticleContoroller
                                                .reletaedList[index].author!),
                                            Text(singleArticleContoroller
                                                .reletaedList[index].view!),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Get.height / 55,
                              ),
                              SizedBox(
                                width: Get.width / 2.5,
                                child: Text(
                                  singleArticleContoroller
                                      .reletaedList[index].title!,
                                  style: textTheme.bodySmall,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
