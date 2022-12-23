import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/inv-ctrl.dart';
import '../../main.dart';

class WhenMature extends StatelessWidget {
  int index;
  WhenMature({Key? key, required this.index}) : super(key: key);
  final InvCtrl invCtrl = Get.put(InvCtrl());
  @override
  Widget build(BuildContext context) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return Scaffold(
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
        title: Text(invCtrl.matured[index].invDetails.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // the video view or even image
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: widthy,
                height: heighty / 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: blueTup.tupBlue,
                    image: DecorationImage(
                        image: NetworkImage(
                            invCtrl.matured[index].invDetails.assets[1]),
                        fit: BoxFit.cover)),
              ),

              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  width: 20,
                  height: 10,
                  decoration: BoxDecoration(
                      color: blueTup.tupBlue,
                      borderRadius: BorderRadius.circular(10)),
                )
              ]),
              //Action card
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                width: widthy,
                height: heighty / 5,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: blueTup.tupBlue.withOpacity(.05),
                        spreadRadius: 7,
                        blurRadius: 9,
                        offset: const Offset(0, 0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                                text:
                                    '${invCtrl.matured[index].invDetails.name}\n',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: blueTup.tupBlue,
                                    fontSize: widthy / 28),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'By Green Hue Financials\n\n',
                                    style: TextStyle(
                                        color: blueTup.tupBlue,
                                        fontWeight: FontWeight.w400,
                                        fontSize: widthy / 32),
                                  ),
                                  TextSpan(
                                    text: '2901',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: blueTup.tupGreen,
                                        fontSize: widthy / 28),
                                  ),
                                  TextSpan(
                                    text: ' investors',
                                    style: TextStyle(
                                        color: blueTup.tupBlue,
                                        fontWeight: FontWeight.w400,
                                        fontSize: widthy / 32),
                                  ),
                                ]),
                          ),
                          RichText(
                            textAlign: TextAlign.right,
                            text: TextSpan(
                                text:
                                    '${invCtrl.matured[index].invDetails.cost}\n',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: blueTup.tupBlue,
                                    fontSize: widthy / 28),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' per unit',
                                    style: TextStyle(
                                        color: blueTup.tupBlue,
                                        fontWeight: FontWeight.w400,
                                        fontSize: widthy / 32),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: btnStyle(blueTup.tupBlue),
                                //  elevation: btnStyle(4),
                                fixedSize: btnStyle(const Size(140, 22)),
                                shape: btnStyle(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6))),
                              ),
                              child: Text(
                                'About',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: widthy / 24,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor:
                                    btnStyle(blueTup.tupBlue.withOpacity(.3)),
                                //  elevation: btnStyle(4),
                                fixedSize: btnStyle(const Size(140, 22)),
                                shape: btnStyle(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6))),
                              ),
                              child: Text(
                                'Withdraw',
                                style: TextStyle(
                                    color: blueTup.tupGreen,
                                    fontSize: widthy / 24,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),

              //

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/alert-circle.svg'),
                    const SizedBox(
                      width: 10,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text:
                              'Purchased units and intrests can be liquidated into\n',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: blueTup.tupBlue.withOpacity(.5),
                              fontSize: widthy / 30),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'wallets at the end of investment term (mature)',
                              style: TextStyle(
                                  color: blueTup.tupBlue.withOpacity(.5),
                                  fontWeight: FontWeight.w400,
                                  fontSize: widthy / 30),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/nety.svg'),
                    SizedBox(width: widthy / 18),
                    SvgPicture.asset('assets/svg/thumbs.svg'),
                    SizedBox(width: widthy / 18),
                    SvgPicture.asset('assets/svg/faq.svg'),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'More Info',
                  style: TextStyle(
                      color: blueTup.tupBlue.withOpacity(.5),
                      fontWeight: FontWeight.w600,
                      fontSize: widthy / 25),
                ),
              ),

              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // Row 1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildLeftTile(
                          title: 'Expected Returns',
                          desc: invCtrl.matured[index].invDetails.returns,
                          ctx: context),
                      buildRightTile(
                          title: 'Duration',
                          desc: invCtrl.matured[index].invDetails.duration,
                          ctx: context)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildLeftTile(
                          title: 'Investment Type',
                          desc: invCtrl.matured[index].invDetails.invType,
                          ctx: context),
                      buildRightTile(
                          title: 'Investment Sector',
                          desc: invCtrl.matured[index].invDetails.invSector,
                          ctx: context)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildLeftTile(
                          title: 'Payout Type',
                          desc: invCtrl.matured[index].invDetails.payoutType,
                          ctx: context),
                      buildRightTile(
                          title: 'Unit Type',
                          desc: invCtrl.matured[index].invDetails.unitType,
                          ctx: context)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildLeftTile(
                          title: 'Insurance Patner',
                          desc:
                              invCtrl.matured[index].invDetails.insurancePatner,
                          ctx: context),
                      buildRightTile(
                          title: 'Location',
                          desc: invCtrl.matured[index].invDetails.location,
                          ctx: context)
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRightTile(
      {required BuildContext ctx,
      required String title,
      required String desc}) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(ctx).size.height;
    final widthy = MediaQuery.of(ctx).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: widthy / 2.5,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: blueTup.tupBlue.withOpacity(.05),
          spreadRadius: 7,
          blurRadius: 9,
          offset: const Offset(0, 0),
        )
      ], borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Svg
          SvgPicture.asset('assets/svg/trending-up.svg'),
          Expanded(
            child: RichText(
              textAlign: TextAlign.right,
              text: TextSpan(
                  text: "${title}\n",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: blueTup.tupBlue,
                      fontSize: widthy / 33),
                  children: <TextSpan>[
                    TextSpan(
                      text: desc,
                      style: TextStyle(
                          color: blueTup.tupBlue,
                          fontWeight: FontWeight.w600,
                          fontSize: widthy / 28),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLeftTile(
      {required BuildContext ctx,
      required String title,
      required String desc}) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(ctx).size.height;
    final widthy = MediaQuery.of(ctx).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: widthy / 2.5,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: blueTup.tupBlue.withOpacity(.05),
          spreadRadius: 7,
          blurRadius: 9,
          offset: const Offset(0, 0),
        )
      ], borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                  text: "${title}\n",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: blueTup.tupBlue,
                      fontSize: widthy / 33),
                  children: <TextSpan>[
                    TextSpan(
                      text: desc,
                      style: TextStyle(
                          color: blueTup.tupBlue,
                          fontWeight: FontWeight.w600,
                          fontSize: widthy / 28),
                    ),
                  ]),
            ),
          ),

          // Svg
          SvgPicture.asset('assets/svg/trending-up.svg')
        ],
      ),
    );
  }
}
