import 'package:bluetup_inc/screens/sub-profile/bank.dart';
import 'package:bluetup_inc/screens/sub-profile/card.dart';
import 'package:bluetup_inc/screens/sub-profile/kyc.dart';
import 'package:bluetup_inc/screens/sub-profile/next-of-kin.dart';
import 'package:bluetup_inc/screens/sub-profile/personal.dart';
import 'package:bluetup_inc/screens/sub-profile/security.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff8f9fb),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: blueTup.tupBlue,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const Text('Profile'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: blueTup.tupBlue,
                        radius: 38,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Ayomide Jackson',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      const Text('emaillord34@gmail.com'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    lizzty(
                        pix: SvgPicture.asset('assets/svg/user.svg'),
                        title: 'Personal Infomation',
                        onClicked: () =>
                            Get.to(() => const PersonalInfoPage())),
                    lizzty(
                        pix: SvgPicture.asset('assets/svg/nk.svg'),
                        title: 'Next of Kin',
                        onClicked: () => Get.to(() => const NextOfKinPage())),
                    lizzty(
                        pix: SvgPicture.asset('assets/svg/KYC.svg'),
                        title: 'Update KYC',
                        onClicked: () => Get.to(() => const KycPage())),
                    lizzty(
                        pix: SvgPicture.asset('assets/svg/landmark.svg'),
                        title: 'Bank Details',
                        onClicked: () => Get.to(() => const BankDetailsPage())),
                    lizzty(
                        pix: SvgPicture.asset('assets/svg/credit-card.svg'),
                        title: 'Your cards',
                        onClicked: () => Get.to(() => const CardDetails())),
                    lizzty(
                        pix: SvgPicture.asset('assets/svg/key.svg'),
                        title: 'Password And Security',
                        onClicked: () =>
                            Get.to(() => const SecuritySettings())),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  lizzty(
      {required SvgPicture pix,
      required String title,
      VoidCallback? onClicked}) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onClicked,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        width: widthy,
        height: heighty / 13,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              color: const Color.fromARGB(255, 0, 4, 29).withOpacity(.05),
              // spreadRadius: .8,
              spreadRadius: 1,
              offset: const Offset(0, 0),
            )
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: ListTile(
          onTap: onClicked,
          leading: pix,
          title: Text(title),
          trailing: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: blueTup.tupBlue.withOpacity(.15),
                shape: BoxShape.circle),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: blueTup.tupBlue,
              size: 15,
            ),
          ),
        ),
      ),
    );
  }
}
