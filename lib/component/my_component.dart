import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog_githubbased/constante/my_constant.dart';
import 'package:techblog_githubbased/controller/home_screen_contoroller.dart';
import 'package:techblog_githubbased/controller/article/list_article_contoroller.dart';
import 'package:techblog_githubbased/gen/assets.gen.dart';
import 'package:techblog_githubbased/view/article/article_list_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constante/my_colors.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dvidercolor,
      thickness: 1.5,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

// ignore: must_be_immutable
class MainTags extends StatelessWidget {
  MainTags({
    super.key,
    required this.textTheme,
    required this.index,
  });

  final TextTheme textTheme;
  final index;

  HomeScreenContoroler homeScreenContoroler = Get.put(HomeScreenContoroler());
  ListArticleContoroller listArticleContoroller =
      Get.put(ListArticleContoroller());

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          gradient: LinearGradient(
              colors: Gradiant.tagsgradiant,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 8, 10, 8),
          child: Row(
            children: [
              ImageIcon(
                Assets.icons.hashtag.provider(),
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {
                  listArticleContoroller.getArticleListWithTagsId(
                      homeScreenContoroler.tagList[index].id!);
                  Get.to(ArticleListScreen(
                      title: homeScreenContoroler.tagList[index].title));
                },
                child: Text(
                  Get.find<HomeScreenContoroler>().tagList[index].title!,
                  style: textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ));
  }
}

myLuanchUrl(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    launchUrl(uri);
  }
}

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitCubeGrid(
      color: SolidColors.maincolor,
      size: 35,
    );
  }
}

PreferredSize appBar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(90),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: AppBar(
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Center(
                  child: Text(
                title,
                style: appBarTextStyle,
              )),
            )
          ],
          leading: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: SolidColors.maincolor.withBlue(100),
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: Colors.white,
                  )),
            ),
          )),
    ),
  );
}

class SeeMoreBlog extends StatelessWidget {
  SeeMoreBlog(
      {super.key,
      required this.bodymargin,
      required this.textTheme,
      required this.title});

  final double bodymargin;
  final TextTheme textTheme;
  String title;

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
            title,
            style: textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
