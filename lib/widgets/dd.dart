import 'dart:convert';
import 'dart:io';

import 'package:bluetup_inc/models/general.dart';
import 'package:bluetup_inc/screens/sub-invest/inv_purchase.dart';
import 'package:bluetup_inc/server/remote.dart';
import 'package:bluetup_inc/widgets/bank_transfer.dart';
import 'package:bluetup_inc/widgets/card_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/home-ctrl.dart';
import '../main.dart';
import '../models/login_res.dart';
import 'bank_TF.dart';
import 'card_deposit.dart';
import 'deposit_view.dart';

class DepositOption extends StatefulWidget {
   DepositOption({Key? key, required this.dPTo}) : super(key: key);
  final String dPTo;
  @override
  State<DepositOption> createState() => _DepositOptionState();
}
late TabController _tabController;


int listNum = 0;
List dpViews = [];
class _DepositOptionState extends State<DepositOption> with SingleTickerProviderStateMixin {
  final HomeCtrl homeCtrl = Get.put(HomeCtrl());
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
    setState(() {
      dpViews = [
        DepositTabBiew(tabController: _tabController,),
        CardNextView(),
        BankTFFUllView()
      ];
    });
  }


bool isLoading = false;
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return  Container(

      padding: EdgeInsets.only(top: 20, left: 20,right: 20, bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Deposit',
                  style: TextStyle(
                      color: blueTup.tupBlue,
                      fontSize: widthy / 26,
                      fontWeight: FontWeight.w500)),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  'assets/svg/closeM.svg',
                ),
              )
            ],
          ),

              dpViews[listNum],

          Visibility(
            visible: listNum == 0?false:true,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (listNum > 0)
                  TextButton(
                    onPressed: () {
                     setState(() {
                       listNum=0;
                     });
                     print('object');
                    },
                    style: ButtonStyle(
                      backgroundColor: btnStyle(blueTup.tupYellow),
                      //  elevation: btnStyle(4),
                      fixedSize: btnStyle(const Size(140, 22)),
                      shape: btnStyle(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                    ),
                    child: Text(
                      'Back',
                      style: TextStyle(
                          color: blueTup.tupBlue,
                          fontSize: widthy / 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                TextButton(
                  onPressed: () {
                    if(widget.dPTo == 'general'){
                      var userData = GetStorage();
                      var u = loginResponseFromJson(jsonDecode(userData.read('User')));
                      var userId = u.data.uId;

                      final ToGeneral m = ToGeneral(bal: CardDeposit.ammt, userId: userId);

                        RemoteService.addGen(m).then((d){
                          setState(() {
                            isLoading = true;
                          });
                          if(d == 'success'){
                            homeCtrl. genBalance();
                              Navigator.pop(context);
                              Get.snackbar('Bluetup', 'Deposit Successful',
                                  colorText: blueTup.tupGreen,
                                  backgroundColor: Colors.white,
                                  borderRadius: 5);

                            setState(() {
                              isLoading = false;
                            });
                          }else{
                            setState(() {
                              isLoading = false;
                            });

                            Get.snackbar('Bluetup', d,
                                colorText: Colors.white,
                                backgroundColor: Colors.red,
                                borderRadius: 5);
                          }
                        });
                    }else{

                      //Check the next section that uses it
                      print(int.parse(CardDeposit.ammt));
                    }

                  },
                  style: ButtonStyle(
                    backgroundColor: btnStyle(blueTup.tupBlue),
                    //  elevation: btnStyle(4),
                    fixedSize: btnStyle(const Size(170, 22)),
                    shape: btnStyle(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
                  ),
                  child: isLoading?Center(child: CircularProgressIndicator(color: Colors.white,),):Text( 'Confirm Payment',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: widthy / 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: listNum == 0?true:false,
            child: TextButton(
              onPressed: () {
                  if (_tabController.index == 0) {
                    setState(() {
                      listNum = 1;

                    });
                  }
                  if (_tabController.index == 1) {
                    setState(() {
                      listNum = 2;
                    });

                }
              },
              style: ButtonStyle(
                backgroundColor: btnStyle(blueTup.tupBlue),
                //  elevation: btnStyle(4),
                fixedSize: btnStyle(const Size(300, 25)),
                shape: btnStyle(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
              ),
              child: Text(
                'Proceed',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: widthy / 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}






