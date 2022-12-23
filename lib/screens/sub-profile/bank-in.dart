import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../main.dart';

class BankAdd extends StatefulWidget {
  const BankAdd({Key? key}) : super(key: key);

  @override
  State<BankAdd> createState() => _BankAddState();
}

class _BankAddState extends State<BankAdd> {
  var currency = TextEditingController();
  var bank = TextEditingController();
  var acctNo = TextEditingController();

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
        title: const Text('Add Bank Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Withdrawal Account Details',
                style: TextStyle(
                    color: blueTup.tupBlue,
                    fontSize: widthy / 25,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: heighty / 20,
              ),
              SizedBox(
                width: widthy,
                child: TextFormField(
                  readOnly: true,
                  cursorColor: blueTup.tupBlue,
                  controller: currency,
                  onTap: () => showActionSheet(),
                  style: TextStyle(color: blueTup.tupBlue),
                  decoration: InputDecoration(
                    //labels
                    labelText: 'Currency',
                    labelStyle:
                        TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                    floatingLabelStyle: TextStyle(color: blueTup.tupBlue),

                    //Fill Colors
                    hintText: currency.text == ''
                        ? '--Select Currency--'
                        : currency.text,
                    hintStyle: TextStyle(color: blueTup.tupBlue),
                    //Suffix
                    suffixIcon: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 12),
                      child: SvgPicture.asset(
                        'assets/svg/downer.svg',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    suffixStyle: TextStyle(fontSize: widthy / 27),

                    //Borders
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: blueTup.tupBlue,
                            width: 1.5,
                            style: BorderStyle.solid)),
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
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
              ),
              SizedBox(
                height: heighty / 20,
              ),
              SizedBox(
                width: widthy,
                child: TextFormField(
                  readOnly: true,
                  cursorColor: blueTup.tupBlue,
                  controller: bank,
                  onTap: () => _showBottomSheet(
                      content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                            text: 'A',
                            style: TextStyle(
                                color: blueTup.tupBlue,
                                fontSize: widthy / 23,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Accecss Bank',
                                  style: TextStyle(
                                      color: blueTup.tupBlue,
                                      fontWeight: FontWeight.w400,
                                      fontSize: widthy / 25),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      setState(() {
                                        bank.text = "Accecss Bank";
                                      });
                                      Navigator.pop(context);
                                    }),
                            ]),
                      ),
                      SizedBox(
                        height: heighty / 22,
                      ),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                            text: 'F',
                            style: TextStyle(
                                color: blueTup.tupBlue,
                                fontSize: widthy / 23,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' First Bank',
                                  style: TextStyle(
                                      color: blueTup.tupBlue,
                                      fontWeight: FontWeight.w400,
                                      fontSize: widthy / 25),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      setState(() {
                                        bank.text = "First Bank";
                                      });
                                      Navigator.pop(context);
                                    }),
                            ]),
                      ),
                      SizedBox(
                        height: heighty / 22,
                      ),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                            text: 'F',
                            style: TextStyle(
                                color: blueTup.tupBlue,
                                fontSize: widthy / 23,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Fidelity Bank',
                                  style: TextStyle(
                                      color: blueTup.tupBlue,
                                      fontWeight: FontWeight.w400,
                                      fontSize: widthy / 25),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      setState(() {
                                        bank.text = "Fidelity Bank";
                                      });
                                      Navigator.pop(context);
                                    }),
                            ]),
                      ),
                      SizedBox(
                        height: heighty / 22,
                      ),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                            text: 'G',
                            style: TextStyle(
                                color: blueTup.tupBlue,
                                fontSize: widthy / 23,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Gauranty Trust Bank',
                                  style: TextStyle(
                                      color: blueTup.tupBlue,
                                      fontWeight: FontWeight.w400,
                                      fontSize: widthy / 25),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      setState(() {
                                        bank.text = "Gauranty Trust Bank";
                                      });
                                      Navigator.pop(context);
                                    }),
                            ]),
                      ),
                      SizedBox(
                        height: heighty / 22,
                      ),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                            text: 'W',
                            style: TextStyle(
                                color: blueTup.tupBlue,
                                fontSize: widthy / 23,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Wema Bank',
                                  style: TextStyle(
                                      color: blueTup.tupBlue,
                                      fontWeight: FontWeight.w400,
                                      fontSize: widthy / 25),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      setState(() {
                                        bank.text = "Wema Bank";
                                      });
                                      Navigator.pop(context);
                                    }),
                            ]),
                      ),
                    ],
                  )),
                  style: TextStyle(color: blueTup.tupBlue),
                  decoration: InputDecoration(
                    //labels
                    labelText: 'Bank Name',
                    labelStyle:
                        TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                    floatingLabelStyle: TextStyle(color: blueTup.tupBlue),

                    //Fill Colors
                    hintText: bank.text == '' ? '--Select Bank--' : bank.text,
                    hintStyle: TextStyle(color: blueTup.tupBlue),
                    //Suffix
                    suffixIcon: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 12),
                      child: SvgPicture.asset(
                        'assets/svg/downer.svg',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    suffixStyle: TextStyle(fontSize: widthy / 27),

                    //Borders
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: blueTup.tupBlue,
                            width: 1.5,
                            style: BorderStyle.solid)),
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
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
              ),
              SizedBox(
                height: heighty / 20,
              ),
              SizedBox(
                width: widthy,
                child: TextFormField(
                  cursorColor: blueTup.tupBlue,
                  controller: acctNo,
                  style: TextStyle(color: blueTup.tupBlue),
                  decoration: InputDecoration(
                    //labels
                    labelText: 'Account Number',
                    labelStyle:
                        TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                    floatingLabelStyle: TextStyle(color: blueTup.tupBlue),

                    //Fill Colors

                    hintStyle: TextStyle(color: blueTup.tupBlue),
                    //Prefix

                    //Borders
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: blueTup.tupBlue,
                            width: 1.5,
                            style: BorderStyle.solid)),
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
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
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: heighty / 8,
              ),
              Center(
                child: TextButton(
                  onPressed: () => _showalert(),
                  style: ButtonStyle(
                    backgroundColor: btnStyle(blueTup.tupBlue),
                    //  elevation: btnStyle(4),
                    fixedSize: btnStyle(Size(widthy, 52)),
                    shape: btnStyle(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
                  ),
                  child: Text(
                    'Verify',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: widthy / 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showBottomSheet({required Widget content}) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return showModalBottomSheet(
        // constraints: BoxConstraints.tight(Size(widthy, heighty / 8)),
        shape: const RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15.0),
          ),
        ),
        context: context,
        builder: (context) {
          return Container(
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [content],
                ),
              ),
            ]),
          );
        });
  }

  showActionSheet() {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
            title: const Text('Select An Option'),
            // message: Text("This is message"),

            actions: <Widget>[
              CupertinoActionSheetAction(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: '\$',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: blueTup.tupBlue,
                          fontSize: widthy / 25),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Dollar',
                          style: TextStyle(
                              color: blueTup.tupBlue,
                              fontWeight: FontWeight.w400,
                              fontSize: widthy / 25),
                        ),
                      ]),
                ),
                onPressed: () {
                  setState(() {
                    currency.text = "Dollar";
                  });
                  Navigator.pop(context);
                },
              ),
              CupertinoActionSheetAction(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: '₦',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: blueTup.tupBlue,
                          fontSize: widthy / 25),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Naira',
                          style: TextStyle(
                              color: blueTup.tupBlue,
                              fontWeight: FontWeight.w400,
                              fontSize: widthy / 25),
                        ),
                      ]),
                ),
                onPressed: () {
                  setState(() {
                    currency.text = "Naira";
                  });
                  Navigator.pop(context);
                },
              )
            ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.pop(context, 'Cancel');
              },
            )));
  }

  _showalert() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          final widthy = MediaQuery.of(context).size.width;
          final heighty = MediaQuery.of(context).size.height;
          const btnStyle = MaterialStateProperty.all;
          return AlertDialog(
            backgroundColor: blueTup.tupAlert,
            insetPadding: const EdgeInsets.symmetric(horizontal: 10),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            content: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                height: heighty / 2.2,
                width: widthy,
                child: Column(
                  children: [
                    Center(child: SvgPicture.asset('assets/svg/acctSaved.svg')),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Account Found',
                            style: TextStyle(
                                color: blueTup.tupBlue,
                                fontSize: widthy / 22,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'You are about to add your bank account with\nthe name ”GODWIN OJEIWA” to your Bluetup profile. ',
                            style: TextStyle(
                              fontSize: widthy / 27,
                              color: blueTup.tupBlue.withOpacity(.5),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextButton(
                      onPressed: () {
                        _showalert();
                      },
                      style: ButtonStyle(
                        backgroundColor: btnStyle(blueTup.tupBlue),
                        //  elevation: btnStyle(4),
                        fixedSize: btnStyle(const Size(237, 52)),
                        shape: btnStyle(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                      ),
                      child: Text(
                        'SAVE BANK ACCOUNT',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: widthy / 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
