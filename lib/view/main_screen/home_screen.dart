import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog_githubbased/controller/home_screen_contoroller.dart';
import 'package:techblog_githubbased/controller/single_article_contoroller.dart';
import 'package:techblog_githubbased/gen/assets.gen.dart';
import 'package:techblog_githubbased/component/my_colors.dart';
import 'package:techblog_githubbased/component/my_component.dart';
import 'package:techblog_githubbased/component/my_string.dart';
import 'package:techblog_githubbased/view/article_list_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodymargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodymargin;
  HomeScreenContoroler homeScreenContoroler = Get.put(HomeScreenContoroler());
  SingleArticleContoroller singleArticleContoroller =Get.put(SingleArticleContoroller());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Obx(
          () => Padding(
              padding: const EdgeInsets.all(0),
              child: homeScreenContoroler.loading == false.obs
                  ? Column(
                      children: [
                        ///poster
                        pagePoster(),
                        const SizedBox(
                          height: 35,
                        ),
                        tags(),
                        const SizedBox(
                          height: 32,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(ArticleListScreen(title: "مشاهده داغ ترین نوشته ها"));
                           },
                          child: SeeMoreBlog(
                              bodymargin: bodymargin, textTheme: textTheme),
                        ),
                        ////view hotest blog

                        topVisited(),
                        SeeMorePodcast(
                            bodymargin: bodymargin, textTheme: textTheme),
                        /////wiver hotest podcast
                        topPodcast(),
                        const SizedBox(
                          height: 65,
                        )
                      ],
                    )
                  : SizedBox(
                    height: Get.height,
                    child: const Center(child: loading()))),
        ),
      ),
    );
  }

  Widget pagePoster() {
    ////posterview
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
                imageUrl: homeScreenContoroler.poster.value.image!,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: size.height / 4.20,
                    width: size.width / 1.25,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                    foregroundDecoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        gradient: LinearGradient(
                            colors: Gradiant.postercovergradiant,
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)),
                  );
                })
          ],
        ),
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Text(
                homeScreenContoroler.poster.value.title!,
                style: textTheme.titleLarge,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenContoroler.topVisitedList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                singleArticleContoroller.getSimilarinfo(homeScreenContoroler.topVisitedList[index].id!);
              },
              child: Padding(
                padding: EdgeInsets.only(right: index == 0 ? bodymargin : 8),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: size.height / 5.0,
                            width: size.width / 2.2,
                            child: CachedNetworkImage(
                              imageUrl: homeScreenContoroler
                                  .topVisitedList[index].image!,
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(25),
                                      ),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill)),
                                  foregroundDecoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      gradient: LinearGradient(
                                          colors: Gradiant.blogpostgradiant,
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter)),
                                );
                              },
                              placeholder: (context, url) => const loading(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.image_not_supported_outlined),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 18,
                            left: 13,
                            right: 13,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  homeScreenContoroler
                                      .topVisitedList[index].author!,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                        homeScreenContoroler
                                            .topVisitedList[index].view!,
                                        style: textTheme.titleSmall),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Icon(
                                      Icons.remove_red_eye_sharp,
                                      color: Colors.white,
                                    ),
                                  ],
                                )
                              ],
                            ))
                      ],
                    ),
                    SizedBox(
                      width: size.width / 2.3,
                      child: Text(
                        homeScreenContoroler.topVisitedList[index].title!,
                        style: textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget topPodcast() {
    return SizedBox(
      height: size.height / 4.5,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenContoroler.topPodcast.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodymargin : 15),
              child: Column(
                children: [
                  SizedBox(
                      height: size.height / 6,
                      width: size.width / 3,
                      child: CachedNetworkImage(
                        imageUrl:
                            homeScreenContoroler.topPodcast[index].poster!,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(38),
                                ),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover)),
                          );
                        },
                        placeholder: (context, url) {
                          return const loading();
                        },
                        errorWidget: (context, url, error) {
                          return const Icon(
                            Icons.image_not_supported_outlined,
                            size: 50,
                            color: Colors.grey,
                          );
                        },
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: size.width / 3,
                    child: Center(
                      child: Text(
                        homeScreenContoroler.topPodcast[index].title!,
                        style: textTheme.displayMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  tags() {
    return SizedBox(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenContoroler.tagList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 8, index == 0 ? bodymargin : 10, 8),
              child: MainTags(
                textTheme: textTheme,
                index: index,
              ),
            );
          },
        ));
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    super.key,
    required this.bodymargin,
    required this.textTheme,
  });

  final double bodymargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, bodymargin, 30),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.podcastIcons.provider(),
            color: SolidColors.bluepen,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewhotestpodcast,
            style: textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    super.key,
    required this.bodymargin,
    required this.textTheme,
  });

  final double bodymargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodymargin, bottom: 15),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.bluepen.provider(),
            color: SolidColors.bluepen,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewhotestwrite,
            style: textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
