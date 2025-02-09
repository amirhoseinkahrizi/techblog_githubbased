import 'package:flutter/material.dart';
import 'package:techblog_githubbased/gen/assets.gen.dart';

import 'package:techblog_githubbased/constante/my_colors.dart';
import 'package:techblog_githubbased/constante/my_string.dart';
import 'package:techblog_githubbased/component/my_component.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodymargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodymargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: Assets.images.avatarscreen.provider(),
              width: 90,
              height: 90,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  Assets.icons.bluepen.provider(),
                  color: SolidColors.bluepen,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  MyStrings.editprofileimage,
                  style: textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              "فاطمه امیری",
              style: textTheme.displayMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "fatemehamiri@gmail.com",
              style: textTheme.displayMedium,
            ),
            const SizedBox(
              height: 40,
            ),
            TechDivider(size: size),
            SizedBox(
              height: 45,
              child: InkWell(
                splashColor: SolidColors.maincolor,
                onTap: () {},
                child: Center(
                  child: Text(
                    MyStrings.myfavarateartile,
                    style: textTheme.displayMedium,
                  ),
                ),
              ),
            ),
            TechDivider(size: size),
            SizedBox(
              height: 45,
              child: InkWell(
                splashColor: SolidColors.maincolor,
                onTap: () {},
                child: Center(
                  child: Text(
                    MyStrings.myfavepodcast,
                    style: textTheme.displayMedium,
                  ),
                ),
              ),
            ),
            TechDivider(size: size),
            SizedBox(
              height: 45,
              child: InkWell(
                splashColor: SolidColors.maincolor,
                onTap: () {},
                child: Center(
                  child: Text(
                    MyStrings.logout,
                    style: textTheme.displayMedium,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
