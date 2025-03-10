import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog_githubbased/component/dimens.dart';
import 'package:techblog_githubbased/component/my_component.dart';
import 'package:techblog_githubbased/constante/my_colors.dart';
import 'package:techblog_githubbased/controller/podcast/single_podcast_contoroller.dart';
import 'package:techblog_githubbased/gen/assets.gen.dart';
import 'package:techblog_githubbased/models/podcast_model.dart';

class SinglePodcast extends StatelessWidget {
  late SinglePodcastContoroller singlePodcastContoroller;
  late PodcastModel podcastModel;

  SinglePodcast({super.key}) {
    podcastModel = Get.arguments;
    singlePodcastContoroller =
        Get.put(SinglePodcastContoroller(id: podcastModel.id));
  }
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: Get.height / 3,
                          width: double.maxFinite,
                          child: CachedNetworkImage(
                            errorWidget: (context, url, error) => Icon(
                              Icons.image_not_supported_outlined,
                              size: Get.height / 4,
                            ),
                            placeholder: (context, url) => const Loading(),
                            imageUrl: podcastModel.poster!,
                            imageBuilder: (context, imageProvider) {
                              return Image(
                                image: imageProvider,
                                fit: BoxFit.fill,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: Get.height / 30,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: Gradiant.postercovergradiant,
                            begin: AlignmentDirectional.topStart,
                            end: Alignment.bottomCenter),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: const Icon(
                            Icons.arrow_back_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        const Icon(
                          Icons.bookmark_outline,
                          color: Colors.white,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.share_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      podcastModel.title!,
                      style: textTheme.displayLarge,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Image(
                        image: Image.asset(
                          Assets.images.avatarscreen.path,
                          scale: 6,
                        ).image,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        podcastModel.author!,
                        style: textTheme.displayLarge,
                      )
                    ],
                  ),
                ),
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: singlePodcastContoroller.podcastfilelist.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(18),
                        child: GestureDetector(
                          onTap: () {
                            singlePodcastContoroller.player
                                .seek(Duration.zero, index: index);
                            singlePodcastContoroller.selectedIndex.value =
                                singlePodcastContoroller.player.currentIndex!;
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ImageIcon(
                                      Image.asset(Assets.icons.micpone.path)
                                          .image,
                                      color: SolidColors.bluepen,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Obx(
                                      () => SizedBox(
                                        width: Get.width / 1.5,
                                        child: Text(
                                          singlePodcastContoroller
                                              .podcastfilelist[index].title!,
                                          style: singlePodcastContoroller
                                                      .selectedIndex.value ==
                                                  index
                                              ? textTheme.displayLarge
                                              : textTheme.displayMedium,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  singlePodcastContoroller
                                      .podcastfilelist[index].length!,
                                  style: textTheme.displayMedium,
                                )
                              ]),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 8,
            right: 8,
            left: 8,
            child: Container(
              height: Get.height / 7,
              width: Dimens.bodyMargin,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(35)),
                gradient: LinearGradient(
                  colors: Gradiant.bottemnav,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const LinearProgressIndicator(
                      backgroundColor: Colors.white,
                      color: Colors.orangeAccent,
                      value: 0.4,
                      minHeight: 9.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            singlePodcastContoroller.player.seekToNext();
                          },
                          child: const Icon(
                            Icons.skip_next_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            singlePodcastContoroller.playstatus.value == false
                                ? singlePodcastContoroller.player.play()
                                : singlePodcastContoroller.player.pause();
                            singlePodcastContoroller.playstatus.value =
                                singlePodcastContoroller.player.playing;
                            singlePodcastContoroller.selectedIndex.value =
                                singlePodcastContoroller.player.currentIndex!;
                          },
                          child: Obx(() => Icon(
                                singlePodcastContoroller.playstatus.value ==
                                        false
                                    ? Icons.play_circle_fill_rounded
                                    : Icons.pause_circle_filled,
                                color: Colors.white,
                                size: 40,
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            singlePodcastContoroller.player.seekToPrevious();
                            singlePodcastContoroller.selectedIndex.value =
                                singlePodcastContoroller.player.currentIndex!;
                          },
                          child: const Icon(
                            Icons.skip_previous_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        const SizedBox(),
                        const Icon(
                          Icons.repeat,
                          color: Colors.white,
                          size: 40,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ))
      ]),
    ));
  }
}
