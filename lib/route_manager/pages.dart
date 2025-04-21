import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:techblog_githubbased/route_manager/binding.dart';
import 'package:techblog_githubbased/route_manager/names.dart';
import 'package:techblog_githubbased/view/article/manage_article.dart';
import 'package:techblog_githubbased/view/article/manage_single_article_screen.dart';
import 'package:techblog_githubbased/view/article/single_screen.dart';
import 'package:techblog_githubbased/view/main_screen/main_screen.dart';
import 'package:techblog_githubbased/view/podcast/single_podcast_screen.dart';
import 'package:techblog_githubbased/view/splashscreen.dart';

class Pages {
  Pages._();
  static List<GetPage> pages = [
    GetPage(name: NamedRoute.routeinitialRoute, page:()=> const SplashScreen(),),
          GetPage(
              name: NamedRoute.routeMainScreen,
              page: () => MainScreen(),
              binding: Registerbinding()),
          GetPage(
              name: NamedRoute.routesingleArticle,
              page: () => SingleScreen(),
              binding: Articlebinding()),
          GetPage(
              name: NamedRoute.routemanagearticle,
              page: () => ManageArticle(),
              binding: ArticleManagerbinding()),
          GetPage(
              name: NamedRoute.routemanagesinglearticle,
              page: () => ManageSingleArticleScreen(),
              binding: ArticleManagerbinding()),
          GetPage(
              name: NamedRoute.routesinglepadcast, page: () => SinglePodcast())
        ];
}