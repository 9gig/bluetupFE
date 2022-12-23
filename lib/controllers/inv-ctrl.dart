import 'package:bluetup_inc/models/active-matured.dart';
import 'package:bluetup_inc/models/deals.dart';
import 'package:bluetup_inc/screens/main/invest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../models/deals.dart';
import '../server/remote.dart';

class InvCtrl extends GetxController {
  final bala = ''.obs;
  final profit = ''.obs;

  final isInvLoading = false.obs;
  final isExLoading = false.obs;
  final isAcMtLoading = false.obs;
  final isPurchasing = false.obs;
  final deals = <GetDeals>[].obs;
  final active = <Active>[].obs;
  final matured = <Matured>[].obs;

  // fetch all investments
  //calculate for profit by date & daily profit
  //

  @override
  void onInit() {
    super.onInit();
    invBalance();
    getActive_Matured();
    fetchDeals();
  }


  //Purchase Inv
  purchase(mody)async{
    try{
      isPurchasing(true);
      var purch = await RemoteService.purchaseInv(mody);
      if(purch.message == 'success'){
        getActive_Matured();
      }else{
        Get.snackbar(
            'Error', 'An error occured check your network and try again',
            colorText: Colors.white,
            borderRadius: 5,
            backgroundColor: Colors.red,
            margin: const EdgeInsets.all(10));
      }
    }finally{
      isPurchasing(false);
    }
  }




  //searh through the list
  fetchSearchResult(String searchText) async {
    try {
      List<GetDeals> searchResult = deals
          .where((ele) =>
              ele.name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
      if (searchResult.length < 1) {
        Get.snackbar(
            'Search Result', 'No investment for your search  "$searchText"',
            colorText: Colors.white,
            borderRadius: 5,
            backgroundColor: Colors.red,
            margin: const EdgeInsets.all(10));
      } else {
        deals.value = searchResult;
      }
    } finally {
      isExLoading(false);
    }
  }

  fetchFilteredResult(String invType) async {
    try {
      isExLoading(true);
      var dealer = await RemoteService.dealer();
      List<GetDeals> filteredResult = dealer.data
          .where((ele) =>
              ele.invSector.toLowerCase().contains(invType.toLowerCase()))
          .toList();
      if (invType.length < 1) {
        print('None Found');
      } else {
        deals.value = filteredResult;
      }
    } finally {
      isExLoading(false);
    }
  }

  //Get all deals
  fetchDeals() async {
    try {
      isExLoading(true);
      //Api call
      var dealer = await RemoteService.dealer();
      if (dealer != null) {
        deals.value = dealer.data;
      } else {
        Get.snackbar('Network Error', 'An Error Occured',
            colorText: Colors.white,
            borderRadius: 5,
            backgroundColor: Colors.red,
            margin: const EdgeInsets.all(10));
      }

      //Assign value to list

    } finally {
      isExLoading(false);
    }
  }

  // Getting all Balance
  invBalance() async {
    try {
      isInvLoading(true);
      //make the api call for wallet balance
      var bal = await RemoteService.invBal();
      //assign the value to invBal
      if (bal.message == 'success') {
        bala.value = bal.data.bal;
        profit.value = bal.data.profit;
      } else {
        bala.value = '0.00';
      }
    } finally {
      isInvLoading(false);
    }
  }

  // Getting active and matured
  getActive_Matured() async {
    try {
      isAcMtLoading(true);
      var dealz = await RemoteService.getInvz();
      if (dealz.data != null) {
        active.value = dealz.data.active;
        matured.value = dealz.data.matured;
      }
    } finally {
      isAcMtLoading(false);
    }
  }

  fetchActiveSearch(String searchText) async {
    try {
      List<Active> searchResult = active
          .where((ele) => ele.invDetails.name
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();
      if (searchResult.length < 1) {
        Get.snackbar(
            'Search Result', 'No investment for your search  "$searchText"',
            colorText: Colors.white,
            borderRadius: 5,
            backgroundColor: Colors.red,
            margin: const EdgeInsets.all(10));
      } else {
        active.value = searchResult;
      }
    } finally {
      isAcMtLoading(false);
    }
  }

  fetchMaturedSearch(String searchText) async {
    try {
      List<Matured> searchResult = matured
          .where((ele) => ele.invDetails.name
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();
      if (searchResult.length < 1) {
        Get.snackbar(
            'Search Result', 'No investment for your search  "$searchText"',
            colorText: Colors.white,
            borderRadius: 5,
            backgroundColor: Colors.red,
            margin: const EdgeInsets.all(10));
      } else {
        matured.value = searchResult;
      }
    } finally {
      isAcMtLoading(false);
    }
  }
}
