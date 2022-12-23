import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../main.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  int pageBoy = 0;
  List scrr() => [buildSignup1(), buildOTP2(), buildSignup3()];

  checkPageBoy() {
    if (pageBoy > 0) {
      setState(() {
        pageBoy -= 1;
      });
    } else {
      Get.back();
    }
  }

  Future<bool> _back() async {
    return (await checkPageBoy()) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final widthy = MediaQuery.of(context).size.width;
    final heighty = MediaQuery.of(context).size.height;
    const btnStyle = MaterialStateProperty.all;
    return WillPopScope(
      onWillPop: _back,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset(
                'assets/svg/clLogo.svg',
                fit: BoxFit.fitHeight,
              ),
            ),
            leadingWidth: widthy / 4,
          ),
          body: scrr()[pageBoy]),
    );
  }

  buildSignup1() {
    final widthy = MediaQuery.of(context).size.width;
    final heighty = MediaQuery.of(context).size.height;
    const btnStyle = MaterialStateProperty.all;
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Registration',
                      style: TextStyle(
                          color: blueTup.tupBlue,
                          fontSize: widthy / 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Enter your email address, we will send \nyou an OTP for Verification',
                    style: TextStyle(
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
            Center(child: SvgPicture.asset('assets/svg/fp.svg')),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: TextFormField(
                  cursorColor: blueTup.tupBlue,
                  style: TextStyle(color: blueTup.tupBlue),
                  decoration: InputDecoration(
                    //labels
                    labelText: 'Email',
                    labelStyle:
                        TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                    floatingLabelStyle: TextStyle(color: blueTup.tupBlue),

                    //Fill Colors

                    hintStyle:
                        TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
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
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      pageBoy++;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: btnStyle(blueTup.tupBlue),
                    //  elevation: btnStyle(4),
                    fixedSize: btnStyle(const Size(287, 52)),
                    shape: btnStyle(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
                  ),
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: widthy / 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildOTP2() {
    final widthy = MediaQuery.of(context).size.width;
    final heighty = MediaQuery.of(context).size.height;
    const btnStyle = MaterialStateProperty.all;
    double radd = 12;
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Enter Code',
                      style: TextStyle(
                          color: blueTup.tupBlue,
                          fontSize: widthy / 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Enter the 6-digit verifcation Code sent to\nyour Email',
                    style: TextStyle(
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
            Center(child: SvgPicture.asset('assets/svg/otpvg.svg')),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 54,
                    height: 58,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          setState(() {
                            radd == 27;
                          });
                          FocusScope.of(context).nextFocus();
                        }
                        if (value.isEmpty) {
                          setState(() {
                            radd == 12;
                          });
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      decoration: InputDecoration(
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(radd)),
                              borderSide: BorderSide(
                                  color: blueTup.tupBlue.withOpacity(.5),
                                  width: 1.5,
                                  style: BorderStyle.solid)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(radd)),
                              borderSide: BorderSide(
                                  color: blueTup.tupBlue,
                                  width: 1.5,
                                  style: BorderStyle.solid)),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15)),
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 54,
                    height: 58,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          setState(() {
                            radd == 27;
                          });
                          FocusScope.of(context).nextFocus();
                        }
                        if (value.isEmpty) {
                          setState(() {
                            radd == 12;
                          });
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      decoration: InputDecoration(
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(radd)),
                              borderSide: BorderSide(
                                  color: blueTup.tupBlue.withOpacity(.5),
                                  width: 1.5,
                                  style: BorderStyle.solid)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(radd)),
                              borderSide: BorderSide(
                                  color: blueTup.tupBlue,
                                  width: 1.5,
                                  style: BorderStyle.solid)),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15)),
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 54,
                    height: 58,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          setState(() {
                            radd == 27;
                          });
                          FocusScope.of(context).nextFocus();
                        }
                        if (value.isEmpty) {
                          setState(() {
                            radd == 12;
                          });
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      decoration: InputDecoration(
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(radd)),
                              borderSide: BorderSide(
                                  color: blueTup.tupBlue.withOpacity(.5),
                                  width: 1.5,
                                  style: BorderStyle.solid)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(radd)),
                              borderSide: BorderSide(
                                  color: blueTup.tupBlue,
                                  width: 1.5,
                                  style: BorderStyle.solid)),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15)),
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 54,
                    height: 58,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          setState(() {
                            radd == 27;
                          });
                          FocusScope.of(context).nextFocus();
                        }
                        if (value.isEmpty) {
                          setState(() {
                            radd == 12;
                          });
                          FocusScope.of(context).previousFocus();
                        }
                      },
                      decoration: InputDecoration(
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(radd)),
                              borderSide: BorderSide(
                                  color: blueTup.tupBlue.withOpacity(.5),
                                  width: 1.5,
                                  style: BorderStyle.solid)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(radd)),
                              borderSide: BorderSide(
                                  color: blueTup.tupBlue,
                                  width: 1.5,
                                  style: BorderStyle.solid)),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15)),
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Resend code in -- seconds",
                style: TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  pageBoy++;
                });
              },
              style: ButtonStyle(
                backgroundColor: btnStyle(blueTup.tupBlue),
                //  elevation: btnStyle(4),
                fixedSize: btnStyle(const Size(287, 52)),
                shape: btnStyle(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
              ),
              child: Text(
                'CONTINUE',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: widthy / 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  buildSignup3() {
    final widthy = MediaQuery.of(context).size.width;
    final heighty = MediaQuery.of(context).size.height;
    const btnStyle = MaterialStateProperty.all;
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Reset Password',
                      style: TextStyle(
                          color: blueTup.tupBlue,
                          fontSize: widthy / 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Set a new password to secure \nyour account',
                    style: TextStyle(
                      color: blueTup.tupBlue.withOpacity(.5),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(child: SvgPicture.asset('assets/svg/Rp.svg')),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                  children: [
                    SizedBox(
                      width: widthy / 1.2,
                      child: TextFormField(
                        cursorColor: blueTup.tupBlue,
                        style: TextStyle(color: blueTup.tupBlue),
                        decoration: InputDecoration(
                          //labels
                          labelText: 'New Password',
                          labelStyle:
                              TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                          floatingLabelStyle: TextStyle(color: blueTup.tupBlue),

                          //Prefix
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 15,
                            color: blueTup.tupBlue,
                          ),

                          //suffix
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.visibility_outlined,
                                size: 20,
                                color: blueTup.tupBlue,
                              )),

                          //Fill Colors

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
                      width: widthy / 1.2,
                      child: TextFormField(
                        cursorColor: blueTup.tupBlue,
                        style: TextStyle(color: blueTup.tupBlue),
                        decoration: InputDecoration(
                          //labels
                          labelText: 'Repeat Password',
                          labelStyle:
                              TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                          floatingLabelStyle: TextStyle(color: blueTup.tupBlue),

                          //Prefix
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 15,
                            color: blueTup.tupBlue,
                          ),

                          //suffix
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.visibility_outlined,
                                size: 20,
                                color: blueTup.tupBlue,
                              )),

                          //Fill Colors

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
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextButton(
              onPressed: () {
                _showalert();
              },
              style: ButtonStyle(
                backgroundColor: btnStyle(blueTup.tupBlue),
                //  elevation: btnStyle(4),
                fixedSize: btnStyle(const Size(287, 52)),
                shape: btnStyle(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
              ),
              child: Text(
                'SUBMIT',
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
                padding: const EdgeInsets.symmetric(vertical: 18),
                height: heighty / 2.1,
                width: widthy,
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Congratulations, \nyour password has been changed successfuly',
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
                            'Lets get you back on your investment journey',
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
                      height: 30,
                    ),
                    Center(child: SvgPicture.asset('assets/svg/alertvg.svg')),
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
                        'DONE',
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
