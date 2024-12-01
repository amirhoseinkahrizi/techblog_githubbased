import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog_githubbased/component/api_constant.dart';
import 'package:techblog_githubbased/component/storage_const.dart';
import 'package:techblog_githubbased/servisec/dio_services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog_githubbased/view/main_screen/main_screen.dart';

class RegisterContoroller extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activateCodeTextEditingController =
      TextEditingController();

  var email = "";
  var userId = "";

  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };

    var response =
        await DioServices().postMethod(map, ApiConstant.postRegister);

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
        await DioServices().postMethod(map, ApiConstant.postRegister);
    log("respone ${response.data.toString()}");

    var box = GetStorage();
    if (response.data['response'] == 'verified') {
      box.write(token, response.data['token']);
      box.write(userId, response.data['user_id']);
      Get.to(MainScreen());
    } else {
      print("error");
    }

    log("read:::${box.read(token)}");
log("read:::${box.read(userId)}");  }
}
