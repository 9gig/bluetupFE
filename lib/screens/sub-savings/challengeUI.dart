import 'package:bluetup_inc/screens/sub-savings/dashboard.dart';
import 'package:bluetup_inc/widgets/deposit.dart';
import 'package:bluetup_inc/widgets/transc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../../main.dart';

class Challenge extends StatefulWidget {
  const Challenge({Key? key}) : super(key: key);

  @override
  State<Challenge> createState() => _ChallengeState();
}

bool isInGroup = true;
bool status = false;

class _ChallengeState extends State<Challenge> {
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
        title: Text('Challenge'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset('assets/svg/alert-circle-perfecto.svg'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: widthy,
              height: heighty / 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: blueTup.tupBlue,
                // image: DecorationImage(
                //     image: NetworkImage(),
                //     fit: BoxFit.cover)
              ),
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
            Container(
              padding: const EdgeInsets.all(10),
              child: descCard(
                  ctx: context,
                  width: widthy,
                  title: '',
                  desc: '',
                  members: '',
                  target: '',
                  balance: ''),
            ),
            Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: blueTup.tupBlue.withOpacity(.03),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0, 0),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(children: [
                      SvgPicture.asset(
                        'assets/svg/alert-circle.svg',
                        width: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          'You get back your money at the end of the challenge term, no one has access to your deposit but you alone.',
                          style: TextStyle(
                              color: blueTup.tupBlue.withOpacity(.6),
                              fontSize: widthy / 30),
                        ),
                      )
                    ]),
                    const SizedBox(
                      height: 15,
                    ),
                    _showAct(),
                  ],
                )),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              child: Text(
                'More Info',
                style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                    fontSize: widthy / 23),
              ),
            ),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        buildLeftTile(
                            ctx: context,
                            title: 'Return',
                            desc: '₦1 Million',
                            icn: 'assets/svg/trending-up.svg'),
                        buildLeftTile(
                            ctx: context,
                            title: 'Saving Frequency',
                            desc: 'Anytime',
                            icn: 'assets/svg/trending-up.svg'),
                        buildLeftTile(
                            ctx: context,
                            title: 'Insurance Patner',
                            desc: 'Lead Insurance',
                            icn: 'assets/svg/shield-check.svg'),
                      ],
                    ),
                    Column(
                      children: [
                        buildRightTile(
                            ctx: context,
                            title: 'Duration',
                            desc: '24 months +',
                            icn: 'assets/svg/trending-up.svg'),
                        buildRightTile(
                            ctx: context,
                            title: 'Target /Member',
                            desc: '₦250,000 = 1 slot',
                            icn: 'assets/svg/trending-up.svg'),
                        buildRightTile(
                            ctx: context,
                            title: 'Min Saving',
                            desc: '₦10,000.00',
                            icn: 'assets/svg/shield-check.svg'),
                      ],
                    ),
                  ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Transc()
          ],
        ),
      ),
    );
  }

  _showAct() {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;

    if (isInGroup) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {
              buildDeposit();
            },
            style: ButtonStyle(
              backgroundColor: btnStyle(blueTup.tupYellow),
              //  elevation: btnStyle(4),
              fixedSize: btnStyle(Size(widthy / 2.5, 22)),
              shape: btnStyle(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6))),
            ),
            child: Text(
              'Deposit',
              style: TextStyle(
                  color: blueTup.tupBlue,
                  fontSize: widthy / 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.to(() => Dashboard());
            },
            style: ButtonStyle(
              backgroundColor: btnStyle(blueTup.tupGreen),
              //  elevation: btnStyle(4),
              fixedSize: btnStyle(Size(widthy / 2.5, 22)),
              shape: btnStyle(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6))),
            ),
            child: Text(
              'Dashboard',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: widthy / 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    } else {
      return TextButton(
        onPressed: () {
          buildDeposit();
        },
        style: ButtonStyle(
          backgroundColor: btnStyle(blueTup.tupGreen),
          //  elevation: btnStyle(4),
          fixedSize: btnStyle(Size(widthy, 22)),
          shape: btnStyle(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
        ),
        child: Text(
          'Join Challenge',
          style: TextStyle(
              color: Colors.white,
              fontSize: widthy / 24,
              fontWeight: FontWeight.bold),
        ),
      );
    }
  }

  descCard(
      {required double width,
      required String title,
      required String desc,
      required String members,
      required String target,
      required BuildContext ctx,
      required String balance}) {
    final widthy = MediaQuery.of(ctx).size.width;
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: blueTup.tupBlue.withOpacity(.03),
          spreadRadius: 5,
          blurRadius: 5,
          offset: const Offset(0, 0),
        )
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Join the Millionairs club 💸',
              style: TextStyle(
                  fontSize: widthy / 24,
                  color: blueTup.tupBlue,
                  fontWeight: FontWeight.w500)),
          const SizedBox(height: 5),
          Text('Join million of poeple saving and grow you wealth with ......',
              style: TextStyle(
                color: blueTup.tupBlue.withOpacity(.6),
              )),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Members',
                      style: TextStyle(
                          color: blueTup.tupBlue.withOpacity(.6),
                          fontWeight: FontWeight.w500)),
                  Text(
                    '2710',
                    style: TextStyle(
                        color: blueTup.tupGreen, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Group Target',
                      style: TextStyle(
                          color: blueTup.tupBlue.withOpacity(.6),
                          fontWeight: FontWeight.w500)),
                  Text(
                    '100,000,000',
                    style: TextStyle(
                        color: blueTup.tupGreen, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Group Balance',
                      style: TextStyle(
                          color: blueTup.tupBlue.withOpacity(.6),
                          fontWeight: FontWeight.w500)),
                  Text(
                    '29,270,700',
                    style: TextStyle(
                        color: blueTup.tupGreen, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildRightTile(
      {required BuildContext ctx,
      required String icn,
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
          SvgPicture.asset(icn),
          Expanded(
            child: RichText(
              textAlign: TextAlign.right,
              text: TextSpan(
                  text: "${title}\n\n",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: blueTup.tupBlue.withOpacity(.5),
                      fontSize: widthy / 30),
                  children: <TextSpan>[
                    TextSpan(
                      text: desc,
                      style: TextStyle(
                          color: blueTup.tupBlue,
                          fontWeight: FontWeight.w600,
                          fontSize: widthy / 30),
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
      required String icn,
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
                  text: "${title}\n\n",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: blueTup.tupBlue.withOpacity(.5),
                      fontSize: widthy / 30),
                  children: <TextSpan>[
                    TextSpan(
                      text: desc,
                      style: TextStyle(
                          color: blueTup.tupBlue,
                          fontWeight: FontWeight.w600,
                          fontSize: widthy / 30),
                    ),
                  ]),
            ),
          ),

          // Svg
          SvgPicture.asset(icn)
        ],
      ),
    );
  }

  Container buildTab(double widthy) {
    return Container(
      width: widthy,
      height: widthy / 12,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: blueTup.tupBlue.withOpacity(.2),
          border: Border.all(color: blueTup.tupBlue, width: 1.5),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: widthy / 3.3,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: blueTup.tupBlue,
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                'All',
                style: TextStyle(color: Colors.white, fontSize: widthy / 26),
              ),
            ),
          ),
          Container(
            width: widthy / 3.3,
            alignment: Alignment.center,
            child: Text(
              'Credits',
              style: TextStyle(color: blueTup.tupBlue, fontSize: widthy / 26),
            ),
          ),
          Container(
            width: widthy / 3.3,
            alignment: Alignment.center,
            child: Text(
              'Debits',
              style: TextStyle(color: blueTup.tupBlue, fontSize: widthy / 26),
            ),
          ),
        ],
      ),
    );
  }

  buildContent({required double width, required double height}) {
    return Scrollbar(
      child: Container(
        width: width,
        height: height,
        child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: ((context, index) => Column(
                  children: [
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/svg/Credit.svg',
                        width: 40,
                      ),
                      title: Text(
                        'Deposit to challange(Jude franker ) ',
                        style: TextStyle(
                            color: blueTup.tupBlue, fontSize: width / 28),
                      ),
                      subtitle: Text(
                        'Jun 26, 2021 17:22:18 GMT',
                        style: TextStyle(
                            color: blueTup.tupBlue.withOpacity(.6),
                            fontSize: width / 30),
                      ),
                      trailing: Text(
                        '₦5,050',
                        style: TextStyle(
                            color: blueTup.tupBlue, fontSize: width / 28),
                      ),
                    ),
                    Divider(
                      height: 10,
                    )
                  ],
                ))),
      ),
    );
  }

  buildDeposit() {
    return showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (_) => const DepositToChalenge());
  }
}
