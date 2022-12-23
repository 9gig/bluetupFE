import 'package:bluetup_inc/config/input_validation.dart';
import 'package:bluetup_inc/config/login_persist.dart';
import 'package:bluetup_inc/controllers/auth-ctrl.dart';
import 'package:bluetup_inc/main.dart';
import 'package:bluetup_inc/models/log_req.dart';
import 'package:bluetup_inc/screens/forgot_pass.dart';
import 'package:bluetup_inc/screens/main/major.dart';
import 'package:bluetup_inc/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin, InputValidationMixin {
  late AnimationController _controller;
  String phone = '';
  String pass = '';
  bool status = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _setter();
  }

  _setter() async {
    phone = await UserLoginPref.getPhoneNumber() ?? '';
    pass = await UserLoginPref.getPassword() ?? '';
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
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final LoginController log = Get.put(LoginController());

  var loginForm = GlobalKey<FormState>();
  final phoneNumber = TextEditingController();
  var password = TextEditingController();

  bool validatePhoneAndSave() {
    final form = loginForm.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  bool isObscure = true;
  var isFingerAllowed = false;

  @override
  Widget build(BuildContext context) {
    final widthy = MediaQuery.of(context).size.width;
    final heighty = MediaQuery.of(context).size.height;
    const btnStyle = MaterialStateProperty.all;
    return Scaffold(
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
        body: Obx(() {
          return SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                        child: SvgPicture.asset('assets/svg/loginintro.svg')),
                    const SizedBox(
                      height: 60,
                    ),
                    Column(
                      children: [
                        Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: blueTup.tupBlue,
                              fontSize: widthy / 20,
                              fontFamily: 'Titillium_Web',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            'Welcome to Bluetup\nLogin into your account',
                            style: TextStyle(
                              color: blueTup.tupBlue,
                              fontSize: widthy / 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                          key: loginForm,
                          child: Column(
                            children: [
                              TextFormField(
                                cursorColor: blueTup.tupBlue,
                                initialValue: phone,
                                // controller: phoneNumber,
                                onChanged: (v) => setState(() {
                                  phone = v;
                                }),
                                validator: (phoneNumber) {
                                  if (phoneNumber!.isEmpty || phone == '') {
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
                                  labelStyle: TextStyle(
                                      color: blueTup.tupBlue.withOpacity(.5)),
                                  floatingLabelStyle:
                                      TextStyle(color: blueTup.tupBlue),

                                  //Fill Colors

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
                                            image: const AssetImage(
                                                'assets/images/NG.png'),
                                            width: widthy / 20,
                                          ),
                                          const Text('+234'),
                                          SvgPicture.asset(
                                              'assets/svg/arri.svg')
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(6)),
                                      borderSide: BorderSide(
                                          color:
                                              blueTup.tupBlue.withOpacity(.5),
                                          width: 1.5,
                                          style: BorderStyle.solid)),

                                  errorBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedErrorBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                cursorColor: blueTup.tupBlue,
                                initialValue: pass,
                                onChanged: (v) => setState(() {
                                  pass = v;
                                }),
                                // controller: password,
                                validator: (pass) {
                                  if (isPasswordValid(pass)) {
                                    return null;
                                  } else {
                                    return 'Invalid Password format';
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
                                          isObscure = !isObscure;
                                        });
                                      },
                                      icon: Icon(
                                        isObscure
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(6)),
                                      borderSide: BorderSide(
                                          color:
                                              blueTup.tupBlue.withOpacity(.5),
                                          width: 1.5,
                                          style: BorderStyle.solid)),

                                  errorBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedErrorBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                ),
                                obscureText: isObscure,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const ForgotPassword());
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: blueTup.tupBlue,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
// if(isFingerAllowed)
                    Visibility(
                      visible: status,
                      child: InkWell(
                          onTap: () async {
                            final isAuthenticated =
                                await LocalAuthy.authenticate();

                            if (isAuthenticated) {
                              final loginDetails = LoginReq(
                                  phone: '+234' + phone, password: pass);
                              log.login(loginDetails);
                            }
                            // JUST CHECKING IF FINGERPRINT AND BIOMETRICS IS AVAILABLE
                            // final isAvailable = await LocalAuthy.hasBiometrics();
                            // final biometrics = await LocalAuthy.getBiometrics();

                            // final hasFingerprint =
                            //     biometrics.contains(BiometricType.fingerprint);

                            // showDialog(
                            //   context: context,
                            //   builder: (context) => AlertDialog(
                            //     title: Text('Availability'),
                            //     content: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       mainAxisSize: MainAxisSize.min,
                            //       children: [
                            //         buildText('Biometrics', isAvailable),
                            //         buildText('Fingerprint', hasFingerprint),
                            //       ],
                            //     ),
                            //   ),
                            // );
                          },
                          child: SvgPicture.asset(
                            'assets/svg/finger.svg',
                            width: 70,
                            height: 70,
                            color: blueTup.tupBlue,
                          )),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    //Button
                    Column(
                      children: [
                        TextButton(
                          onPressed: () async {
                            if (validatePhoneAndSave()) {
                              await UserLoginPref.setPhoneNumber(phone);
                              await UserLoginPref.setPassword(pass);
                              final loginDetails = LoginReq(
                                  phone: '+234' + phone, password: pass);
                              log.login(loginDetails);
                              // print(loginDetails.phone);
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: btnStyle(blueTup.tupBlue),
                            //  elevation: btnStyle(4),
                            fixedSize: btnStyle(const Size(287, 52)),
                            shape: btnStyle(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6))),
                          ),
                          child: log.isLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: widthy / 24,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account?"),
                              const SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                  onTap: () => Get.to(() => const SignUpPage()),
                                  child: Text(
                                    'Signup',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: blueTup.tupBlue,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ));
        }));
  }

  Widget buildText(String text, bool checked) => Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            checked
                ? Icon(Icons.check, color: Colors.green, size: 24)
                : Icon(Icons.close, color: Colors.red, size: 24),
            const SizedBox(width: 12),
            Text(text, style: TextStyle(fontSize: 24)),
          ],
        ),
      );
}
