import 'package:get/get.dart';

import '../controllers/home-ctrl.dart';

class Quickie {
  final String pix;
  final String title;
  final String desc;

  Quickie({required this.pix, required this.title, required this.desc});
}

List<Quickie> quickieList = [
  Quickie(
      pix: 'assets/svg/vault.svg',
      title: 'Save',
      desc: '\n\nSave money on your \nBluetup account'),
  Quickie(
      pix: 'assets/svg/tupD.svg',
      title: 'Invest',
      desc: '\n\nInvest you fund with Bluetup\nand earn interest up to 50%'),
  Quickie(
      pix: 'assets/svg/flexy.svg',
      title: 'Top UP',
      desc: '\n\nFund your Bluetup\naccount, fast & easy'),
  Quickie(
      pix: 'assets/svg/withdraw.svg',
      title: 'Withdraw',
      desc: '\n\nWithdraw your fund to\nyour bank account'),
];

class Savings {
  final String pix;
  final String title;
  final String desc;
  final String price;
  final String intr;
  final String id;

  Savings(
      {required this.pix,
        required this.id,
      required this.title,
      required this.desc,
        required this.intr,
      required this.price});
}
final HomeCtrl homeCtrl = Get.put(HomeCtrl());
List<Savings> saver = [
  Savings(
      pix: 'assets/svg/vaulie.svg',
      title: 'Blue Vault',
      desc: 'Lock funds and earn\ninterest of up to 15% p.a',
      price: homeCtrl.saveDetails[0].balance, intr: homeCtrl.saveBlv.value, id: '6311f8cfcb4c2a20f564df05'),
  Savings(
      pix: 'assets/svg/piggy.svg',
      title: 'Tup Dollar',
      desc: 'Save your funds in US dollars\n& earn interest on it upto 10% p.',
      price: homeCtrl.saveDetails[2].balance, intr: homeCtrl.saveTDR.value, id: '6311f8f4cb4c2a20f564df09'),
  Savings(
      pix: 'assets/svg/muus.svg',
      title: 'Flexy Naira',
      desc: 'Save in your local currency and\nearn interests up to 9% p.a',
      price: homeCtrl.saveDetails[1].balance, intr:homeCtrl.saveFlx.value, id: '6311f904cb4c2a20f564df0b'),
  Savings(
      pix: 'assets/svg/withdraw.svg',
      title: 'Withdraw',
      desc: 'Withdraw your fund to\nyour bank account',
      price: homeCtrl.wit.value, intr: homeCtrl.saveTR.value, id: ''),
];
