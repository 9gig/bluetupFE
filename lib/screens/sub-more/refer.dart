import 'package:bluetup_inc/server/dynamic_link_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../controllers/ref-ctrl.dart';
import '../../main.dart';

class ReferPage extends StatefulWidget {
  const ReferPage({Key? key}) : super(key: key);

  @override
  State<ReferPage> createState() => _ReferPageState();
}

class _ReferPageState extends State<ReferPage> {

final Refer refer = Get.put(Refer());


  @override
  void initState() {
    super.initState();
    refer.getReferDetails();
    // TODO: implement initState
  }
  @override
  Widget build(BuildContext context) {
    // const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
          title: const Text('Refer & Earn'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Obx((){
            if(refer.isLoading.value){
              return Center(
                child: CircularProgressIndicator(
                  color: blueTup.tupBlue,
                ),
              );

            }else{
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          text: 'Refer a Friend\n',
                          style: TextStyle(
                              color: blueTup.tupBlue,
                              fontSize: widthy / 20,
                              fontWeight: FontWeight.w500),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'And Earn up to ₦1000 per referral',
                              style: TextStyle(
                                  color: blueTup.tupBlue,
                                  fontWeight: FontWeight.w400,
                                  fontSize: widthy / 25),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/alert-circle-perfecto.svg'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'How it works',
                          style: TextStyle(
                              color: blueTup.tupBlue,
                              fontWeight: FontWeight.w500,
                              fontSize: widthy / 23),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      width: widthy,
                      height: heighty / 6.68,
                      decoration: BoxDecoration(
                          color: blueTup.tupBlue,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset('assets/svg/Groupon1.svg'),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          SvgPicture.asset('assets/svg/Groupon2.svg'),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          SvgPicture.asset('assets/svg/Groupon3.svg'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Your Referral Code',
                      style: TextStyle(
                          color: blueTup.tupBlue,
                          fontWeight: FontWeight.w500,
                          fontSize: widthy / 23),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {

                        Clipboard.setData( ClipboardData(text: refer.code.value))
                            .then((value) => {
                          GetSnackBar(
                            messageText: Row(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Copied"),
                              ],
                            ),
                            backgroundColor: Colors.green,
                            margin: const EdgeInsets.all(10),
                          )
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: widthy,
                        decoration: const BoxDecoration(
                          // color: Color(0xffFFFFB3),
                            image: DecorationImage(
                                image: AssetImage('assets/images/referal box.png'),
                                fit: BoxFit.fill)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              refer.code.value,
                              style: TextStyle(
                                  color: blueTup.tupBlue,
                                  fontSize: widthy / 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Tap to copy',
                              style: TextStyle(
                                color: blueTup.tupBlue,
                                fontSize: widthy / 25,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: ()async{
                      await Share.share(refer.link.value);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: widthy,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff99FFC8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Share your Referral code',
                              style: TextStyle(
                                  color: blueTup.tupBlue,
                                  fontSize: widthy / 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/svg/fb.svg'),
                                const SizedBox(
                                  width: 5,
                                ),
                                SvgPicture.asset('assets/svg/tweet.svg'),
                                const SizedBox(
                                  width: 5,
                                ),
                                SvgPicture.asset('assets/svg/insta.svg'),
                                const SizedBox(
                                  width: 5,
                                ),
                                SvgPicture.asset('assets/svg/mail.svg')
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: widthy,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3.0,
                              color: const Color.fromARGB(255, 0, 4, 29)
                                  .withOpacity(.05),
                              // spreadRadius: .8,
                              spreadRadius: 1,
                              offset: const Offset(0, 0),
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                    text: 'Referred\n',
                                    style: TextStyle(
                                        color: blueTup.tupBlue.withOpacity(.7),
                                        fontSize: widthy / 26,
                                        fontWeight: FontWeight.w400),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: refer.referrals.length.toString(),
                                        style: TextStyle(
                                            color: blueTup.tupBlue,
                                            fontWeight: FontWeight.w500,
                                            fontSize: widthy / 23),
                                      ),
                                    ]),
                              ),
                              RichText(
                                textAlign: TextAlign.right,
                                text: TextSpan(
                                    text: 'Referred with Savings\n',
                                    style: TextStyle(
                                        color: blueTup.tupBlue.withOpacity(.7),
                                        fontSize: widthy / 26,
                                        fontWeight: FontWeight.w400),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '0',
                                        style: TextStyle(
                                            color: blueTup.tupBlue,
                                            fontWeight: FontWeight.w500,
                                            fontSize: widthy / 23),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 1.3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                    text: 'Total Bonus Earned\n',
                                    style: TextStyle(
                                        color: blueTup.tupBlue.withOpacity(.7),
                                        fontSize: widthy / 26,
                                        fontWeight: FontWeight.w400),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '₦0.00',
                                        style: TextStyle(
                                            color: blueTup.tupBlue,
                                            fontWeight: FontWeight.w500,
                                            fontSize: widthy / 23),
                                      ),
                                    ]),
                              ),
                              RichText(
                                textAlign: TextAlign.right,
                                text: TextSpan(
                                    text: 'Bonus Per referral\n',
                                    style: TextStyle(
                                        color: blueTup.tupBlue.withOpacity(.7),
                                        fontSize: widthy / 26,
                                        fontWeight: FontWeight.w400),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '₦1000',
                                        style: TextStyle(
                                            color: blueTup.tupBlue,
                                            fontWeight: FontWeight.w500,
                                            fontSize: widthy / 23),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 1.3,
                          ),
                          Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: 'Next Payout Date\n',
                                  style: TextStyle(
                                      color: blueTup.tupBlue.withOpacity(.7),
                                      fontSize: widthy / 26,
                                      fontWeight: FontWeight.w400),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '1st Nov, 2022',
                                      style: TextStyle(
                                          color: blueTup.tupBlue,
                                          fontWeight: FontWeight.w500,
                                          fontSize: widthy / 23),
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: '*T&C',
                            style: TextStyle(
                                color: blueTup.tupBlue,
                                fontSize: widthy / 26,
                                fontWeight: FontWeight.w500),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Applied',
                                style: TextStyle(
                                    color: blueTup.tupBlue,
                                    fontWeight: FontWeight.w400,
                                    fontSize: widthy / 23),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              );
            }
          })
        ),
      ),
    );
  }


}
