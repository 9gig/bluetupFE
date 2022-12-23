import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../main.dart';

class KycPage extends StatefulWidget {
  const KycPage({Key? key}) : super(key: key);

  @override
  State<KycPage> createState() => _KycPageState();
}

class _KycPageState extends State<KycPage> {
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
        title: const Text('Personal Information'),
        centerTitle: true,
      ),
      body: buildNextOFKin(),
    );
  }

  buildNextOFKin() {
    final widthy = MediaQuery.of(context).size.width;
    final heighty = MediaQuery.of(context).size.height;
    const btnStyle = MaterialStateProperty.all;
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Container(
              width: widthy,
              height: heighty / 6,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black26),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/camera.svg'),
                    const Text(
                      'Please upload a valid ID Image\n(Intl Passport, NIN, Driver license,Voter Card)',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    )
                  ]),
            ),
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
                          labelText: 'Contact Address',
                          labelStyle:
                              TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                          floatingLabelStyle: TextStyle(color: blueTup.tupBlue),

                          //Fill Colors
                          hintText: 'e.g No ebdcjbfbbvbvjjdnv',
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
                      width: widthy / 1.2,
                      child: TextFormField(
                        cursorColor: blueTup.tupBlue,
                        style: TextStyle(color: blueTup.tupBlue),
                        decoration: InputDecoration(
                          //labels
                          labelText: 'Country',
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
                      width: widthy / 1.2,
                      child: TextFormField(
                        cursorColor: blueTup.tupBlue,
                        style: TextStyle(color: blueTup.tupBlue),
                        decoration: InputDecoration(
                          //labels
                          labelText: 'State of Residence',
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
                      width: widthy / 1.2,
                      child: TextFormField(
                        cursorColor: blueTup.tupBlue,
                        style: TextStyle(color: blueTup.tupBlue),
                        decoration: InputDecoration(
                          //labels
                          labelText: 'City',
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
                'Save',
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
