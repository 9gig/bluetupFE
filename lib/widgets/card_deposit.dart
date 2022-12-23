import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'card_process.dart';

class CardDeposit extends StatefulWidget {
  static var ammt;

   CardDeposit({Key? key}) : super(key: key);

  @override
  State<CardDeposit> createState() => _CardDepositState();
}

class _CardDepositState extends State<CardDeposit> {

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
        Center(
              child: Text(
                  'Enter the amount you want to Deposit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: blueTup.tupBlue.withOpacity(.5),
                    fontSize: widthy / 26,
                  )),
            ),
          SizedBox(
            height: 30,
          ),
          Form(
            child: Padding(
              padding: EdgeInsets.only( bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                children: [
                TextFormField(

                              onChanged: (vam){
                                  setState(() {
                                    CardDeposit.ammt = vam;
                                  });
                              },
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
                                          height: 40,
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







class CardNextView extends StatelessWidget {
  const CardNextView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
            width: widthy,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Amount to pay',
                  style: TextStyle(
                      color: blueTup.tupBlue, fontSize: widthy / 24),),

                Text(CardDeposit.ammt.toString(),
                  style: TextStyle(
                      color: blueTup.tupBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: widthy / 24),),

              ],
            )),

        CardProcess(choice: 'card',amnt:int.parse(CardDeposit.ammt)),
        SizedBox(height: 40,)

      ],
    );
  }
}

