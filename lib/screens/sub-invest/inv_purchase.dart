import 'dart:convert';
import 'dart:ffi' as fi;

import 'package:bluetup_inc/models/newInv.dart';
import 'package:bluetup_inc/widgets/card_process.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import '../../config/currency.dart';
import '../../controllers/home-ctrl.dart';
import '../../controllers/inv-ctrl.dart';
import '../../main.dart';
import '../../models/login_res.dart';
import 'inv_purchase.dart';

class InvPurchase extends StatefulWidget {
  int ind;
  InvPurchase({Key? key, required this.ind}) : super(key: key);
  @override
  State<InvPurchase> createState() => _InvPurchaseState();
}

int pager = 0;

String totalAmt = '0.00';

final InvCtrl invCtrl = Get.put(InvCtrl());

class _InvPurchaseState extends State<InvPurchase> {
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

  _amt(String amm) {
    if (amm == '') {
      return CurrencyFormatter.format(0.00, symbol);
    } else {
      return CurrencyFormatter.format(amm, symbol);
    }
  }
  var userData = GetStorage();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CurrencyPrefrence.getCurrencyPrefrence().then((value) => setCurry(value));
  }
  @override
  Widget build(BuildContext context) {
    var u = loginResponseFromJson(jsonDecode(userData.read('User')));
    var userId = u.data.uId;
    List purch = [Selection(indx: widget.ind), Confirmation()];
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Obx(() => Container(
        width: widthy,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                        color: blueTup.tupBlue.withOpacity(.4),
                        borderRadius: BorderRadius.circular(10)
                    ),

                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //inner Row
                    Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (pager == 0)
                              SvgPicture.asset(
                                'assets/svg/logo.svg',
                                width: widthy / 6.5,
                              ),
                            if (pager == 0)
                              const SizedBox(
                                width: 20,
                              ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    "Credit Financing:\n${invCtrl.deals[widget.ind].name}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: blueTup.tupBlue,
                                        fontSize: widthy / 22),
                                  ),
                                  Text(
                                    'By GreenHuz Financials',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: blueTup.tupBlue.withOpacity(.5),
                                        fontSize: widthy / 26),
                                  )
                                ],
                              ),
                            ),
                          ]),
                    ),
                    if (pager == 1)
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset('assets/svg/dot.svg'),
                          Positioned(
                            left: .5,
                            right: .5,
                            top: .5,
                            bottom: 0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      text: "Total Amount\n",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: blueTup.tupBlue,
                                          fontSize: widthy / 33),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:     _amt(atDolz
                                              ? rated(totalAmt)
                                              .toString()
                                              : totalAmt),
                                          style: TextStyle(
                                              color: blueTup.tupBlue,
                                              fontWeight: FontWeight.w600,
                                              fontSize: widthy / 28),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(
                        'assets/svg/closeM.svg',
                        width: widthy / 12,
                      ),
                    )
                  ],
                ),
                purch[pager],
                Container(
                  width: widthy,

                  height: heighty / 47,
                  padding: EdgeInsets.symmetric(horizontal: widthy/ 2.5),
                  child: ListView.builder(
                      itemCount: purch.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, i) => Container(
                        width: i == pager ? widthy / 15 : widthy / 36,
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: i == pager
                              ? blueTup.tupBlue
                              : blueTup.tupBlue.withOpacity(.6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (pager == 1)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            pager -= 1;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: btnStyle(blueTup.tupYellow),
                          //  elevation: btnStyle(4),
                          fixedSize: btnStyle(const Size(140, 22)),
                          shape: btnStyle(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6))),
                        ),
                        child: Text(
                          'Back',
                          style: TextStyle(
                              color: blueTup.tupBlue,
                              fontSize: widthy / 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    TextButton(
                      onPressed: () {
                        if (pager == 0) {
                          setState(() {
                            pager++;
                          });
                        }else{
                          Invest inn = Invest(userId: userId, invDetails: invCtrl.deals[widget.ind].id, capital: totalAmt, bal: totalAmt, units: valuer.toString(), dur: invCtrl.deals[widget.ind].duration, returns:  invCtrl.deals[widget.ind].returns, interval: '4', paymentMethod: payChoice);
                          invCtrl.purchase(inn);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: btnStyle(blueTup.tupBlue),
                        //  elevation: btnStyle(4),
                        fixedSize: btnStyle(
                            pager == 1 ? const Size(180, 22) : const Size(300, 25)),
                        shape: btnStyle(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                      ),
                      child:invCtrl.isPurchasing.value?const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ): Text(
                        pager == 0 ? 'Continue' : 'Confirm Payment',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: widthy / 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),

      )
    );
  }
}

class Selection extends StatefulWidget {
  int indx;
  Selection({Key? key, required this.indx}) : super(key: key);

  @override
  State<Selection> createState() => _SelectionState();
}

double valuer = 1.0;
var select = false;



class _SelectionState extends State<Selection> {
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

