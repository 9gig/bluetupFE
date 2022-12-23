import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../main.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  List addii = [
    'assets/images/inv26.png',
    'assets/images/inv23.png',
    'assets/images/inv22.png',
    'assets/images/inv24.png',
  ];
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
          title: const Text('About'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  'About Blutup',
                  style: TextStyle(
                      color: blueTup.tupBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: widthy / 22),
                ),
                SizedBox(
                  height: heighty / 6,
                  width: widthy,
                  child: _buildExplaier(),
                ),
                const SizedBox(
                  height: 25,
                ),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text:
                          'To help you manage and build and grow your wealth, make sound financial decisions.\nBluetup mission is aimed at given everyone the power to better manage & grow their own finances, via smart investing ans savings and we intend to be the best at this\n\n',
                      style: TextStyle(
                          color: blueTup.tupBlue.withOpacity(.7),
                          fontSize: widthy / 22,
                          fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Thank you for choosing Bluetup.',
                          style: TextStyle(
                              color: blueTup.tupBlue.withOpacity(.7),
                              fontSize: widthy / 22,
                              fontWeight: FontWeight.w400),
                        ),
                      ]),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      DottedText(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pharetra amet odio nunc in ut duis blandit. In leo faucibus quisque nibh.',
                        style: TextStyle(
                          color: blueTup.tupBlue.withOpacity(.7),
                          fontSize: widthy / 22,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DottedText(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pharetra amet odio nunc in ut duis blandit. In leo faucibus quisque nibh.',
                        style: TextStyle(
                          color: blueTup.tupBlue.withOpacity(.7),
                          fontSize: widthy / 22,
                        ),
                      ),
                    ],
                  ),
                ),
                const Image(image: AssetImage('assets/images/addi.png'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildExplaier() {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return ListView.builder(
        itemCount: addii.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) {
          return Container(
            height: heighty / 6.24,
            width: widthy / 1.1,
            margin: const EdgeInsets.only(right: 5),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(addii[i]), fit: BoxFit.fill)),
            child: SvgPicture.asset(
              'assets/svg/player.svg',
              fit: BoxFit.scaleDown,
            ),
          );
        });
  }
}

class DottedText extends Text {
  const DottedText(
    String data, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
  }) : super(
          '\u2022 $data',
          key: key,
          style: style,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
        );
}
