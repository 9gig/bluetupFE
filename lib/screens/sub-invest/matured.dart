import 'package:bluetup_inc/screens/sub-invest/inv-mature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/inv-ctrl.dart';
import '../../main.dart';
import '../../models/invest-card.dart';

class MaturedView extends StatefulWidget {
  const MaturedView({Key? key}) : super(key: key);

  @override
  State<MaturedView> createState() => _MaturedViewState();
}

final searchText = TextEditingController();

class _MaturedViewState extends State<MaturedView> {
  final InvCtrl invCtrl = Get.put(InvCtrl());
  @override
  Widget build(BuildContext context) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 20,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: blueTup.tupBlue.withOpacity(.05),
                  spreadRadius: 7,
                  blurRadius: 9,
                  offset: const Offset(0, 8), // changes position of shadow
                ),
              ],
            ),
            child: TextFormField(
              controller: searchText,
              cursorColor: blueTup.tupBlue,
              style: TextStyle(color: Colors.black, fontSize: widthy / 20),
              onChanged: (val) {
                if (val.length > 3) {
                  invCtrl.isAcMtLoading(true);
                } else {
                  invCtrl.fetchDeals();
                }
              },
              onFieldSubmitted: (searchText) {
                invCtrl.fetchMaturedSearch(searchText);
              },
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  // prefixStyle: MaterialStateTextStyle(color: atColors.atBlue),

                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: blueTup.tupBlue),
                      borderRadius: BorderRadius.circular(15)),
                  enabled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: 'Search for investment products',
                  hintStyle: TextStyle(
                    fontSize: widthy / 28,
                  ),
                  //error style
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  contentPadding: const EdgeInsets.only(
                      left: 15, bottom: 11, top: 11, right: 15)),
              keyboardType: TextInputType.text,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          buildInvestmentCard()
        ],
      ),
    );
  }

  buildInvestmentCard() {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return Obx(() {
      if (invCtrl.isAcMtLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        return StaggeredGridView.countBuilder(
          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: invCtrl.matured.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Get.to(() => WhenMature(index: index));
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: blueTup.tupBlue.withOpacity(.05),
                      spreadRadius: 7,
                      blurRadius: 9,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: widthy,
                      height: heighty / 8,
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  invCtrl.matured[index].invDetails.assets[0]),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              child: SvgPicture.asset(
                                  'assets/svg/clLogo.svg')),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                                color: Color(0xffD0D8EB)),
                            child: Text(
                              invCtrl.matured[index].invDetails.invType,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: widthy / 34,
                                  color: blueTup.tupBlue),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        left: 8,
                      ),
                      child: Text(
                        invCtrl.matured[index].invDetails.name,
                        style: TextStyle(
                          color: blueTup.tupBlue,
                          fontSize: widthy / 27,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        left: 8,
                      ),
                      child: RichText(
                        text: TextSpan(
                            text: invCtrl.matured[index].invDetails.returns,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: blueTup.tupGreen,
                                fontSize: widthy / 28),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' returns in 8 months',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: widthy / 32),
                              ),
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        left: 8,
                      ),
                      child: RichText(
                        text: TextSpan(
                            text: invCtrl.matured[index].invDetails.cost,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: blueTup.tupBlue,
                                fontSize: widthy / 28),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' per unit',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: widthy / 32),
                              ),
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        left: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                                text:
                                    invCtrl.matured[index].invDetails.totalUnit,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: widthy / 28),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' investors',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: widthy / 32),
                                  ),
                                ]),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8)),
                                color: Colors.red.withOpacity(.3)),
                            child: Text(
                              'Completed',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: widthy / 34,
                                  color: Colors.red),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    });
  }
}
