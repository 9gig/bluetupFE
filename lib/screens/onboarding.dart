import 'package:bluetup_inc/main.dart';
import 'package:bluetup_inc/models/onb.dart';
import 'package:bluetup_inc/screens/login.dart';
import 'package:bluetup_inc/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController(
    initialPage: 0,
  );

  int currentIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widthy = MediaQuery.of(context).size.width;
    final heighty = MediaQuery.of(context).size.height;
    const btnStyle = MaterialStateProperty.all;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          alignment: Alignment.center,
          height: heighty / 5,
          width: widthy,
          child: buildIndicators(context),
        ),
        centerTitle: true,
        actions: [
          if (currentIndex != onboarder.length - 1)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: InkWell(
                onTap: () => setState(() {
                  currentIndex = onboarder.length - 1;
                  _pageController.animateToPage(currentIndex,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                }),
                child: Text(
                  'skip',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: widthy / 23),
                  textAlign: TextAlign.center,
                ),
              ),
            )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Indicators
          SizedBox(
            height: heighty / 1.6,
            width: widthy,
            child: buildOnboardPage(),
          ),

          // buttons
          Column(
            children: [
              if (currentIndex == onboarder.length - 1)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => const SignUpPage());
                    },
                    style: ButtonStyle(
                      backgroundColor: btnStyle(blueTup.tupGreen),
                      //  elevation: btnStyle(4),
                      fixedSize: btnStyle(const Size(287, 52)),
                      shape: btnStyle(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: widthy / 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: TextButton(
                  onPressed: () {
                    if (currentIndex == onboarder.length - 1) {
                      Get.to(() => const LoginPage());
                    } else {
                      setState(() {
                        currentIndex++;
                      });

                      _pageController.animateToPage(currentIndex,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: btnStyle(blueTup.tupBlue),
                    //  elevation: btnStyle(4),
                    fixedSize: btnStyle(const Size(287, 52)),
                    shape: btnStyle(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
                  ),
                  child: Text(
                    currentIndex == onboarder.length - 1 ? 'Login' : 'Next',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: widthy / 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  buildIndicators(BuildContext ctx) {
    final widthy = MediaQuery.of(context).size.width;
    final heighty = MediaQuery.of(context).size.height;
    const btnStyle = MaterialStateProperty.all;
    return ListView.builder(
        itemCount: onboarder.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (ctx, i) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: currentIndex == i ? 15 : 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: currentIndex == i
                      ? blueTup.tupBlue
                      : blueTup.tupBlue.withOpacity(.2),
                ),
              )
            ],
          );
        });
  }

  buildOnboardPage() {
    final widthy = MediaQuery.of(context).size.width;
    final heighty = MediaQuery.of(context).size.height;
    const btnStyle = MaterialStateProperty.all;
    return PageView.builder(
        itemCount: onboarder.length,
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (_, i) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: SvgPicture.asset(onboarder[i].pix),
              ),
              Center(
                child: Text(
                  onboarder[i].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: widthy / 20),
                ),
              ),
              Center(
                child: Text(
                  onboarder[i].desc,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: blueTup.tupBlue.withOpacity(.5),
                      fontSize: widthy / 24),
                ),
              )
            ],
          );
        });
  }
}
