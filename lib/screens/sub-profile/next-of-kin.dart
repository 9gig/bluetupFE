import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../main.dart';

class NextOfKinPage extends StatefulWidget {
  const NextOfKinPage({Key? key}) : super(key: key);

  @override
  State<NextOfKinPage> createState() => _NextOfKinPageState();
}

class _NextOfKinPageState extends State<NextOfKinPage> {
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
            SvgPicture.asset('assets/svg/alert-circle-big.svg'),
            Text(
              'Your next of kin details is important, because they are\nthe closest relative we can reach, if we are unable\nto contact you after a very long time',
              style: TextStyle(color: blueTup.tupBlue),
              textAlign: TextAlign.center,
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
                      width: widthy,
                      child: TextFormField(
                        cursorColor: blueTup.tupBlue,
                        style: TextStyle(color: blueTup.tupBlue),
                        decoration: InputDecoration(
                          //labels
                          labelText: 'Full Name',
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
                          labelText: 'Gender',
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
                          labelText: 'Email',
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
                          labelText: 'Phone Number',
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
                          labelText: 'Date of Birth',
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
                          labelText: 'Relationship',
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
                          labelText: 'Contact Address',
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
                'NEXT',
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
