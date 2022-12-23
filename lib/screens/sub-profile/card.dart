import 'package:bluetup_inc/screens/sub-profile/card-in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../main.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({Key? key}) : super(key: key);

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
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
        title: const Text('Card Details'),
        centerTitle: true,
      ),

      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                    text: 'Bank Card Details',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: blueTup.tupBlue,
                        fontSize: widthy / 25),
                    children: <TextSpan>[
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: widthy / 25),
                      ),
                    ]),
              ),
              Container(
                  width: widthy,
                  height: heighty / 8,
                  margin: EdgeInsets.symmetric(vertical: heighty / 50),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: widthy / 7,
                            height: heighty / 15,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/mastercard.png'),
                                    fit: BoxFit.fitWidth)),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                  text: 'Access Bank\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: blueTup.tupBlue,
                                      fontSize: widthy / 25),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '1239*****1208 ',
                                      style: TextStyle(
                                          color: blueTup.tupBlue,
                                          fontWeight: FontWeight.w400,
                                          fontSize: widthy / 25),
                                    ),
                                    TextSpan(
                                      text: ' (Mastercard)\n',
                                      style: TextStyle(
                                          color: blueTup.tupBlue,
                                          fontWeight: FontWeight.w500,
                                          fontSize: widthy / 25),
                                    ),
                                    TextSpan(
                                      text: 'Godwin Ojeiwa',
                                      style: TextStyle(
                                          color: blueTup.tupBlue,
                                          fontWeight: FontWeight.w500,
                                          fontSize: widthy / 25),
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.more_vert,
                        color: blueTup.tupBlue,
                      )
                    ],
                  )),
              InkWell(
                onTap: () => Get.to(() => const AddCard()),
                child: Container(
                    alignment: Alignment.center,
                    width: widthy,
                    margin: EdgeInsets.symmetric(
                        horizontal: widthy / 30, vertical: heighty / 50),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: blueTup.tupGreen.withOpacity(.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      'Add Bank Card',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: blueTup.tupGreen,
                          fontSize: widthy / 22),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
