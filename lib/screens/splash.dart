import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bluetup_inc/main.dart';
// import 'package:bluetup_inc/screens/login.dart';
// import 'package:bluetup_inc/screens/main/major.dart';
import 'package:bluetup_inc/screens/onboarding.dart';
import 'package:bluetup_inc/screens/signup.dart';
import 'package:bluetup_inc/server/dynamic_link_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:get_storage/get_storage.dart';

class Splasher extends StatefulWidget {
   const Splasher({Key? key}) : super(key: key);

  @override
  State<Splasher> createState() => _SplasherState();
}

class _SplasherState extends State<Splasher> {
  // _check_token() async {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DynamicLinks().handleDynamicLink();
    print(page.read('Code'));
  }
  var page = GetStorage();

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: blueTup.tupBlue,
      animationDuration: const Duration(milliseconds: 1200),
      splashTransition: SplashTransition.fadeTransition,
      splash: SvgPicture.asset('assets/svg/splash.svg'),
      nextScreen: page.read('isReferred') == true? SignUpPage():OnboardingScreen(),
    );
  }
}
