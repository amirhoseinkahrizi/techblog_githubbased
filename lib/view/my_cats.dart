import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:techblog_githubbased/controller/home_screen_contoroller.dart';
import 'package:techblog_githubbased/gen/assets.gen.dart';
import 'package:techblog_githubbased/component/my_colors.dart';
import 'package:techblog_githubbased/component/my_component.dart';
import 'package:techblog_githubbased/component/my_string.dart';
import 'dart:developer';

import 'package:techblog_githubbased/models/facke_data.dart';

class Mycats extends StatefulWidget {
  const Mycats({super.key});

  @override
  State<Mycats> createState() => _MycatsState();
}

HomeScreenContoroler homeScreenContoroler =Get.put(homeScreenContoroler);
class _MycatsState extends State<Mycats> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double margine = size.width / 10;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: margine, right: margine),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  SvgPicture.asset(
                    Assets.images.techblogbot,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    MyStrings.ssuccesfullyfullregastraion,
                    style: textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextField(
                    style: textTheme.bodySmall,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        alignLabelWithHint: true,
                        hintText: "نام و نام خانوادگی"),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Text(
                    MyStrings.chossethecategoray,
                    style: textTheme.displaySmall,
                  ),
                  /////taglist
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      height: 85,
                      width: double.infinity,
                      child: GridView.builder(
                        itemCount: homeScreenContoroler.tagList.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          childAspectRatio: 0.2,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  if (!selectedtag.contains(taglist[index])) {
                                    selectedtag.add(taglist[index]);
                                  } else {
                                    log(
                                        "${selectedtag[index].title} is exist");
                                  }
                                });
                              },
                              child:
                                  MainTags(textTheme: textTheme, index: index));
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Assets.images.arrowDown.image(scale: 2),

                  SizedBox(
                      height: 85,
                      width: double.infinity,
                      child: GridView.builder(
                        itemCount: selectedtag.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          childAspectRatio: 0.2,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24)),
                                  color: SolidColors.scafoldColors),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(18, 8, 10, 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      selectedtag[index].title,
                                      style: textTheme.bodySmall,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedtag.removeAt(index);
                                          });
                                        },
                                        child: const Icon(
                                          CupertinoIcons.delete,
                                        ))
                                  ],
                                ),
                              ));
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
