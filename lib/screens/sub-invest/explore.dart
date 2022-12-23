import 'package:bluetup_inc/controllers/inv-ctrl.dart';
import 'package:bluetup_inc/screens/sub-invest/inv-explore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../../main.dart';
import '../../models/invest-card.dart';

class Exploreview extends StatefulWidget {
  const Exploreview({Key? key}) : super(key: key);

  @override
  State<Exploreview> createState() => _ExploreviewState();
}

final searchText = TextEditingController();
int selected = 0;

class _ExploreviewState extends State<Exploreview> {
  final InvCtrl invCtrl = Get.put(InvCtrl());
  @override
  Widget build(BuildContext context) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return Container(
      constraints: const BoxConstraints(
        maxHeight: double.infinity,
      ),
      child: StickyHeader(
        header: Container(
          color: const Color(0xfff8f9fb),
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: blueTup.tupBlue.withOpacity(.08),
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
                      invCtrl.isExLoading(true);
                    } else {
                      invCtrl.fetchDeals();
                    }
                  },
                  onFieldSubmitted: (searchText) {
                    invCtrl.fetchSearchResult(searchText);
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
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildBtn(
                        text: 'All',
                        onClicked: () {
                          setState(() {
                            selected = 0;
                          });
                          invCtrl.fetchDeals();
                        },
                        btnIndex: 0,
                      ),
                      buildBtn(
                          text: 'Fixed Income',
                          onClicked: () {
                            setState(() {
                              selected = 1;
                            });
                            invCtrl.fetchFilteredResult('Fixed income');
                          },
                          btnIndex: 1),
                      buildBtn(
                          text: 'Real - Estate',
                          onClicked: () {
                            setState(() {
                              selected = 2;
                            });
                            invCtrl.fetchFilteredResult('Real Estate');
                          },
                          btnIndex: 2),
                      buildBtn(
                          text: 'Agriculture',
                          onClicked: () {
                            setState(() {
                              selected = 3;
                            });
                            invCtrl.fetchFilteredResult('Agriculture');
                          },
                          btnIndex: 3),
                      buildBtn(
                          text: 'Credit Financing',
                          onClicked: () {
                            setState(() {
                              selected = 4;
                            });
                            invCtrl.fetchFilteredResult('Credit Financing');
                          },
                          btnIndex: 4),
                    ]),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        content: buildInvestmentCard(),
      ),
    );
  }

  buildBtn(
      {required String text,
      required VoidCallback onClicked,
      required int btnIndex}) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onClicked,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
        margin: const EdgeInsets.symmetric(horizontal: 2.5),
        decoration: BoxDecoration(
            color: selected == btnIndex ? blueTup.tupBlue : null,
            border: Border.all(color: blueTup.tupBlue, width: 1.5),
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          text,
          style: TextStyle(
              color: selected == btnIndex ? Colors.white : blueTup.tupBlue),
        ),
      ),
    );
  }

  buildInvestmentCard() {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return Obx(() {
      if (invCtrl.isExLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        return StaggeredGridView.countBuilder(
            staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: invCtrl.deals.length,
            itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Get.to(() => WhenExplore(index: index));
                  },
                  child: Container(
                    // height: heighty,
                    // width: widthy / 2.3,

                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: blueTup.tupBlue.withOpacity(.05),
                          spreadRadius: 3,
                          blurRadius: 8,
                          offset:
                              const Offset(1, 2), // changes position of shadow
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
                              // color: blueTup.tupBlue,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      invCtrl.deals[index].assets[0]),
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
                                  invCtrl.deals[index].invType,
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
                            invCtrl.deals[index].name,
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
                                text: invCtrl.deals[index].returns,
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
                                text: invCtrl.deals[index].cost,
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
                                    text: invCtrl.deals[index].cost,
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
                              // Container(
                              //   padding: const EdgeInsets.all(5),
                              //   decoration: BoxDecoration(
                              //       borderRadius: const BorderRadius.only(
                              //           topLeft: Radius.circular(8),
                              //           bottomLeft: Radius.circular(8)),
                              //       color: blueTup.tupGreen.withOpacity(.3)),
                              //   child: Text(
                              //     investExploreCard[index].label,
                              //     style: TextStyle(
                              //         fontWeight: FontWeight.w600,
                              //         fontSize: widthy / 34,
                              //         color: blueTup.tupGreen),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
      }
    });
  }
}

