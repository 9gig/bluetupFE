import 'package:bluetup_inc/main.dart';
import 'package:bluetup_inc/screens/sub-savings/inner_page.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../config/currency.dart';
import '../../controllers/home-ctrl.dart';
import '../../models/actions.dart';

class SavingsPage extends StatefulWidget {
  const SavingsPage({Key? key}) : super(key: key);

  @override
  State<SavingsPage> createState() => _SavingsPageState();
}

class _SavingsPageState extends State<SavingsPage> {
  CurrencyFormatterSettings symbol = CurrencyFormatterSettings.ngn;
  final HomeCtrl homeCtrl = Get.put(HomeCtrl());
  var symb = '';
  bool atDolz = false;
  setCurry(val) {
    if (val) {
      setState(() {
        symbol = CurrencyFormatterSettings.usd;
        atDolz = true;
        symb = '\$';
      });
    } else {
      setState(() {
        symbol = CurrencyFormatterSettings.ngn;
        atDolz = false;
        symb = '₦';
      });
    }
  }

  rated(String vm) {
    var vB = int.parse(vm);
    int rate = 710;
    var result = vB / rate;
    return result.toString();
  }

  _amt(String amm) {
    if (amm == '') {
      return CurrencyFormatter.format(0.00, symbol);
    } else {
      return CurrencyFormatter.format(amm, symbol);
    }
  }
  var userData = GetStorage();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CurrencyPrefrence.getCurrencyPrefrence().then((value) => setCurry(value));
  }
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
        title: const Text('Savings'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset('assets/svg/alert-circle-perfecto.svg'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                height: heighty / 6,
                width: widthy,
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/Savings.png'),
                      fit: BoxFit.fitWidth,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Savings',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                        _amt(atDolz
                        ? rated(homeCtrl.saveBal
                            .toString())
              .toString()
                : homeCtrl.saveBal.toString()),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: widthy / 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: btnStyle(blueTup.tupYellow),
                            fixedSize: btnStyle(const Size(120, 30)),
                          ),
                          child: Text(
                            'Quick',
                            style: TextStyle(color: blueTup.tupBlue),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white, width: 1.5)),
                      child: Row(
                        children: const [
                          Text(
                            'NGN',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _saver(context),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.only(top: 20, bottom: 5),
                child: Text(
                  'Saving Challenge',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: widthy / 25),
                ),
              ),
              Container(
                width: widthy,
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildMili(
                        image: 'assets/images/mili.png',
                        title: 'Join the Millionairs club 💸',
                        desc:
                            'Join million of poeple saving and grow you wealth with ......'),
                    buildMili(
                        image: 'assets/images/jolly.png',
                        title: '#Xmas Jolly',
                        desc:
                            'Save for the festive season and get iterest on your savings....'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget _saver(BuildContext context) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          padding: const EdgeInsets.all(10),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: saver.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Get.to(() => SavingsInnerPage(
                      title: saver[index].title,
                  bal:saver[index]== 1?_amt(rated(saver[index].price)):_amt(atDolz
                      ? rated(saver[index].price)
                      : saver[index].price), innt: saver[index].intr, id: saver[index].id,
                    ));
              },
              child: Container(
                padding: const EdgeInsets.all(10),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset(quickieList[index].pix),
                        Text(saver[index]== 1?_amt(rated(saver[index].price)):_amt(atDolz
                            ? rated(saver[index].price)
                            : saver[index].price)),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                          text: saver[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: blueTup.tupBlue,
                              fontSize: widthy / 25),
                          children: <TextSpan>[
                            TextSpan(
                              text: quickieList[index].desc,
                              style: TextStyle(
                                  color: blueTup.tupBlue.withOpacity(.5),
                                  fontWeight: FontWeight.w400,
                                  fontSize: widthy / 30),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  buildMili({
    required String image,
    required String title,
    required String desc,
  }) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return Container(
      width: widthy / 2.15,
      // height: heighty / 3,
      // margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 3.0,
          color: const Color.fromARGB(255, 0, 4, 29).withOpacity(.05),
          // spreadRadius: .8,
          spreadRadius: 1,
          offset: const Offset(0, 0),
        )
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: widthy / 2.3,
              height: heighty / 9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover))),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: widthy / 33,
                fontWeight: FontWeight.w500,
                color: blueTup.tupBlue),
          ),
          Text(
            desc,
            style: TextStyle(
                fontSize: widthy / 35,
                fontWeight: FontWeight.w500,
                color: blueTup.tupBlue.withOpacity(.6)),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              child: Text('View More',
                  style: TextStyle(
                      fontSize: widthy / 32,
                      fontWeight: FontWeight.w500,
                      color: blueTup.tupBlue)),
            ),
          )
        ],
      ),
    );
  }
}
