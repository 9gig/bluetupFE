import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../main.dart';
import '../../models/login_res.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final userData = loginResponseFromJson(jsonDecode(GetStorage().read('User')));
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
        title: const Text('Personal Information'),
        centerTitle: true,
      ),
      body: buildPersonal(),
    );
  }

  buildPersonal() {
    final widthy = MediaQuery.of(context).size.width;
    final heighty = MediaQuery.of(context).size.height;
    const btnStyle = MaterialStateProperty.all;
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: widthy / 2.2,
                    child: TextFormField(
                      cursorColor: blueTup.tupBlue,
                      initialValue: userData.data.firstName,
                      readOnly: true,
                      style: TextStyle(color: blueTup.tupBlue),
                      decoration: InputDecoration(
                        //labels

                        labelStyle:
                            TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                        floatingLabelStyle: TextStyle(color: blueTup.tupBlue),
                        labelText: 'First Name',
                        //Fill Colors
                        hintText: userData.data.firstName,
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
                  SizedBox(
                    width: widthy / 2.2,
                    child: TextFormField(
                      readOnly: true,
                      cursorColor: blueTup.tupBlue,
                      initialValue: userData.data.lastName,
                      style: TextStyle(color: blueTup.tupBlue),
                      decoration: InputDecoration(
                        //labels

                        labelStyle:
                            TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                        floatingLabelStyle: TextStyle(color: blueTup.tupBlue),

                        //Fill Colors
                        hintText: userData.data.lastName,
                        hintStyle: TextStyle(color: blueTup.tupBlue),
                        //Prefix
                        labelText: 'Last Name',
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
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: widthy / 1.06,
                child: TextFormField(
                  readOnly: true,
                  initialValue: 'Male',
                  cursorColor: blueTup.tupBlue,
                  style: TextStyle(color: blueTup.tupBlue),
                  decoration: InputDecoration(
                    //labels
                    hintText: 'Male',
                    labelStyle:
                        TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                    floatingLabelStyle: TextStyle(color: blueTup.tupBlue),

                    //Fill Colors
                    labelText: 'Gender',
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
                height: 30,
              ),
              SizedBox(
                width: widthy / 1.06,
                child: TextFormField(
                  readOnly: true,
                  initialValue: userData.data.email,
                  cursorColor: blueTup.tupBlue,
                  style: TextStyle(color: blueTup.tupBlue),
                  decoration: InputDecoration(
                    //labels
                    hintText: userData.data.email,
                    labelStyle:
                        TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                    floatingLabelStyle: TextStyle(color: blueTup.tupBlue),

                    //Fill Colors

                    hintStyle: TextStyle(color: blueTup.tupBlue),
                    //Prefix
                    labelText: 'Email',
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
                height: 30,
              ),
              SizedBox(
                width: widthy / 1.06,
                child: TextFormField(
                  readOnly: true,
                  initialValue: userData.data.email,
                  cursorColor: blueTup.tupBlue,
                  style: TextStyle(color: blueTup.tupBlue),
                  decoration: InputDecoration(
                    //labels
                    hintText: userData.data.email,
                    labelStyle:
                        TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                    floatingLabelStyle: TextStyle(color: blueTup.tupBlue),

                    //Fill Colors

                    hintStyle: TextStyle(color: blueTup.tupBlue),
                    //Prefix
                    labelText: 'Phone Number',
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
                height: 30,
              ),
              SizedBox(
                width: widthy / 1.06,
                child: TextFormField(
                  readOnly: true,
                  initialValue: userData.data.email,
                  cursorColor: blueTup.tupBlue,
                  style: TextStyle(color: blueTup.tupBlue),
                  decoration: InputDecoration(
                    //labels
                    hintText: userData.data.email,
                    labelStyle:
                        TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                    floatingLabelStyle: TextStyle(color: blueTup.tupBlue),

                    //Fill Colors

                    hintStyle: TextStyle(color: blueTup.tupBlue),
                    //Prefix
                    labelText: 'Date of Birth',
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
                height: 30,
              ),
              SizedBox(
                width: widthy / 1.06,
                child: TextFormField(
                  readOnly: true,
                  initialValue: userData.data.email,
                  cursorColor: blueTup.tupBlue,
                  style: TextStyle(color: blueTup.tupBlue),
                  decoration: InputDecoration(
                    //labels
                    hintText: 'user Occupation',
                    labelStyle:
                        TextStyle(color: blueTup.tupBlue.withOpacity(.5)),
                    floatingLabelStyle: TextStyle(color: blueTup.tupBlue),

                    //Fill Colors

                    hintStyle: TextStyle(color: blueTup.tupBlue),
                    //Prefix
                    labelText: 'Occupation',
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
                height: 30,
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
      ),
    );
  }
}
