import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:techblog_githubbased/constante/api_constant.dart';
import 'package:techblog_githubbased/constante/my_string.dart';
import 'package:techblog_githubbased/constante/storage_const.dart';
import 'package:techblog_githubbased/gen/assets.gen.dart';
import 'package:techblog_githubbased/main.dart';
import 'package:techblog_githubbased/servisec/dio_services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog_githubbased/view/main_screen/main_screen.dart';
import 'package:techblog_githubbased/view/main_screen/register/regester_intro.dart';

class RegisterContoroller extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activateCodeTextEditingController =
      TextEditingController();

  var email = "";
  var userId = "";
  var box = GetStorage();

  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };

    var response =
        await DioServices().postMethod(map, ApiUrlConstant.postRegister);

    email = emailTextEditingController.text;
    userId = response.data['user_id'];

    log("response Data ${response.data.toString()}");
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activateCodeTextEditingController.text,
      'command': 'verify'
    };

    var response =
        await DioServices().postMethod(map, ApiUrlConstant.postRegister);
    log("respone ${response.data.toString()}");

    var status = response.data['response'];
    switch (status) {
      case 'verified':
        box.write(StoraegKey().token, response.data['token']);
        box.write(StoraegKey().userId, response.data['user_id']);
        box.read("UserId$userId");
        box.read("token${StoraegKey().token}");
        Get.snackbar("وضعیت فعال سازی", "کد فعال سازی تایید شد");
        Get.offAll(MainScreen());
        break;
      case 'false':
        Get.snackbar("وضعیت فعال سازی", "کد فعال سازی اشتباه است");
        break;
      case 'expired':
        Get.snackbar("وضعیت فعال سازی", "کد فعال سازی منقضی شده است");
        break;
    }

    log("read:::${box.read(StoraegKey().token)}");
    log("read:::${box.read(userId)}");
  }

  toggleLogin() {
    if (GetStorage().read(StoraegKey().token) == null) {
      Get.to(RegsterIntro());
    } else {
      goToWriteBottemSheet();
      // Get.to(MainScreen());
      // Get.snackbar("وضعیت ثبت نام", "شما قبلا ثبت نام کرده اید",
      //     animationDuration: Duration(seconds: 5),
      //     isDismissible: true,
      //     dismissDirection: DismissDirection.horizontal,
      //     backgroundColor: SolidColors.buttencolots,
      //     colorText: Colors.white);
    }
  }

  goToWriteBottemSheet() {
    Get.bottomSheet(Container(
      height: Get.height / 3.2,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  Assets.icons.techBot,
                  height: 40,
                ),
                SizedBox(
                  width: 30,
                  height: Get.height / 60,
                ),
                const Text(
                  MyStrings.techbot,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            const Text(
              MyStrings.bottomsheetdescription,
              softWrap: false,
              style: TextStyle(color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(NamedRoute.routemanagearticle),
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.icons.writeIcons,
                          height: 40,
                        ),
                        const Text(
                          MyStrings.articleManegment,
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 150,
                ),
                GestureDetector(
                  onTap: () => Get.snackbar("سلام", "می رینی؟"),
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.icons.microphoneIcons,
                          height: 50,
                        ),
                        const Text(
                          MyStrings.podCastManegment,
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
