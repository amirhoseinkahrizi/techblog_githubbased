import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog_githubbased/component/api_constant.dart';
import 'package:techblog_githubbased/servisec/dio_services.dart';

class RegisterContoroller extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activateCodeTextEditingController =
      TextEditingController();

  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };

    var response =
        await DioServices().postMethod(map, ApiConstant.postRegister);

    log("response Data ${response.data.toString()}");

    
  }
}
