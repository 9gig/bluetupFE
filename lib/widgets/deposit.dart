import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class DepositToChalenge extends StatefulWidget {
  const DepositToChalenge({Key? key}) : super(key: key);

  @override
  State<DepositToChalenge> createState() => _DepositToChalengeState();
}

final depositFormKey = GlobalKey<FormState>();
bool status = false;
var amount = TextEditingController();
var interval = TextEditingController();
var autoAmount = TextEditingController();

class _DepositToChalengeState extends State<DepositToChalenge> {
  @override
  Widget build(BuildContext context) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Challenge',
                  style: TextStyle(
                    color: blueTup.tupBlue,
                    fontWeight: FontWeight.w600,
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset('assets/svg/closeM.svg'))
            ]),
            const SizedBox(height: 30),
            Center(
              child: Text(
                'Join the millionairs challange, save towards a your goal of being a millionair.',
                textAlign: TextAlign.center,
                style: TextStyle(color: blueTup.tupBlue),
              ),
            ),
            const SizedBox(height: 30),
            Form(
                key: depositFormKey,
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: amount,
                        decoration: InputDecoration(
                          labelText: 'Amount to save',
                          labelStyle:
                              TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                          floatingLabelStyle: TextStyle(color: blueTup.tupBlue),

                          //Fill Colors

                          hintStyle:
                              TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
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
                      const SizedBox(height: 30),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Turn on Autosave',
                              style: TextStyle(color: blueTup.tupBlue),
                            ),
                            Switch.adaptive(
                                value: status,
                                activeColor: blueTup.tupBlue,
                                onChanged: (val) {
                                  setState(() {
                                    status = val;
                                  });
                                })
                          ]),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: interval,
                        readOnly: true,
                        onTap: () {
                          showActionSheet();
                        },
                        decoration: InputDecoration(
                          labelText: 'How often do you want to save?',

                          labelStyle:
                              TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                          floatingLabelStyle: TextStyle(color: blueTup.tupBlue),

                          //Fill Colors
                          hintText: interval.text,
                          hintStyle:
                              TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
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
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: autoAmount,
                        decoration: InputDecoration(
                          labelText: 'Amount to save per time',
                          labelStyle:
                              TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                          floatingLabelStyle: TextStyle(color: blueTup.tupBlue),

                          //Fill Colors

                          hintStyle:
                              TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
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
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          var depositChoice = {
                            'amount': amount.text,
                            'interval': interval.text,
                            ' autoAmount': autoAmount.text,
                            'autosave': status
                          };
                          print(depositChoice);
                        },
                        style: ButtonStyle(
                          backgroundColor: btnStyle(blueTup.tupBlue),
                          elevation: btnStyle(0),
                          fixedSize: btnStyle(Size(widthy, heighty / 16)),
                          shape: btnStyle(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6))),
                        ),
                        child: Text(
                          'Join',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: widthy / 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  showActionSheet() {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;

    showCupertinoModalPopup(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CupertinoActionSheet(
            title: const Text('Select An Option'),
            // message: Text("This is message"),

            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text(
                  'Weekly',
                  style: TextStyle(
                      color: blueTup.tupBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: widthy / 22),
                ),
                onPressed: () async {
                  // final prefs = await SharedPreferences.getInstance();
                  setState(() {
                    interval.text = 'Weekly';
                  });
                  Navigator.pop(context);
                },
              ),
              CupertinoActionSheetAction(
                child: Text(
                  'Monthly',
                  style: TextStyle(
                      color: blueTup.tupBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: widthy / 22),
                ),
                onPressed: () async {
                  // final prefs = await SharedPreferences.getInstance();

                  setState(() {
                    interval.text = 'Monthly';
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
}
