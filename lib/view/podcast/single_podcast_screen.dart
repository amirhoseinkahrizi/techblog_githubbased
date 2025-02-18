import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog_githubbased/component/dimens.dart';
import 'package:techblog_githubbased/constante/my_colors.dart';
import 'package:techblog_githubbased/gen/assets.gen.dart';

class SinglePodcast extends StatelessWidget {
  const SinglePodcast({super.key});

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
                            imageUrl:
                                "https://www.soorban.com/images/news/2024/07/1721942003_R9kM7.jpg",
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
                      "عنوان پادکست",
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
                        "نام نویسنده",
                        style: textTheme.displayLarge,
                      )
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(18),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ImageIcon(
                                  Image.asset(Assets.icons.micpone.path).image,
                                  color: SolidColors.bluepen,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "عنوان پادکست",
                                  style: textTheme.displayMedium,
                                ),
                              ],
                            ),
                            Text(
                              "14:25",
                              style: textTheme.displayMedium,
                            )
                          ]),
                    );
                  },
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
                  )),
            ))
      ]),
    ));
  }
}
