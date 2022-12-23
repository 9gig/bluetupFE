import 'package:bluetup_inc/models/ref_details.dart';
import 'package:bluetup_inc/server/remote.dart';
import 'package:get/get.dart';

class Refer extends GetxController{
  final isLoading = false.obs;
  final code = ''.obs;
  final link = ''.obs;
  final referrals = [].obs;



  getReferDetails()async{
    try{
      isLoading(true);
      var ref = await RemoteService.getRefDetails();
      code.value  = ref.data.code;
      link.value  = ref.data.refLink;
      referrals.value = ref.data.referrals;
    }finally{
      isLoading(false);
    }
  }
}