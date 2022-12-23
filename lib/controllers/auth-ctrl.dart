import 'dart:convert';

import 'package:bluetup_inc/main.dart';
import 'package:bluetup_inc/models/createRef.dart';
import 'package:bluetup_inc/models/getOtp.dart';
import 'package:bluetup_inc/models/log_req.dart';
import 'package:bluetup_inc/models/login_res.dart';
import 'package:bluetup_inc/models/register.dart';
import 'package:bluetup_inc/screens/main/major.dart';
import 'package:bluetup_inc/server/dynamic_link_service.dart';
import 'package:bluetup_inc/server/remote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignUpController extends GetxController {
  final isLoading = false.obs;
  final uID = ''.obs;
  final page = GetStorage();

  Future<bool> fetchCode(GetOtp phone) async {
    try {
      isLoading(true);
      var response = await RemoteService.getCode(phone);
      if (response) {
        return true;
      } else {
        return false;
      }
    } finally {
      isLoading(false);
    }
  }

  //Register new user
  Future<String> register(RegisterModel mod) async {
    try {
      isLoading(true);
      var response = await RemoteService.register(mod);
      if (response.message == 'success' ) {
        uID.value = response.data.uId;
        var link = await DynamicLinks().createReferalLink();
        final  fL= {
          "userId": uID.value,
          "link": link.first,
          "code": link.last
        };
        var cRez = await RemoteService.createRef(fL);
        if(page.read('isReferred') && cRez.message == 'success'){
        print ( page.read('Code'));
          var adL= {
            "userId": uID.value,
            "refree":  page.read('Code'),

          };
         var addRez = await RemoteService.addRef(adL);
         return addRez.message;
        }else{

        return cRez.message;
        }

      } else {
        return jsonDecode(response.message);
      }
    } finally {
      isLoading(false);
    }
  }
}

class LoginController extends GetxController {
  final isLoading = false.obs;
  // final u = await loginResponseFromJson(jsonDecode(GetStorage().read('User')));

  LoginResponse readUser() {
    return loginResponseFromJson(jsonDecode(GetStorage().read('User')));
  }

  Future login(LoginReq model) async {
    try {
      isLoading(true);
      var logged = await RemoteService.logIn(model);
      if (logged) {
        // Get.snackbar('Success', 'welcome ' + readUser().data.firstName,
        //     colorText: Colors.white,
        //     borderRadius: 5,
        //     backgroundColor: blueTup.tupGreen,
        //     margin: const EdgeInsets.all(10));
        Get.to(() => const MajorPage());
      } else {
        Get.snackbar('Login Error',
            'Some fields have erorr, please check them and try again',
            colorText: Colors.white,
            borderRadius: 5,
            backgroundColor: Colors.red,
            margin: const EdgeInsets.all(10));
      }
    } finally {
      isLoading(false);
    }
  }
}