  _amt(String amm) {
    if (amm == '') {
      return CurrencyFormatter.format(0.00, symbol);
    } else {
      return CurrencyFormatter.format(amm, symbol);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CurrencyPrefrence.getCurrencyPrefrence().then((value) => setCurry(value));
  }
  @override
  Widget build(BuildContext context) {
    var cost = int.parse(invCtrl.deals[widget.indx].cost);

    setState(() {
      int amt  = valuer.toInt()*cost;
      totalAmt = amt.toString();
    });
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 15,
          ),
          //Price
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text:    _amt(atDolz
                    ? rated(invCtrl.deals[widget.indx].cost.toString())
                    .toString()
                    : invCtrl.deals[widget.indx].cost.toString()),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: blueTup.tupBlue,
                    fontSize: widthy / 24),
                children: <TextSpan>[
                  TextSpan(
                    text: '/per unit',
                    style: TextStyle(
                        color: blueTup.tupBlue.withOpacity(.5),
                        fontWeight: FontWeight.w400,
                        fontSize: widthy / 24),
                  ),
                ]),
          ),

          //info
          const SizedBox(
            height: 15,
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/svg/alert-circle-red.svg',
                width: widthy / 13,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  'Our current rates and charges across all our saving and investment products, updated daily.',
                  style: TextStyle(
                      color: blueTup.tupBlue,
                      fontWeight: FontWeight.w400,
                      fontSize: widthy / 31),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SliderTheme(
            data: SliderThemeData(
                thumbColor: blueTup.tupBlue,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                activeTrackColor: blueTup.tupBlue,
                inactiveTrackColor: blueTup.tupBlue.withOpacity(.1),
                valueIndicatorColor: blueTup.tupBlue,
                activeTickMarkColor: blueTup.tupBlue.withOpacity(.1),
                // inactiveTickMarkColor: blueTup.tupBlue.withOpacity(.6),

                trackHeight: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How many units do you want?',
                  style: TextStyle(
                      color: blueTup.tupBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: widthy / 25),
                ),
                Slider(
                  value: valuer,
                  onChanged: (mall) => setState(() {
                    valuer = mall;
                  }),
                  min: 0.0,
                  max: 100.0,
                  label: valuer.round().toString(),
                  divisions: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildOptButton(valley: 1, onCs: () {
                      setState(() {
                        valuer = 1;
                      });
                    }),
                    buildOptButton(valley: 5, onCs: () {
                      setState(() {
                        valuer = 5;
                      });
                    }),
                    buildOptButton(valley: 20, onCs: () {
                      setState(() {
                        valuer = 20;
                      });
                    }),
                    buildOptButton(valley: 30, onCs: () {   setState(() {
                      valuer = 30;
                    });
                    }),
                    buildOptButton(valley: 50, onCs: () {
                      setState(() {
                        valuer = 50;
                      });
                    }),
                    buildOptButton(valley: 100, onCs: () {
                      setState(() {
                        valuer = 100;
                      });
                    }),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      width: widthy / 2.5,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: blueTup.tupBlue.withOpacity(.05),
                              spreadRadius: 7,
                              blurRadius: 9,
                              offset: const Offset(0, 0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                  text: "Total No. of units\n",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: blueTup.tupBlue,
                                      fontSize: widthy / 33),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: (valuer.toInt()).toString(),
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
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      width: widthy / 2.5,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: blueTup.tupBlue.withOpacity(.05),
                              spreadRadius: 7,
                              blurRadius: 9,
                              offset: const Offset(0, 0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: RichText(
                              textAlign: TextAlign.right,
                              text: TextSpan(
                                  text: "Amount\n",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: blueTup.tupBlue,
                                      fontSize: widthy / 33),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:     _amt(atDolz
                                  ? rated(totalAmt)
                                  .toString()
                              : totalAmt),
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
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  buildOptButton({
    required int valley,
    required VoidCallback onCs,
  }) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onCs,
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        width: widthy / 8,
        height: heighty / 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
             color: valuer == valley ? blueTup.tupBlue : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border:
                Border.all(color: blueTup.tupBlue.withOpacity(.6), width: 1.2)),
        child: Text(valley.toString(),
            style: TextStyle(
                color: valuer == valley ? Colors.white : blueTup.tupBlue,
                fontWeight: FontWeight.w500,
                fontSize: widthy / 25)),
      ),
    );
  }
}

class Confirmation extends StatefulWidget {
  const Confirmation({Key? key}) : super(key: key);

  @override
  State<Confirmation> createState() => _ConfirmationState();
}
var payChoice = 'wallet';
final HomeCtrl homeCtrl = Get.put(HomeCtrl());


class _ConfirmationState extends State<Confirmation> {

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

  _amt(String amm) {
    if (amm == '') {
      return CurrencyFormatter.format(0.00, symbol);
    } else {
      return CurrencyFormatter.format(amm, symbol);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CurrencyPrefrence.getCurrencyPrefrence().then((value) => setCurry(value));
  }
  @override
  Widget build(BuildContext context) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return Scrollbar(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildOpt(
              width: widthy,
              title: "Pay with wallet balance",),
                InkWell(
                  onTap: (){
                    setState(() {
                      payChoice = 'wallet';
                    });
                  },
                  child: Container(
                     width: widthy,

                     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                     decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: payChoice == 'wallet'?Colors.grey.withOpacity(.5):Colors.transparent,
                              blurRadius: 2,
                              spreadRadius: 3,
                              offset: Offset(0,3)
                            )
                          ],
                         color: Colors.white, borderRadius: BorderRadius.circular(10)),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/logo.svg',
                          width: 50,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Balance:',
                              style: TextStyle(
                                  color: blueTup.tupBlue, fontSize: widthy / 24),
                              children: <TextSpan>[
                                TextSpan(
                                  text: _amt(atDolz
                                      ? rated(homeCtrl.genBal.toString())
                                      .toString()
                                      : homeCtrl.genBal.toString()),
                                  style: TextStyle(
                                      color: blueTup.tupBlue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: widthy / 24),
                                ),
                              ]),
                        ),
                      ],
              ),
                   ),
                ),

         InkWell(
             onTap: (){
               setState(() {
                 payChoice = 'card';
               });

             },
             child: CardProcess(choice:payChoice, amnt: int.parse(totalAmt),)),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
  buildOpt(
      {required String title,  required double width}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: TextStyle(color: blueTup.tupBlue, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 10,
        ),

      ],
    );
  }

}
