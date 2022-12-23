import 'dart:ui';

import 'package:bluetup_inc/config/input_validation.dart';
import 'package:bluetup_inc/controllers/auth-ctrl.dart';
import 'package:bluetup_inc/main.dart';
import 'package:bluetup_inc/models/register.dart';
import 'package:bluetup_inc/screens/login.dart';
import 'package:bluetup_inc/server/remote.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pinput/pinput.dart';

import '../models/createRef.dart';
import '../models/getOtp.dart';
import '../server/dynamic_link_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

var phoneKey = GlobalKey<FormState>();
var profileKey = GlobalKey<FormState>();

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin, InputValidationMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  late String code;
  bool obscured = true;
  bool obscured2 = true;
  var pass1 = TextEditingController();
  var pass2 = TextEditingController();
  var email = TextEditingController();
  var last = TextEditingController();
  var first = TextEditingController();
  final phoneNumber = TextEditingController();

  _codeSetter(String coded) {
    code = coded;
  }

  int pageBoy = 0;
  List scrr() => [buildSignup1(), buildSignup2(), buildSignup3()];

  checkPageBoy() {
    if (pageBoy > 0) {
      setState(() {
        pageBoy -= 1;
      });
    } else {
      Get.back();
    }
  }

  final SignUpController signUpController = Get.put(SignUpController());

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

    bool validatePhoneAndSave() {
      final form = phoneKey.currentState;
      if (form!.validate()) {
        form.save();
        return true;
      } else {
        return false;
      }
    }

    return Obx(() {
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
                      'Enter your mobile number, we will send \nyou an OTP for Verification',
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
              Center(child: SvgPicture.asset('assets/svg/regvv.svg')),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: phoneKey,
                  child: TextFormField(
                    cursorColor: blueTup.tupBlue,
                    controller: phoneNumber,
                    validator: (phoneNumber) {
                      if (phoneNumber!.isEmpty) {
                        return ('A phone number is required to proceed');
                      }
                      if (isPhoneValid(phoneNumber)) {
                        return null;
                      } else {
                        return ('incorrect format');
                      }
                    },
                    style: TextStyle(color: blueTup.tupBlue),
                    decoration: InputDecoration(
                      //labels
                      labelText: 'Phone Number',
                      labelStyle:
                          TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                      floatingLabelStyle: TextStyle(color: blueTup.tupBlue),

                      //Fill Colors
                      hintText: '80XXXXXX57',
                      hintStyle:
                          TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                      //Prefix
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(1.2),
                        margin: const EdgeInsets.only(right: 5),
                        width: widthy / 4.3,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                bottomLeft: Radius.circular(6))),
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Image(
                                image: const AssetImage('assets/images/NG.png'),
                                width: widthy / 20,
                              ),
                              const Text('+234'),
                              SvgPicture.asset('assets/svg/arri.svg')
                            ],
                          ),
                        ),
                      ),

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
              ),
              Text(
                'Enter your mobile number without the first digit',
                style: TextStyle(color: blueTup.tupBlue.withOpacity(.3)),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () async {
                      if (validatePhoneAndSave()) {
                        var phonie = "+234${phoneNumber.text}";

                        GetOtp phone = GetOtp(phone: phonie);
                        signUpController.fetchCode(phone).then((rez) => {
                              if (rez)
                                {
                            print ( GetStorage().read('Code')),
                                  setState(() {
                                    pageBoy++;
                                  })
                                }
                              else
                                {
                                  Get.snackbar('Bluetup', 'An Error Occured',
                                      colorText: Colors.white,
                                      backgroundColor: Colors.red,
                                      borderRadius: 5)
                                }
                            });

                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: btnStyle(blueTup.tupBlue),
                      //  elevation: btnStyle(4),
                      fixedSize: btnStyle(const Size(287, 52)),
                      shape: btnStyle(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                    ),
                    child: signUpController.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'SEND VIA SMS',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: widthy / 24,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: btnStyle(blueTup.tupGreen),
                      //  elevation: btnStyle(4),
                      fixedSize: btnStyle(const Size(287, 52)),
                      shape: btnStyle(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                    ),
                    child: Text(
                      'SEND VIA WHATSAPP',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: widthy / 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  buildSignup2() {
    final widthy = MediaQuery.of(context).size.width;
    final heighty = MediaQuery.of(context).size.height;
    const btnStyle = MaterialStateProperty.all;
    var pinner = TextEditingController();

    // @override
    // void dispose() {
    //   pinner.dispose();
    //   super.dispose();
    // }

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      margin: const EdgeInsets.all(11),
      textStyle: TextStyle(
          fontSize: 20, color: blueTup.tupBlue, fontWeight: FontWeight.w500),
      decoration: BoxDecoration(
        border: Border.all(color: blueTup.tupBlue.withOpacity(.8), width: 1.3),
        borderRadius: BorderRadius.circular(15),
      ),
    );

    var otp1 = TextEditingController();
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
                    'Enter the 6-digit verifcation Code sent to your mobile number',
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
                  child: Column(
                children: [
                  // OtpTextField(
                  //   numberOfFields: 4,
                  //   margin: const EdgeInsets.symmetric(horizontal: 20),
                  //   onSubmit: (pin) {
                  //     setState(() {
                  //       code = pin;
                  //     });
                  //     var phonie = '+234${phoneNumber.text}';
                  //     print({"phone": phonie, '\n' "code": code});
                  //   },
                  // ),
                  Pinput(
                      defaultPinTheme: defaultPinTheme,
                      // controller: pinner,
                      onCompleted: (pin) => _codeSetter(pin)
                      //  {
                      //   setState(() {
                      //     code = pin;
                      //   });
                      //   var phonie = '+234${phoneNumber.text}';
                      //   print({"phone": phonie, '\n' "code": code});
                      // },
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
                      var phonie = '+234' + phoneNumber.text + '/';
                      setState(() {
                        pageBoy++;
                      });
                      // print({"phone": phonie, '\n' "code": code});
                      //   if (otp != '') {
                      //     print(otp);
                      //     setState(() {
                      //       pageBoy++;
                      //     });
                      //   } else {
                      //     return null;
                      //   }
                      CheckOtp model = CheckOtp(phone: phonie, code: code);
                      RemoteService.checkCode(phonie, code).then((response) => {
                            if (response)
                              {
                                setState(() {
                                  pageBoy++;
                                })
                              }
                            else
                              {
                                const GetSnackBar(
                                  messageText: Text('Invalid Code'),
                                )
                              }
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
                ],
              )),
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
    bool validateProfileAndSave() {
      final form = profileKey.currentState;
      if (form!.validate()) {
        form.save();
        return true;
      } else {
        return false;
      }
    }

    return Obx(() {
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
                      'Enter your mobile number, we will send \nyou an OTP for Verification',
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
              Center(child: SvgPicture.asset('assets/svg/profilevg.svg')),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: profileKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: widthy / 2.5,
                            child: TextFormField(
                              cursorColor: blueTup.tupBlue,
                              controller: first,
                              validator: (first) {
                                if (first!.isEmpty) {
                                  return 'This field is required';
                                }
                              },
                              style: TextStyle(color: blueTup.tupBlue),
                              decoration: InputDecoration(
                                //labels
                                labelText: 'First Name',
                                labelStyle: TextStyle(
                                    color: blueTup.tupBlue.withOpacity(.5)),
                                floatingLabelStyle:
                                    TextStyle(color: blueTup.tupBlue),

                                //Fill Colors

                                hintStyle: TextStyle(
                                    color: blueTup.tupBlue.withOpacity(.5)),
                                //Prefix

                                //Borders
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: blueTup.tupBlue,
                                        width: 1.5,
                                        style: BorderStyle.solid)),
                                enabled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6)),
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
                            width: widthy / 2.5,
                            child: TextFormField(
                              cursorColor: blueTup.tupBlue,
                              controller: last,
                              validator: (last) {
                                if (last!.isEmpty) {
                                  return 'This field is required';
                                }
                              },
                              style: TextStyle(color: blueTup.tupBlue),
                              decoration: InputDecoration(
                                //labels
                                labelText: 'Last Name',
                                labelStyle: TextStyle(
                                    color: blueTup.tupBlue.withOpacity(.5)),
                                floatingLabelStyle:
                                    TextStyle(color: blueTup.tupBlue),

                                //Fill Colors

                                hintStyle: TextStyle(
                                    color: blueTup.tupBlue.withOpacity(.5)),
                                //Prefix

                                //Borders
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: blueTup.tupBlue,
                                        width: 1.5,
                                        style: BorderStyle.solid)),
                                enabled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6)),
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
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: widthy / 1.2,
                        child: TextFormField(
                          cursorColor: blueTup.tupBlue,
                          controller: email,
                          validator: (email) {
                            if (email!.isEmpty) {
                              return 'Please enter your email address';
                            }
                            if (isEmailValid(email)) {
                              return null;
                            } else {
                              return 'Invalid email address';
                            }
                          },
                          style: TextStyle(color: blueTup.tupBlue),
                          decoration: InputDecoration(
                            //labels
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                color: blueTup.tupBlue.withOpacity(.5)),
                            floatingLabelStyle:
                                TextStyle(color: blueTup.tupBlue),

                            //Fill Colors

                            hintStyle: TextStyle(
                                color: blueTup.tupBlue.withOpacity(.5)),
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
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: widthy / 1.2,
                        child: TextFormField(
                          cursorColor: blueTup.tupBlue,
                          controller: pass1,
                          validator: (pass) {
                            if (pass!.isEmpty) {
                              return 'This field is required';
                            }
                            if (pass.length < 6) {
                              return 'password lenght should be greater than 6 characters';
                            }
                          },
                          style: TextStyle(color: blueTup.tupBlue),
                          decoration: InputDecoration(
                            //labels
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: blueTup.tupBlue.withOpacity(.5)),
                            floatingLabelStyle:
                                TextStyle(color: blueTup.tupBlue),

                            //Prefix
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 15,
                              color: blueTup.tupBlue,
                            ),

                            //suffix
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscured = !obscured;
                                  });
                                },
                                icon: Icon(
                                  obscured
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
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
                          obscureText: obscured,
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
                          validator: (pass2) {
                            if (pass2!.isEmpty) {
                              return 'You havent confirmed your password';
                            }

                            if (pass2 != pass1.text) {
                              return 'Passwords do not match';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            //labels
                            labelText: 'Repeat Password',
                            labelStyle: TextStyle(
                                color: blueTup.tupBlue.withOpacity(.5)),
                            floatingLabelStyle:
                                TextStyle(color: blueTup.tupBlue),

                            //Prefix
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 15,
                              color: blueTup.tupBlue,
                            ),

                            //suffix
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscured2 = !obscured2;
                                  });
                                },
                                icon: Icon(
                                  obscured2
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
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
                          obscureText: obscured2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                    text: 'By registering, you confirm that you accept our',
                    style: TextStyle(
                        color: blueTup.tupBlue.withOpacity(.5),
                        fontSize: widthy / 27),
                    children: <TextSpan>[
                      TextSpan(
                          text: '\nterms of use',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                              color: blueTup.tupBlue,
                              fontSize: widthy / 27),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // navigate to desired screen
                            }),
                      TextSpan(
                          text: ' and',
                          style: TextStyle(
                              color: blueTup.tupBlue.withOpacity(.5),
                              fontSize: widthy / 27),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // navigate to desired screen
                            }),
                      TextSpan(
                          text: ' privacy policy',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                              color: blueTup.tupBlue,
                              fontSize: widthy / 27),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // navigate to desired screen
                            })
                    ]),
              ),
              const SizedBox(
                height: 25,
              ),
              TextButton(
                onPressed: () {
                  if (validateProfileAndSave()) {
                    final RegisterModel mod = RegisterModel(
                        firstName: first.text,
                        lastName: last.text,
                        phone: '+234${phoneNumber.text}',
                        email: email.text,
                        password: pass1.text);
                    signUpController.register(mod).then((rez) => {
                          if (rez == 'success')
                            {_showalert()}
                          else
                            {
                              Get.snackbar(
                                  'Registration Error', rez,
                                  colorText: Colors.white,
                                  borderRadius: 5,
                                  backgroundColor: Colors.red,
                                  margin: const EdgeInsets.all(10))
                            }
                        });
                  } else {
                    Get.snackbar('Form Error',
                        'Some fields have erorr, please check them and try again',
                        colorText: Colors.white,
                        borderRadius: 5,
                        backgroundColor: Colors.red,
                        margin: const EdgeInsets.all(10));
                  }
                },
                style: ButtonStyle(
                  backgroundColor: btnStyle(blueTup.tupBlue),
                  //  elevation: btnStyle(4),
                  fixedSize: btnStyle(const Size(287, 52)),
                  shape: btnStyle(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6))),
                ),
                child: signUpController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Text(
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
    });
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
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Congratulations, You are \nnow Registered',
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
                            'Start using the app, invest , save\nand grow you finane the right way',
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
                        Get.offAll(const LoginPage());
                      },
                      style: ButtonStyle(
                        backgroundColor: btnStyle(blueTup.tupBlue),
                        //  elevation: btnStyle(4),
                        fixedSize: btnStyle(const Size(237, 52)),
                        shape: btnStyle(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                      ),
                      child: Text(
                        'START',
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
