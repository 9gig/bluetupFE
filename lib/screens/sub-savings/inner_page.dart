import 'package:bluetup_inc/screens/withdrawal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:bluetup_inc/widgets/transc.dart';

import '../../controllers/home-ctrl.dart';
import '../../main.dart';
import '../../widgets/dd.dart';

class SavingsInnerPage extends StatelessWidget {
  final String title;
  final String bal;
  final String innt;
  final String id;
  SavingsInnerPage({Key? key, required this.title, required this.bal, required this.innt, required this.id}) : super(key: key);
  final HomeCtrl homeCtrl = Get.put(HomeCtrl());

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
        title: Text(title),
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
          padding: const EdgeInsets.all(10),
          child: Column(
            // First Level
            children: [
              buildBalanceCard(
                  context: context,
                  width: widthy,
                  height: heighty / 4.5,
                  rate: '',
                  balance: '',
                  intrest: ''),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/alert-circle.svg',
                    width: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'Your wallet interest is calculated daily for every month and its interest is currently 10% per annum.',
                      style: TextStyle(
                          color: blueTup.tupBlue.withOpacity(.6),
                          fontSize: widthy / 30),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/set.svg',
                          width: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                              color: blueTup.tupBlue, fontSize: widthy / 28),
                        )
                      ],
                    ),
                    SizedBox(width: widthy / 10),
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/sav.svg',
                          width: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Auto Save',
                          style: TextStyle(
                              color: blueTup.tupBlue, fontSize: widthy / 28),
                        )
                      ],
                    ),
                    SizedBox(width: widthy / 10),
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/nety.svg',
                          width: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Share',
                          style: TextStyle(
                              color: blueTup.tupBlue, fontSize: widthy / 28),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Transaction
              Transc()
            ],
          ),
        ),
      ),
    );
  }

  Container buildTab(double widthy) {
    return Container(
      width: widthy,
      height: widthy / 12,
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

  buildBalanceCard(
      {required BuildContext context,
      required double width,
      required double height,
      required String rate,
      required String balance,
      required String intrest}) {

    const btnStyle = MaterialStateProperty.all;
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Balance',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: blueTup.tupBlue,
                    fontSize: width / 26),
                textAlign: TextAlign.left,
              ),
              Text(
                'Interest (10%)apy',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: blueTup.tupBlue.withOpacity(.5),
                    fontSize: width / 26),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(bal,
                  style: TextStyle(
                      color: blueTup.tupBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: width / 15),
                  textAlign: TextAlign.left),
              Text(
                innt,
                style: TextStyle(
                    color: blueTup.tupBlue,
                    fontWeight: FontWeight.w500,
                    fontSize: width / 23),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => showModalBottomSheet(
                    isScrollControlled: true,
                    isDismissible: false,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    context: context,
                    builder: (_) => buildBottomsheet(
                        width: width, height: height, context: context)),
                child: Text('Save',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: blueTup.tupBlue,
                    )),
                style: ButtonStyle(
                  backgroundColor: btnStyle(blueTup.tupYellow),
                  fixedSize: btnStyle(Size(width / 2.5, 25)),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => Withdrawal());
                },
                child: Text('withdraw'),
                style: ButtonStyle(
                  backgroundColor: btnStyle(blueTup.tupGreen),
                  fixedSize: btnStyle(Size(width / 2.5, 25)),
                ),
              ),
            ],
          )
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
                        'Qiucksave Deposit\n(Trx ID: 1234frdeghykdj)',
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
                        '₦550.98',
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

  buildBottomsheet(
      {required BuildContext context,
      required double width,
      required double height}) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return DepositOption(dPTo: 'Add Type of Savings',);

  }



}
