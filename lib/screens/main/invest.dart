import 'package:bluetup_inc/controllers/inv-ctrl.dart';
import 'package:bluetup_inc/screens/sub-invest/active.dart';
import 'package:bluetup_inc/screens/sub-invest/explore.dart';
import 'package:bluetup_inc/screens/sub-invest/matured.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../main.dart';

class InvestPage extends StatefulWidget {
  const InvestPage({Key? key}) : super(key: key);

  @override
  State<InvestPage> createState() => _InvestPageState();
}

bool isActive = true;
bool isExplore = false;
bool isMatured = false;
int intPage = 0;
List tabber = [const ActiveView(), const Exploreview(), const MaturedView()];
final InvCtrl invCtrl = Get.put(InvCtrl());
bool isObs = true;

class _InvestPageState extends State<InvestPage> {
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
        title: const Text('Invest'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset('assets/svg/alert-circle-perfecto.svg'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Top balance card
              buildInvCard(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isActive = true;
                        isExplore = false;
                        isMatured = false;
                        intPage = 0;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: isActive
                              ? blueTup.tupBlue
                              : blueTup.tupBlue.withOpacity(.3)),
                      child: Text(
                        'Active',
                        style: TextStyle(
                            color: isActive ? Colors.white : blueTup.tupBlue),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isActive = false;
                        isExplore = true;
                        isMatured = false;
                        intPage = 1;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: isExplore
                              ? blueTup.tupBlue
                              : blueTup.tupBlue.withOpacity(.3)),
                      child: Text(
                        'Explore',
                        style: TextStyle(
                            color: isExplore ? Colors.white : blueTup.tupBlue),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (() {
                      setState(() {
                        isActive = false;
                        isExplore = false;
                        isMatured = true;
                        intPage = 2;
                      });
                    }),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: isMatured
                              ? blueTup.tupBlue
                              : blueTup.tupBlue.withOpacity(.3)),
                      child: Text(
                        'Matured',
                        style: TextStyle(
                            color: isMatured ? Colors.white : blueTup.tupBlue),
                      ),
                    ),
                  )
                ],
              ),
              tabber[intPage]
            ],
          ),
        ),
      ),
    ));
  }

  buildInvCard() {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return Obx(() => Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.all(20),
          height: heighty / 6,
          width: widthy,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  image: AssetImage('assets/images/Total investment.png'),
                  fit: BoxFit.fitWidth)),
          child: invCtrl.isInvLoading.value
              ? Align(
                  alignment: Alignment.topRight,
                  child: CircularProgressIndicator(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Investment',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                isObs
                                    ? '\$ *****'
                                    : '\$${invCtrl.bala.toString()}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: widthy / 20,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: widthy / 25,
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
                          )
                        ]),
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
                              '+\$${invCtrl.profit.toString()}',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ]),
                  ],
                ),
        ));
  }
}
