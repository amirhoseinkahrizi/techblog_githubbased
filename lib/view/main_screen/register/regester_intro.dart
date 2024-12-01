import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:techblog_githubbased/component/my_string.dart';
import 'package:techblog_githubbased/controller/register_contoroller.dart';
import 'package:techblog_githubbased/gen/assets.gen.dart';
import 'package:validators/validators.dart';
import 'dart:developer';

class RegsterIntro extends StatelessWidget {
   RegsterIntro({super.key});
  RegisterContoroller registerContoroller=Get.put(RegisterContoroller());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.techblogbot,
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RichText(
                text: TextSpan(
                  text: MyStrings.wellcome,
                  style: textTheme.displayMedium,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                onPressed: () {
                  _showEmailBottomSheet(context, size, textTheme);
                },
                child: const Text(
                  " بزن بریم",
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35)),
                color: Colors.white),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.insertyouremail,
                    style: textTheme.bodySmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TextField(
                      controller:registerContoroller.emailTextEditingController ,
                      onChanged: (value) {
                        log("your email is=${isEmail(value)}");
                      },
                      style: textTheme.bodySmall,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: "techblog@gmail.com",
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async{
                       registerContoroller.register();
                        Navigator.pop(context);
                        _activateCodeBottomSheet(context, size, textTheme);
                      },
                      child: const Text("ادامه"))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _activateCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35)),
                color: Colors.white),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.activatecode,
                    style: textTheme.bodySmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TextField(
                      controller: registerContoroller.activateCodeTextEditingController,
                      onChanged: (value) {
                       log("isNumeric${isNumeric(value)}") ;
                      },
                      style: textTheme.bodySmall,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: "******",
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: ()async {
                        // Navigator.of(context).pushReplacement(
                        //     MaterialPageRoute(builder: (context) {
                        //   return const Mycats();
                        // }));
                        registerContoroller.verify();
                      },
                      child: const Text("ادامه"))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
