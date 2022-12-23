import 'dart:io';

import 'package:bluetup_inc/config/currency.dart';
import 'package:bluetup_inc/screens/sub-more/about.dart';
import 'package:bluetup_inc/screens/sub-more/how-to-use.dart';
import 'package:bluetup_inc/screens/sub-more/refer.dart';
import 'package:bluetup_inc/server/external_server.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../sub-more/contact.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  String currency = '';
  setCurry(val) {
    if (val) {
      setState(() {
        currency = 'USD';
      });
    } else {
      setState(() {
        currency = 'NGN';
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CurrencyPrefrence.getCurrencyPrefrence().then((value) => {setCurry(value)});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

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
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text('More'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: widthy,
                height: heighty / 6,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/advie.png'))),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  lizzty(
                      pix: SvgPicture.asset('assets/svg/share.svg'),
                      title: 'Refer & Earn',
                      tile: 1,
                      onClicked: () => Get.to(() => const ReferPage())),
                  lizzty(
                      pix: SvgPicture.asset('assets/svg/share.svg'),
                      title: 'Default Currency',
                      tile: 2,
                      curry: currency,
                      onClicked: () {
                        showActionSheet();
                      }),
                  lizzty(
                      pix: SvgPicture.asset('assets/svg/book.svg'),
                      title: 'How to use',
                      tile: 3,
                      onClicked: () => Get.to(() => const HowToUsePage())),
                  lizzty(
                      pix: SvgPicture.asset('assets/svg/building-2.svg'),
                      title: 'About us',
                      tile: 4,
                      onClicked: () => Get.to(() => const AboutPage())),

                  lizzty(
                    pix: SvgPicture.asset('assets/svg/message-square.svg'),
                    title: 'Contact Us',
                    tile: 5,
                    onClicked: () => Get.to(() => const ContactPage()),
                  ),
                  // lizzty(
                  //   pix: SvgPicture.asset(
                  //     'assets/svg/alert-circle.svg',
                  //     color: blueTup.tupBlue,
                  //   ),
                  //   title: 'Terms of use',
                  // ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svg/log-out.svg'),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: widthy / 22,
                      color: blueTup.tupBlue,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  lizzty(
      {required SvgPicture pix,
      required String title,
      required int tile,
      String? curry,
      VoidCallback? onClicked}) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onClicked,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
          trailing: tile == 2
              ? Text(
                  curry!,
                  style:
                      TextStyle(color: blueTup.tupBlue, fontSize: widthy / 25),
                )
              : Container(
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

  showActionSheet() {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;

    showCupertinoModalPopup(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CupertinoActionSheet(
            title: const Text('Select An Option'),
            // message: Text("This is message"),

            actions: <Widget>[
              CupertinoActionSheetAction(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: '\$',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: blueTup.tupBlue,
                          fontSize: widthy / 25),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Dollar',
                          style: TextStyle(
                              color: blueTup.tupBlue,
                              fontWeight: FontWeight.w400,
                              fontSize: widthy / 25),
                        ),
                      ]),
                ),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  // setState(() {
                  //   prefs.setBool('IsUSD', true);
                  // });
                  CurrencyPrefrence.setCurrencyPrefrence('usd');
                  CurrencyPrefrence.getCurrencyPrefrence()
                      .then((value) => {setCurry(value)});

                  Navigator.pop(context);
                },
              ),
              CupertinoActionSheetAction(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: '₦',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: blueTup.tupBlue,
                          fontSize: widthy / 25),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Naira',
                          style: TextStyle(
                              color: blueTup.tupBlue,
                              fontWeight: FontWeight.w400,
                              fontSize: widthy / 25),
                        ),
                      ]),
                ),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();

                  CurrencyPrefrence.setCurrencyPrefrence('ngn');
                  CurrencyPrefrence.getCurrencyPrefrence()
                      .then((value) => {setCurry(value)});
                  Navigator.pop(context);
                },
              )
            ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.pop(context, 'Cancel');
              },
            )));
  }
}
