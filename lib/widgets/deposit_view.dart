import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'bank_transfer.dart';
import 'card_deposit.dart';

class DepositTabBiew extends StatefulWidget {
  var tabController;
 DepositTabBiew({Key? key, required this.tabController}) : super(key: key);

  @override
  State<DepositTabBiew> createState() => _DepositTabBiewState();
}


class _DepositTabBiewState extends State<DepositTabBiew> {

  @override
  Widget build(BuildContext context) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(
          height: 30,
        ),
        Text('Please Select your preferred payment method',
            style: TextStyle(
              color: blueTup.tupBlue.withOpacity(.5),
              fontSize: widthy / 26,
            )),




        const SizedBox(
          height: 10,
        ),
        Container(
          height: heighty /24,
          decoration: BoxDecoration(
              color: blueTup.tupBlue.withOpacity(.3),
              border: Border.all(color: blueTup.tupBlue,width: 1.2),
              borderRadius: BorderRadius.circular(10)
          ),
          child: TabBar(
            controller: widget.tabController,
              indicator: BoxDecoration(
                color: blueTup.tupBlue,
                borderRadius: BorderRadius.circular(8),
              ),
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: widthy / 24
              ),
              unselectedLabelColor: blueTup.tupBlue,
              tabs: [
                Tab(text: 'Card',),
                Tab(text: 'Bank Transfer')

              ]),
        ),
        const SizedBox(
          height: 30,
        ),
        SingleChildScrollView(
          child: SizedBox(
            height: heighty/3,
            child: TabBarView(
                controller: widget.tabController,
                children: [
              CardDeposit(),
              BankTransfer()
            ]),
          ),
        )
      ],

    );
  }
}



