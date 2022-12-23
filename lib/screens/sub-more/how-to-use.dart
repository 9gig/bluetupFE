import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../main.dart';

class HowToUsePage extends StatefulWidget {
  const HowToUsePage({Key? key}) : super(key: key);

  @override
  State<HowToUsePage> createState() => _HowToUsePageState();
}

class _HowToUsePageState extends State<HowToUsePage> {
  @override
  Widget build(BuildContext context) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff8f9fb),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: blueTup.tupBlue,
          elevation: 0,
          leading: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () => Get.back(),
              child: SvgPicture.asset(
                'assets/svg/arrow-left.svg',
              ),
            ),
          ),
          leadingWidth: widthy / 7,
          title: const Text('How to use'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Center(
                  child: SvgPicture.asset('assets/svg/faqie.svg'),
                ),
                Text(
                  'Learn more about safe and smart\ninvesting with Bluetup',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: blueTup.tupBlue),
                ),
                const SizedBox(
                  height: 25,
                ),
                lizzty(
                  pix: SvgPicture.asset('assets/svg/help-circle.svg'),
                  title: 'Frequently asked Questions',
                ),
                lizzty(
                    pix: SvgPicture.asset('assets/svg/percent.svg'),
                    title: 'Rates and Charges',
                    onClicked: () => _showBottomSheet()),
                lizzty(
                  pix: SvgPicture.asset('assets/svg/alert-svg.svg'),
                  title: 'Privacy Policy',
                ),
                lizzty(
                  pix: SvgPicture.asset('assets/svg/alert-svg.svg'),
                  title: 'End User Agreement',
                ),
                lizzty(
                  pix: SvgPicture.asset('assets/svg/alert-svg.svg'),
                  title: 'Terms of Use',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  lizzty(
      {required SvgPicture pix,
      required String title,
      VoidCallback? onClicked}) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onClicked,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        width: widthy,
        height: heighty / 13,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              color: const Color.fromARGB(255, 0, 4, 29).withOpacity(.05),
              // spreadRadius: .8,
              spreadRadius: 1,
              offset: const Offset(0, 0),
            )
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: ListTile(
          onTap: onClicked,
          leading: pix,
          title: Text(title),
          trailing: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: blueTup.tupBlue.withOpacity(.15),
                shape: BoxShape.circle),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: blueTup.tupBlue,
              size: 15,
            ),
          ),
        ),
      ),
    );
  }

  _showBottomSheet() {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return showModalBottomSheet(

        // constraints: BoxConstraints.tight(Size(widthy, heighty / 8)),
        shape: const RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15.0),
          ),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset('assets/svg/xtr.svg'),
                    ),
                  ),
                  Text(
                    'Our rates and charges',
                    style: TextStyle(
                        color: blueTup.tupBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: widthy / 22),
                  ),
                  Text(
                    'Our current rates and charges across all our\nsaving and investment products, updated daily.',
                    style: TextStyle(
                        color: blueTup.tupBlue,
                        fontWeight: FontWeight.w400,
                        fontSize: widthy / 22),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  buildRate(
                    pix: 'assets/svg/vaulie.svg',
                    title: 'Blue Vault',
                    subtitle: '15% per annum',
                  ),
                  buildRate(
                    pix: 'assets/svg/piggy.svg',
                    title: 'Tup Dollar',
                    subtitle: '10% per annum',
                  ),
                  buildRate(
                    pix: 'assets/svg/muus.svg',
                    title: 'Flexy Naira',
                    subtitle: '9% per annum',
                  ),
                ],
              ),
            ),
          );
        });
  }

  buildRate({
    required String pix,
    required String title,
    required String subtitle,
  }) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.only(bottom: 10),
        width: widthy,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: blueTup.tupBlue.withOpacity(.7)),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              color: const Color.fromARGB(255, 0, 4, 29).withOpacity(.05),
              // spreadRadius: .8,
              spreadRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(pix),
            const SizedBox(
              width: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: blueTup.tupBlue,
                      fontSize: widthy / 20,
                      fontWeight: FontWeight.w500),
                ),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: 'interest Rates:',
                      style: TextStyle(
                          color: blueTup.tupBlue.withOpacity(.7),
                          fontSize: widthy / 27,
                          fontWeight: FontWeight.w500),
                      children: <TextSpan>[
                        TextSpan(
                          text: subtitle,
                          style: TextStyle(
                              color: blueTup.tupBlue,
                              fontWeight: FontWeight.w500,
                              fontSize: widthy / 27),
                        ),
                      ]),
                ),
              ],
            )
          ],
        ));
  }
}
