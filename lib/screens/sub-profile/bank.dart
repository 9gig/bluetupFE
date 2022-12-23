import 'package:bluetup_inc/screens/sub-profile/bank-in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../main.dart';

class BankDetailsPage extends StatefulWidget {
  const BankDetailsPage({Key? key}) : super(key: key);

  @override
  State<BankDetailsPage> createState() => _BankDetailsPageState();
}

class _BankDetailsPageState extends State<BankDetailsPage> {
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
        title: const Text('Bank Account Details'),
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
                    text: 'Bank Account Details',
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
                            width: widthy / 5,
                            height: heighty / 10,
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/access.png'),
                                    fit: BoxFit.fitHeight)),
                          ),
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                                text: 'Access Bank\n',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: blueTup.tupBlue,
                                    fontSize: widthy / 25),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '1239120860',
                                    style: TextStyle(
                                        color: blueTup.tupBlue,
                                        fontWeight: FontWeight.w400,
                                        fontSize: widthy / 25),
                                  ),
                                  TextSpan(
                                    text: ' (Naira)\n',
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
                        ],
                      ),
                      Icon(
                        Icons.more_vert,
                        color: blueTup.tupBlue,
                      )
                    ],
                  )),
              InkWell(
                onTap: () => Get.to(() => const BankAdd()),
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
                      'Add New Account',
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
