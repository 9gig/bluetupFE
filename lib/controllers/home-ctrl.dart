import 'package:bluetup_inc/models/getSave.dart';
import 'package:bluetup_inc/server/remote.dart';
import 'package:get/get.dart';

class HomeCtrl extends GetxController {
  final isGenLoading = false.obs;
  final isInvLoading = false.obs;
  final isSavingsLoading = false.obs;
  final genBal = ''.obs;
  final invBal = ''.obs;
  final profit = ''.obs;
  final saveBal = ''.obs;
  final wit = ''.obs;
  final saveTDR = ''.obs;
  final saveBlv = ''.obs;
  final saveFlx = ''.obs;
  final saveTR = ''.obs;
  final saveDetails = <Detail>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    genBalance();
    saveBalance();
    invBalance();
  }

  //Get general wallet balance
  genBalance() async {
    try {
      isGenLoading(true);
      //make the api call for wallet balance
      var bal = await RemoteService.genBal();
      //assign the value to genBal
      if (bal.message == 'success') {
        genBal.value = bal.data.bal;
      } else {
        genBal.value = '0.00';
      }
      // print(genBal);
    } finally {
      isGenLoading(false);
    }
  }

  //Get Savings wallet balance
  saveBalance() async {
    try {
      isSavingsLoading(true);
      //make the api call for wallet balance
      var sav = await RemoteService.getSavings();
      //assign the value to saveBal
      if (sav.result != null) {
        saveBal.value = sav.result.tB.toString();
        saveDetails.value = sav.result.details;
        wit.value = sav.result.tW.toString();
        saveTDR.value = sav.result.details[2].intrest;
        saveBlv.value = sav.result.details[0].intrest;
        saveFlx.value = sav.result.details[1].intrest;
        saveTR.value = sav.result.tR.toString();
      } else {
        saveBal.value = '0.00';
        saveDetails.value = [];
        wit.value = '0.00';
        saveTDR.value = '0.00';
        saveBlv.value = '0.00';
        saveFlx.value = '0.00';
        saveTR.value = '0.00';
      }
    } finally {
      isSavingsLoading(false);
    }
  }

  //Get Investment wallet balance
  invBalance() async {
    try {
      isInvLoading(true);
      //make the api call for wallet balance
      var bal = await RemoteService.invBal();
      //assign the value to invBal
      if (bal.message == 'success') {
        invBal.value = bal.data.bal;
        profit.value = bal.data.profit;
      } else {
        invBal.value = '0.00';
      }
    } finally {
      isInvLoading(false);
    }
  }
}
