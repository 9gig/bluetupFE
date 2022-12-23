import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';

class BankTransfer extends StatefulWidget {
  const BankTransfer({Key? key}) : super(key: key);

  @override
  State<BankTransfer> createState() => _BankTransferState();
}

class _BankTransferState extends State<BankTransfer> {
  @override
  Widget build(BuildContext context) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30,
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
                  'For Deposits more than NGN 100,000 (One Hundred Thousand naira) at a time',
                  style: TextStyle(
                      color: blueTup.tupBlue.withOpacity(.6),
                      fontSize: widthy / 30),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Form(
            child: Padding(
              padding:  EdgeInsets.only( bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter the desired amount',
                      labelStyle: TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                      floatingLabelStyle: TextStyle(color: blueTup.tupBlue),

                      //Fill Colors

                      hintStyle: TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: blueTup.tupBlue,
                              width: 1.5,
                              style: BorderStyle.solid)),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide(
                              color: blueTup.tupBlue.withOpacity(.5),
                              width: 1.5,
                              style: BorderStyle.solid)),

                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),

                ],
              ),
            ),
          )
        ],

      ),
    );
  }
}
