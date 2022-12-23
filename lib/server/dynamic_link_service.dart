import 'dart:math';

import 'package:bluetup_inc/screens/splash.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DynamicLinks {
  final dynamicLink = FirebaseDynamicLinks.instance;
  final page = GetStorage();

  Future<void> handleDynamicLink() async {
    // 1. Get the initial dynamic link if the app is opened with a dynamic link
    final PendingDynamicLinkData? data = await dynamicLink.getInitialLink();
    if (data != null) {
      handleSuccessLinking(data);
    }

    dynamicLink.onLink.listen((dynamicLinkData) {
      handleSuccessLinking(dynamicLinkData);
      // Navigator.pushNamed(context, dynamicLinkData.link.path);
    }).onError((error) {
      debugPrint('onLink error');
      debugPrint(error.message);
    });
  }

  // METHOD TO CREATE NEW LINK
  Future createReferalLink() async {
    var referralCode = setRnd();
    final DynamicLinkParameters dynamicLinkParameters = DynamicLinkParameters(
      uriPrefix: 'https://bluetupinc.page.link',
      // longDynamicLink: Uri.parse(
      //   'https://reactnativefirebase.page.link/?efr=0&ibi=io.invertase.testing&apn=io.flutter.plugins.firebase.dynamiclinksexample&imv=0&amv=0&link=https%3A%2F%2Ftest-app%2Fhelloworld&ofl=https://ofl-example.com',
      // ),
      link: Uri.parse('https://bluetup.com/refer?code=$referralCode'),
      androidParameters: const AndroidParameters(
        packageName: 'com.bluetup.bluetup_inc',
        // minimumVersion: 0,
      ),
      // iosParameters: const IOSParameters(
      //   bundleId: 'io.invertase.testing',
      //   // minimumVersion: '0',
      // ),
    );

    final ShortDynamicLink shorty =
        await dynamicLink.buildShortLink(dynamicLinkParameters);
    final Uri dynamicUrl = shorty.shortUrl;
    // debugPrint(dynamicUrl.toString());

    return {dynamicUrl.toString(), referralCode};
  }

  void handleSuccessLinking(PendingDynamicLinkData data) {
    final Uri deepLink = data.link;

    if (deepLink.hasAbsolutePath) {
      var isRefer = deepLink.pathSegments.contains('refer');
      if (isRefer) {
        var code = deepLink.queryParameters['code'];
        if (code != null) {
          var codex = code;
          print(codex);
          var lini = deepLink.toString();
          //Take User to SignUp page
          page.write('isReferred', true);
          page.write("Link", lini);
          page.write("Code", codex);
          Get.to(() => Splasher());
        }
      }
    }
  }

  //Creating a random value for referral cod
  String setRnd() {
    var random = Random();
    var numberRnd = 'BTR${random.nextInt(10000)}';
    // print(numberRnd);
    return numberRnd;
  }
}









// Future handleDynamicLinks() async {
//   // 1. Get the initial dynamic link if the app is opened with a dynamic link
//   final PendingDynamicLinkData data =
//   await FirebaseDynamicLinks.instance.getInitialLink();
//
//   // 2. handle link that has been retrieved
//   _handleDeepLink(data);
//
//   // 3. Register a link callback to fire if the app is opened up from the background
//   // using a dynamic link.
//   FirebaseDynamicLinks.instance.onLink(
//       onSuccess: (PendingDynamicLinkData dynamicLink) async {
//         // 3a. handle link that has been retrieved
//         _handleDeepLink(dynamicLink);
//       }, onError: (OnLinkErrorException e) async {
//     print('Link Failed: ${e.message}');
//   });
// }