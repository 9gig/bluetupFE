import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../main.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
        title: const Text('Contact'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Contact Info',
            style: TextStyle(
                color: blueTup.tupBlue,
                fontWeight: FontWeight.bold,
                fontSize: widthy / 22),
          ),
          //Lottie File
          // Center(
          //     child:
          //         Lottie.asset('assets/cont-anim.json', width: widthy / 1.8)),
          const SizedBox(
            height: 25,
          ),
          Text(
            'Bluetup HQ',
            style: TextStyle(
                color: blueTup.tupBlue,
                fontWeight: FontWeight.w600,
                fontSize: widthy / 22),
          ),

          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          text: 'No 13, \n',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: blueTup.tupBlue,
                              fontSize: widthy / 25),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Nkoro street close\n',
                              style: TextStyle(
                                  color: blueTup.tupBlue,
                                  fontWeight: FontWeight.w400,
                                  fontSize: widthy / 25),
                            ),
                            TextSpan(
                              text: 'IIupeju lagos State\n',
                              style: TextStyle(
                                  color: blueTup.tupBlue,
                                  fontWeight: FontWeight.w400,
                                  fontSize: widthy / 25),
                            ),
                            TextSpan(
                              text: 'Nigeria ',
                              style: TextStyle(
                                  color: blueTup.tupBlue,
                                  fontWeight: FontWeight.w400,
                                  fontSize: widthy / 25),
                            ),
                          ]),
                    ),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          text: 'Support@bluetup.com\n',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: blueTup.tupBlue,
                              fontSize: widthy / 25),
                          children: <TextSpan>[
                            TextSpan(
                              text: '+234 (0) 901 7001 234\n',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: blueTup.tupBlue,
                                  fontWeight: FontWeight.w400,
                                  fontSize: widthy / 25),
                            ),
                            TextSpan(
                              text: '+234 (0) 901 7001 234',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: blueTup.tupBlue,
                                  fontWeight: FontWeight.w400,
                                  fontSize: widthy / 25),
                            ),
                          ]),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          lizzty(
            pix: SvgPicture.asset('assets/svg/fbie.svg'),
            title: 'Facebook Page',
          ),
          lizzty(
            pix: SvgPicture.asset('assets/svg/tweetie.svg'),
            title: 'Twitter Page',
          ),
          lizzty(
            pix: SvgPicture.asset('assets/svg/instie.svg'),
            title: 'Instagram Page',
          ),
        ]),
      )),
    ));
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
}
