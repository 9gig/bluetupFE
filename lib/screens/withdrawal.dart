import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';

class Withdrawal extends StatelessWidget {
  const Withdrawal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: heighty,
          width: widthy,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Withdrawal Days',
                    style: TextStyle(
                        color: blueTup.tupBlue,
                        fontSize: widthy / 26,
                        fontWeight: FontWeight.w500)),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    'assets/svg/closeM.svg',
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/svg/alert-circle.svg',
                  width: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    'Note: Breaking fees are only charge for witdrawals on non withdrawal days, and this is to promote good saving culture and discipline.',
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
            InkWell(
              onTap: () {
                // Refresh inner
                //go.bck
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: blueTup.tupGreen, width: 1.8),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Withdraw to\nyour Wallet',
                      style: TextStyle(
                          color: blueTup.tupBlue, fontSize: widthy / 20),
                    ),
                    Column(
                      children: [
                        SvgPicture.asset('assets/svg/flexy.svg'),
                        Text(
                          'Flexy Naira',
                          style: TextStyle(color: blueTup.tupBlue),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (() {
                print('object');
              }),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: blueTup.tupGreen, width: 1.8),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/svg/Bluetup-bank.svg'),
                    Text(
                      'Withdraw to\nyour Bank',
                      style: TextStyle(
                          color: blueTup.tupBlue, fontSize: widthy / 20),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
