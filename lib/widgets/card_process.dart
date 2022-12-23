import 'dart:convert';

import 'package:bluetup_inc/widgets/deposit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../config/payments/paystack_config.dart';
import '../main.dart';
import '../models/login_res.dart';

class CardProcess extends StatelessWidget {
  CardProcess({Key? key, required this.choice, required this.amnt})
      : super(key: key);
  var choice;
  int amnt;
  final userData = loginResponseFromJson(jsonDecode(GetStorage().read('User')));
  @override
  Widget build(BuildContext context) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return Container(
        child: Column(
      children: [
        buildOpt(
            context: context,
            width: widthy,
            title: "Pay with Bank card",
            content: Row(
              children: [
                Container(
                  width: widthy / 7,
                  height: heighty / 15,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/mastercard.png'),
                          fit: BoxFit.fitWidth)),
                ),
                SizedBox(width: 10),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: '*****123456',
                      style: TextStyle(
                          color: blueTup.tupBlue, fontSize: widthy / 24),
                      children: <TextSpan>[
                        TextSpan(
                          text: '(Mastercard)',
                          style: TextStyle(
                              color: blueTup.tupBlue,
                              fontWeight: FontWeight.w500,
                              fontSize: widthy / 24),
                        ),
                      ]),
                ),
              ],
            )),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            StartPayment(context, amnt, userData.data.email)
                .chargeCardToPayment();
          },
          child: Container(
            width: widthy,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: Color(0xff99FFC8),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              'Use new bank card',
              style: TextStyle(
                color: blueTup.tupGreen,
              ),
            ),
          ),
        ),
      ],
    ));
  }

  buildOpt(
      {required String title,
      required Row content,
      required double width,
      required context}) {
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
        InkWell(
          onTap: () {
            var n_o = '4084084084084081';
            int month = 11;
            int year = 23;
            var cvv = '408';
            StartPayment(context, amnt, userData.data.email)
                .chargeSavedCard(nom: n_o, expM: month, expY: year, cvv: cvv);
          },
          child: Container(
            width: width,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: choice == 'card'
                      ? Colors.grey.withOpacity(.5)
                      : Colors.transparent,
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 3))
            ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: content,
          ),
        ),
      ],
    );
  }
}
