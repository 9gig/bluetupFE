import 'dart:convert';

import 'package:bluetup_inc/config/currency.dart';
import 'package:bluetup_inc/config/payments/paystack_config.dart';
import 'package:bluetup_inc/controllers/auth-ctrl.dart';
import 'package:bluetup_inc/controllers/home-ctrl.dart';
import 'package:bluetup_inc/main.dart';
import 'package:bluetup_inc/models/actions.dart';
import 'package:bluetup_inc/screens/sub-savings/challengeUI.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/login_res.dart';
import '../../widgets/dd.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CurrencyFormatterSettings symbol = CurrencyFormatterSettings.ngn;
  var symb = '';
  bool atDolz = false;
  setCurry(val) {
    if (val) {
      setState(() {
        symbol = CurrencyFormatterSettings.usd;
        atDolz = true;
        symb = '\$';
      });
    } else {
      setState(() {
        symbol = CurrencyFormatterSettings.ngn;
        atDolz = false;
        symb = '₦';
      });
    }
  }

  rated(String vm) {
    var vB = int.parse(vm);
    int rate = 710;
    var result = vB / rate;
    return result;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CurrencyPrefrence.getCurrencyPrefrence().then((value) => setCurry(value));
  }

  final HomeCtrl homeCtrl = Get.put(HomeCtrl());
  int curIn = 0;

  List<String> title = [
    "Total Balance",
    "Total Savings",
    "Total Investment",
  ];
  bool isObs = true;

  final userData = loginResponseFromJson(jsonDecode(GetStorage().read('User')));

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
            elevation: 0,
            leading: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset(
                'assets/svg/clLogo.svg',
                fit: BoxFit.fitHeight,
              ),
            ),
            leadingWidth: widthy / 4,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_outlined,
                    color: blueTup.tupBlue,
                    size: 26,
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Intro
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: 'Hello, ',
                                    style: TextStyle(
                                        color: blueTup.tupBlue,
                                        fontSize: widthy / 22),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: userData.data.firstName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: blueTup.tupBlue,
                                            fontSize: widthy / 22),
                                      ),
                                    ]),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Smart Investing made easy',
                                style: TextStyle(
                                    color: blueTup.tupBlue,
                                    fontSize: widthy / 27),
                              )
                            ],
                          ),
                          CircleAvatar(
                            backgroundColor: blueTup.tupBlue,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //Cards For wallet and balances
                    buildWallets(),

                    Container(
                      width: widthy,
                      height: heighty / 20,
                      padding: EdgeInsets.symmetric(horizontal: widthy/ 2.5),
                      child: ListView.builder(
                          itemCount: title.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, i) => Container(
                                width: 10,
                                height: 10,
                                margin: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: i == curIn
                                        ? blueTup.tupBlue
                                        : Colors.transparent,
                                    border: Border.all(
                                        color: blueTup.tupBlue, width: 1.2)),
                              )),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: heighty / 8,
                      child: SingleChildScrollView(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: heighty / 10.5,
                                  width: widthy / 5.5,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3.0,
                                        color:
                                            const Color.fromARGB(255, 0, 4, 29)
                                                .withOpacity(.05),
                                        // spreadRadius: .8,
                                        spreadRadius: 1,
                                        offset: const Offset(0, 0),
                                      )
                                    ],
                                  ),
                                  child: SvgPicture.asset(
                                      'assets/svg/airtime.svg')),
                              Container(
                                  height: heighty / 10.5,
                                  width: widthy / 5.5,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3.0,
                                        color:
                                            const Color.fromARGB(255, 0, 4, 29)
                                                .withOpacity(.05),
                                        // spreadRadius: .8,
                                        spreadRadius: 1,
                                        offset: const Offset(0, 0),
                                      )
                                    ],
                                  ),
                                  child:
                                      SvgPicture.asset('assets/svg/data.svg')),
                              Container(
                                  height: heighty / 10.5,
                                  width: widthy / 5.5,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3.0,
                                        color:
                                            const Color.fromARGB(255, 0, 4, 29)
                                                .withOpacity(.05),
                                        // spreadRadius: .8,
                                        spreadRadius: 1,
                                        offset: const Offset(0, 0),
                                      )
                                    ],
                                  ),
                                  child: SvgPicture.asset(
                                      'assets/svg/cable tv.svg')),
                              Container(
                                  height: heighty / 10.5,
                                  width: widthy / 5.5,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3.0,
                                        color:
                                            const Color.fromARGB(255, 0, 4, 29)
                                                .withOpacity(.05),
                                        // spreadRadius: .8,
                                        spreadRadius: 1,
                                        offset: const Offset(0, 0),
                                      )
                                    ],
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/svg/internet.svg',
                                  )),
                            ]),
                      ),
                    ),

                    Container(
                      height: heighty / 7,
                      width: widthy,
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: const Color.fromARGB(255, 0, 4, 29)
                                .withOpacity(.05),
                            // spreadRadius: .8,
                            spreadRadius: 1,
                            offset: const Offset(0, 0),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Get Started Saving ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: widthy / 25),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text('Save for rainny days, with',
                                  style: TextStyle(
                                      color: blueTup.tupBlue.withOpacity(.5),
                                      fontWeight: FontWeight.w400,
                                      fontSize: widthy / 28)),
                              Text(
                                'Tup Naira or Tup Dollar',
                                style: TextStyle(
                                    color: blueTup.tupBlue.withOpacity(.5),
                                    fontWeight: FontWeight.w400,
                                    fontSize: widthy / 28),
                              )
                            ],
                          ),
                          SvgPicture.asset('assets/svg/mbag.svg')
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.only(top: 20, bottom: 5),
                      child: Text(
                        'Quick Actions',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: widthy / 25),
                      ),
                    ),
                    _quickie(context),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.only(top: 20, bottom: 5),
                      child: Text(
                        'Saving Challenge',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: widthy / 25),
                      ),
                    ),
                    Container(
                      width: widthy,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildMili(
                              onClicked: () {
                                // print('dfg');
                                Get.to(() => Challenge());
                              },
                              image: 'assets/images/mili.png',
                              title: 'Join the Millionairs club 💸',
                              desc:
                                  'Join million of poeple saving and grow you wealth with ......'),
                          buildMili(
                              onClicked: () {
                                // print('dfg');
                              },
                              image: 'assets/images/jolly.png',
                              title: '#Xmas Jolly',
                              desc:
                                  'Save for the festive season and get iterest on your savings....'),
                        ],
                      ),
                    ),

                    // Container(
                    //   padding: const EdgeInsets.all(10),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         'Trending Now',
                    //         style: TextStyle(fontSize: widthy / 20),
                    //       ),
                    //       const SizedBox(
                    //         height: 10,
                    //       ),
                    //       SizedBox(
                    //         width: widthy,
                    //         height: heighty / 5.8,
                    //         child: ListView.builder(
                    //           itemCount: 4,
                    //           scrollDirection: Axis.horizontal,
                    //           itemBuilder: (_, i) => buildBlog(
                    //               caption:
                    //                   'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia ... ',
                    //               onClicked: () {}),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),

                    Container(
                      width: widthy,
                      height: heighty / 6,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/advie.png'))),
                    ),
                  ]),
            ),
          )),
    );
  }

  Widget _quickie(BuildContext context) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: quickieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 3.0,
                  color: const Color.fromARGB(255, 0, 4, 29).withOpacity(.05),
                  // spreadRadius: .8,
                  spreadRadius: 1,
                  offset: const Offset(0, 0),
                )
              ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(quickieList[index].pix),
                  RichText(
                    text: TextSpan(
                        text: quickieList[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: blueTup.tupBlue,
                            fontSize: widthy / 25),
                        children: <TextSpan>[
                          TextSpan(
                            text: quickieList[index].desc,
                            style: TextStyle(
                                color: blueTup.tupBlue.withOpacity(.5),
                                fontWeight: FontWeight.w400,
                                fontSize: widthy / 30),
                          ),
                        ]),
                  ),
                ],
              ),
            );
          }),
    );
  }

  buildWallets() {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;

    _showIndicator() {
      return Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          height: heighty / 30,
          width: widthy / 10,
          child: CircularProgressIndicator(
            color: blueTup.tupYellow,
            strokeWidth: 2.0,
          ),
        ),
      );
    }

    _amt(String amm) {
      if (amm == '') {
        return CurrencyFormatter.format(0.00, symbol);
      } else {
        return CurrencyFormatter.format(amm, symbol);
      }
    }

    return SizedBox(
      width: widthy,
      height: heighty / 5,
      child: PageView.builder(
          itemCount: wallie.length,
          onPageChanged: (value) {
            setState(() {
              curIn = value;
            });
          },
          itemBuilder: (_, i) => Obx(() {
                return Container(
                  height: heighty / 6,
                  width: widthy,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(i <= 1
                              ? 'assets/images/Savings.png'
                              : 'assets/images/Total investment.png'),
                          fit: BoxFit.fitWidth)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            wallie[i].type,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                isObs
                                    ? '${symb} *****'
                                    : i == 0
                                        ? _amt(atDolz
                                            ? rated(homeCtrl.genBal.toString())
                                                .toString()
                                            : homeCtrl.genBal.toString())
                                        : i == 1
                                            ? _amt(atDolz
                                                ? rated(homeCtrl.saveBal
                                                        .toString())
                                                    .toString()
                                                : homeCtrl.saveBal.toString())
                                            : _amt(atDolz
                                                ? rated(homeCtrl.invBal
                                                        .toString())
                                                    .toString()
                                                : homeCtrl.invBal.toString()),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: widthy / 18,
                                    fontFamily: '',
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isObs = !isObs;
                                  });
                                },
                                child: Icon(
                                  isObs
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: widthy / 18,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          if (i <= 1)
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      if (i == 0) {
                                        showModalBottomSheet(
                                            isScrollControlled: true,
                                            isDismissible: false,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.vertical(top: Radius.circular(20))),
                                            context: context,
                                            builder: (_) => buildBottomsheet(to:'general',
                                                width: widthy, height: heighty, context: context));

                                      } else {
                                        Get.snackbar(
                                            "Oh Snap", "Hold on Ui Loading");
                                      }
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          btnStyle(const Color(0xffFFC727)),
                                      fixedSize: btnStyle(const Size(100, 28)),
                                      shape: btnStyle(RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6))),
                                    ),
                                    child: Text(
                                      i == 0 ? 'Deposit' : 'Quick Save',
                                      style: TextStyle(
                                          color: blueTup.tupBlue,
                                          fontSize: widthy / 24,
                                          fontWeight: FontWeight.bold),
                                    )),
                                const SizedBox(width: 20),
                                TextButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor: btnStyle(Colors.white54),
                                    //  elevation: btnStyle(4),
                                    fixedSize: btnStyle(const Size(100, 28)),
                                    shape: btnStyle(RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6))),
                                  ),
                                  child: Text(
                                    'withdraw',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: widthy / 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          if (i > 1)
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                //  elevation: btnStyle(4),

                                shape: btnStyle(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6))),
                              ),
                              child: Text(
                                'See details',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: widthy / 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                        ],
                      ),
                      if (i > 1 && homeCtrl.isInvLoading.value == false)
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                'Profit',
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: blueTup.tupGreen,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(
                                  '+\$${homeCtrl.profit.toString()}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ]),
                      if (i == 0 && homeCtrl.isGenLoading.value)
                        _showIndicator(),
                      if (i == 1 && homeCtrl.isSavingsLoading.value)
                        _showIndicator(),
                      if (i == 2 && homeCtrl.isInvLoading.value)
                        _showIndicator()
                    ],
                  ),
                );
              })),
    );
  }

  buildBlog({required String caption, VoidCallback? onClicked}) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 10),
      width: widthy / 2.3,
      decoration: BoxDecoration(
          color: blueTup.tupBlue.withOpacity(.3),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text(
            caption,
            style: TextStyle(
              color: blueTup.tupBlue.withOpacity(.6),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/svg/globe.svg'),
              Text(
                'Read More',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: blueTup.tupBlue),
              )
            ],
          )
        ],
      ),
    );
  }

  buildMili(
      {required String image,
      required String title,
      required String desc,
      required VoidCallback onClicked}) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onClicked,
      child: Container(
        width: widthy / 2.15,
        // height: heighty / 3,
        // margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 3.0,
            color: const Color.fromARGB(255, 0, 4, 29).withOpacity(.05),
            // spreadRadius: .8,
            spreadRadius: 1,
            offset: const Offset(0, 0),
          )
        ], borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: widthy / 2.3,
                height: heighty / 9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover))),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: widthy / 33,
                  fontWeight: FontWeight.w500,
                  color: blueTup.tupBlue),
            ),
            Text(
              desc,
              style: TextStyle(
                  fontSize: widthy / 35,
                  fontWeight: FontWeight.w500,
                  color: blueTup.tupBlue.withOpacity(.6)),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                child: Text('View More',
                    style: TextStyle(
                        fontSize: widthy / 32,
                        fontWeight: FontWeight.w500,
                        color: blueTup.tupBlue)),
              ),
            )
          ],
        ),
      ),
    );
  }

  buildBottomsheet(
      {required BuildContext context,
        required double width,
        required String to,
        required double height}) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return DepositOption(dPTo: to,);

  }
}
