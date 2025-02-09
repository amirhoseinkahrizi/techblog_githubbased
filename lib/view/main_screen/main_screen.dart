import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:techblog_githubbased/constante/my_colors.dart';
import 'package:techblog_githubbased/component/my_component.dart';
import 'package:techblog_githubbased/constante/my_string.dart';
import 'package:techblog_githubbased/controller/register_contoroller.dart';
import 'package:techblog_githubbased/gen/assets.gen.dart';
import 'package:techblog_githubbased/view/main_screen/home_screen.dart';
import 'package:techblog_githubbased/view/main_screen/profile_screen.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  RxInt selectedindex = 0.obs;

  MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodymargin = size.width / 10;

    return Scaffold(
      key: _key,
      drawer: Drawer(
        backgroundColor: SolidColors.scafoldColors,
        child: Padding(
          padding: EdgeInsets.only(left: bodymargin, right: bodymargin),
          child: ListView(
            children: [
              DrawerHeader(
                  child: Center(
                      child: Image.asset(
                Assets.images.logo.path,
                scale: 3,
              ))),
              ListTile(
                title: Text(
                  "پروفایل کاربری",
                  style: textTheme.bodySmall,
                ),
              ),
              const Divider(
                color: SolidColors.dvidercolor,
              ),
              ListTile(
                title: Text(
                  "درباره تک‌بلاگ",
                  style: textTheme.bodySmall,
                ),
                onTap: () {
                  myLuanchUrl(MyStrings.techblogUrlGithub);
                },
              ),
              const Divider(
                color: SolidColors.dvidercolor,
              ),
              ListTile(
                title: Text(
                  "اشتراک گذاری تک بلاگ",
                  style: textTheme.bodySmall,
                ),
                onTap: () async {
                  await Share.share(MyStrings.share);
                },
              ),
              const Divider(
                color: SolidColors.dvidercolor,
              ),
              ListTile(
                title: Text(
                  "تک‌بلاگ در گیت هاب",
                  style: textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: SolidColors.scafoldColors,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                _key.currentState!.openDrawer();
              },
              child: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            Assets.images.logo
                .image(height: size.height / 13.63, width: size.width / 3.73),
            const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: Obx(
            () => IndexedStack(
              index: selectedindex.value,
              children: [
                HomeScreen(
                    size: size, textTheme: textTheme, bodymargin: bodymargin),
                ProfileScreen(
                    size: size, textTheme: textTheme, bodymargin: bodymargin)
              ],
            ),
          )),

          ////bottomnavigation
          BottomNavigationBotton(
            size: size,
            bodymargin: bodymargin,
            changeScreen: (int value) {
              selectedindex.value = value;
            },
          ),
        ],
      ),
    );
  }
}

class BottomNavigationBotton extends StatelessWidget {
  const BottomNavigationBotton({
    super.key,
    required this.size,
    required this.bodymargin,
    required this.changeScreen,
  });

  final Size size;
  final double bodymargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            gradient: LinearGradient(
              colors: Gradiant.bottomnavigationgradiantback,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        child: Padding(
          padding: EdgeInsets.only(
              right: bodymargin, left: bodymargin, top: 8, bottom: 8),
          child: Container(
            width: size.width / 1,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                gradient: LinearGradient(colors: Gradiant.bottemnav)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () => changeScreen(0),
                    icon: ImageIcon(
                      Assets.icons.homeIcon.provider(),
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      Get.find<RegisterContoroller>().toggleLogin();
                    },
                    icon: ImageIcon(
                      Assets.icons.write.provider(),
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () => changeScreen(1),
                    icon: ImageIcon(
                      Assets.icons.user.provider(),
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
