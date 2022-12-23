import 'dart:io';

import 'package:bluetup_inc/config/payments/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartPayment {
  BuildContext ctx;
  int price;
  String email;

  StartPayment(this.ctx, this.price, this.email);

  // Call Paystack Plugin
  PaystackPlugin paystack = PaystackPlugin();

  //Create Ref
  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  //Card UI Logic
  PaymentCard _getCardUI() {
    String cardi = "";
    String cvv = "";
    int expMonth = 0;
    int expYear = 0;

    return PaymentCard(
        number: cardi, cvc: cvv, expiryMonth: expMonth, expiryYear: expYear);
  }

  // Method to init Plugin
  Future initPlugin() async {
    await paystack.initialize(publicKey: PaystackSecret.PUBKEY);
  }

//Charge card method
  chargeCardToPayment() async {
    initPlugin().then((_) async {
      Charge charge = Charge()
        ..amount = price * 100
        ..email = email
        ..reference = _getReference()
        ..card = _getCardUI();

      CheckoutResponse rez = await paystack.checkout(
        ctx,
        charge: charge,
        method: CheckoutMethod.card,
        fullscreen: false,
        logo: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: SvgPicture.asset(
            'assets/svg/clLogo.svg',
            fit: BoxFit.fitHeight,
          ),
        ),
      );

      print("Response $rez");

      if (rez.status == true) {
        print('Great all good');
      } else {
        print("Oh Snap ");
      }
    });
  }

  chargeSavedCard(
      {required String nom,
      required int expM,
      required int expY,
      required String cvv}) async {
    initPlugin().then((_) async {
      Charge charge = Charge()
        ..amount = price * 100
        ..email = email
        ..reference = _getReference()
        ..card = PaymentCard(
            number: nom, cvc: cvv, expiryMonth: expM, expiryYear: expY);

      CheckoutResponse rez = await paystack.checkout(
        ctx,
        charge: charge,
        method: CheckoutMethod.card,
        fullscreen: false,
        logo: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: SvgPicture.asset(
            'assets/svg/clLogo.svg',
            fit: BoxFit.fitHeight,
          ),
        ),
      );

      print("Response $rez");

      if (rez.status == true) {
        print('Great all good');
      } else {
        print("Oh Snap ");
      }
    });
  }
}
