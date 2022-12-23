import 'package:bluetup_inc/config/login_persist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
// import 'package:custom_switch/custom_switch.dart';

import '../../main.dart';

class SecuritySettings extends StatefulWidget {
  const SecuritySettings({Key? key}) : super(key: key);

  @override
  State<SecuritySettings> createState() => _SecuritySettingsState();
}

bool status = false;

class _SecuritySettingsState extends State<SecuritySettings> {
  @override
  void initState() {
    super.initState();
    _setPrint();
  }

  _setPrint() async {
    var printChoice = await UserLoginPref.checkPrint() ?? 0;
    if (printChoice == 1) {
      setState(() {
        status = true;
      });
    }
    if (printChoice != 1) {
      setState(() {
        status = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final widthy = MediaQuery.of(context).size.width;
    final heighty = MediaQuery.of(context).size.height;
    const btnStyle = MaterialStateProperty.all;

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
        title: const Text('Password And Security'),
        centerTitle: true,
      ),
      body: buildPass(),
    );
  }

  buildPass() {
    final widthy = MediaQuery.of(context).size.width;
    final heighty = MediaQuery.of(context).size.height;
    const btnStyle = MaterialStateProperty.all;

    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 3.0,
                  color: const Color.fromARGB(255, 0, 4, 29).withOpacity(.05),
                  // spreadRadius: .8,
                  spreadRadius: 1,
                  offset: const Offset(0, 0),
                )
              ], color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enable Fingerprint',
                    style: TextStyle(
                      fontSize: widthy / 22,
                      color: blueTup.tupBlue,
                    ),
                  ),
                  // CupertinoSwitch(
                  //   value: status,
                  //   activeColor: blueTup.tupGreen,
                  //   trackColor: blueTup.tupYellow,
                  //   thumbColor: blueTup.tupBlue,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       status = value;
                  //     });
                  //   },
                  // ),
                  Switch.adaptive(
                      value: status,
                      activeColor: blueTup.tupBlue,
                      onChanged: (val) async {
                        setState(() {
                          status = val;
                        });
                        UserLoginPref.turnOnPrint(val);
                      })
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SvgPicture.asset('assets/svg/alert-circle-big.svg'),
            Text(
              'To give your bluetup account \na high level of protection,you should \nalways set a very secure password phrase',
              style: TextStyle(color: blueTup.tupBlue),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            Form(
              child: Column(
                children: [
                  SizedBox(
                    width: widthy,
                    child: TextFormField(
                      cursorColor: blueTup.tupBlue,
                      style: TextStyle(color: blueTup.tupBlue),
                      decoration: InputDecoration(
                        //labels
                        labelText: 'Old Password',
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
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: widthy,
                    child: TextFormField(
                      cursorColor: blueTup.tupBlue,
                      style: TextStyle(color: blueTup.tupBlue),
                      decoration: InputDecoration(
                        //labels
                        labelText: 'New Password',
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
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: widthy,
                    child: TextFormField(
                      cursorColor: blueTup.tupBlue,
                      style: TextStyle(color: blueTup.tupBlue),
                      decoration: InputDecoration(
                        //labels
                        labelText: 'Confirm New Password',
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
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: btnStyle(blueTup.tupBlue),
                //  elevation: btnStyle(4),
                fixedSize: btnStyle(const Size(287, 52)),
                shape: btnStyle(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
              ),
              child: Text(
                'Update Password',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: widthy / 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
