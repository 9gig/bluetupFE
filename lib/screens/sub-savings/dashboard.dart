import 'package:bluetup_inc/widgets/progress_arc.dart';
import 'package:bluetup_inc/widgets/transc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';
import 'dart:math' as math;
import '../../main.dart';
import '../../widgets/deposit.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

bool status = false;

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  late AnimationController animController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    final curvedAnimation =
        CurvedAnimation(parent: animController, curve: Curves.easeInOutCubic);

    animation = Tween<double>(begin: 0.0, end: 1.57).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });

    animController.forward();
  }

  final target = '₦250,000';

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
          title: Text('Millioniares Club'),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Your challenge Dashboard',
                  style: TextStyle(
                      color: blueTup.tupBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: widthy / 23),
                ),
              ),
              Container(
                  width: widthy,
                  height: heighty / 4,
                  child: Column(
                    children: [
                      Expanded(
                          child: arcy(
                              starter: '₦0.00',
                              end: '₦250,000',
                              now: '₦150,000')),

                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: heighty / 11,
                margin: const EdgeInsets.symmetric(horizontal: 15),
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
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset('assets/svg/target.svg'),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Target',
                                style: TextStyle(
                                    color: blueTup.tupBlue.withOpacity(.5)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                target,
                                style: TextStyle(
                                    color: blueTup.tupGreen,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: VerticalDivider(
                        color: blueTup.tupBlue,
                        thickness: 1.2,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/svg/medal.svg'),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Entries',
                                style: TextStyle(
                                    color: blueTup.tupBlue.withOpacity(.5)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '0 slot',
                                style: TextStyle(
                                    color: blueTup.tupGreen,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: heighty / 11,
                      decoration: BoxDecoration(
                          color: blueTup.tupBlue,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  margin: const EdgeInsets.all(15),
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
                            'You get back your money at the end of the challenge term (24 months), no one has access to your deposit but you alone.',
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
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Latest Activity',
                  style: TextStyle(
                      color: blueTup.tupBlue,
                      fontSize: widthy / 24,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Transc()
            ],
          ),
        ));
  }

  _showAct() {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;

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
            shape: btnStyle(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
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
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: btnStyle(blueTup.tupGreen),
            //  elevation: btnStyle(4),
            fixedSize: btnStyle(Size(widthy / 2.5, 22)),
            shape: btnStyle(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
          ),
          child: Text(
            'Withdraw',
            style: TextStyle(
                color: Colors.white,
                fontSize: widthy / 24,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Container arcy(
      {required String now, required String end, required String starter}) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(alignment: Alignment.center, children: [
        Positioned(
          top: heighty / 100,
          child: CustomPaint(
            size: Size(250, 250),
            painter:
                ProgressArc(math.pi, blueTup.tupBlue.withOpacity(.1), false),
          ),
        ),
        Positioned(
          top: heighty / 100,
          // left: 82,
          // right: 50,
          child: CustomPaint(
            size: Size(250, 250),
            foregroundPainter:
                ProgressArc(animation!.value, Colors.black, true),
          ),
        ),
        Positioned(
          top: 80,
          child: Text(
            "Total Saved",
            style:
                TextStyle(color: blueTup.tupBlue.withOpacity(.5), fontSize: 15),
          ),
        ),
        Positioned(
            top: 100,
            child: Text(
              now,
              // "₦ ${(animation!.value / 3.14 * 100).round()}%",
              style: TextStyle(color: blueTup.tupBlue, fontSize: widthy / 20),
            )),
        Positioned(
            top: heighty / 5.5,
            left: widthy / 15,
            child: Text(
              starter,
              style: TextStyle(
                  color: blueTup.tupBlue.withOpacity(.5), fontSize: 20),
            )),

        Positioned(
            top: heighty / 5.5,
            right: widthy / 15,
            child: Text(
              end,
              style: TextStyle(
                  color: blueTup.tupBlue.withOpacity(.5), fontSize: 20),
            ))
      ]),
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
