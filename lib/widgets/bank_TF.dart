import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';
class BankTFFUllView extends StatefulWidget {
  const BankTFFUllView({Key? key}) : super(key: key);

  @override
  State<BankTFFUllView> createState() => _BankTFFUllViewState();
}

class _BankTFFUllViewState extends State<BankTFFUllView> with SingleTickerProviderStateMixin {
late TabController  bTabber;
  @override
  void initState() {
    super.initState();
    bTabber = new TabController(vsync: this, length: 2);

  }



  @override
  void dispose() {
    bTabber.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(
          height: 15,
        ),
        Container(
            width: widthy,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Amount to pay',
                  style: TextStyle(
                      color: blueTup.tupBlue, fontSize: widthy / 24),),

                Text(' ₦ 5,000.00 ',
                  style: TextStyle(
                      color: blueTup.tupBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: widthy / 24),),

              ],
            )),




        const SizedBox(
          height: 10,
        ),
        Container(
          height: heighty /24,
          decoration: BoxDecoration(
              color: blueTup.tupBlue.withOpacity(.3),
              border: Border.all(color: blueTup.tupBlue,width: 1.2),
              borderRadius: BorderRadius.circular(10)
          ),
          child: TabBar(
              controller: bTabber,
              indicator: BoxDecoration(
                color: blueTup.tupBlue,
                borderRadius: BorderRadius.circular(8),
              ),
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: widthy / 24
              ),
              unselectedLabelColor: blueTup.tupBlue,
              tabs: [
                Tab(text: 'Naira',),
                Tab(text: 'Dollar')

              ]),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/svg/alert-circle.svg',
              width: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                'For faster processing time, always use your Bluetup user-ID in the transaction narration',
                style: TextStyle(
                    color: blueTup.tupBlue.withOpacity(.6),
                    fontSize: widthy / 30),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            RichText(
              text: TextSpan(
                  text: 'User ID: ',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: blueTup.tupBlue,
                      fontSize: widthy / 25),

                  children: <TextSpan>[
                    TextSpan(
                      text: 'u7779000',
                      style: TextStyle(
                          color: blueTup.tupBlue,
                          fontWeight: FontWeight.w400,
                          fontSize: widthy / 25),
                    ),

                  ]),
              
            ),
            SizedBox(width: 10,),
            Icon(Icons.copy, color: blueTup.tupBlue.withOpacity(.5),size: 18,)
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        SingleChildScrollView(
          child: SizedBox(
            height: heighty/2.5,
            child: TabBarView(
                controller: bTabber,
                children: [
                  firstCont(),
                  secondCont()
                ]),
          ),
        )
      ],

    );
  }

  buildBTContainer({required content}){
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return Container(
      width: widthy,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),

      ),
      child: content,
    );
  }


  Column firstCont(){
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       buildBTContainer(
           content:Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               RichText(
                 text: TextSpan(
                     text: 'Bank: ',
                     style: TextStyle(
                         fontWeight: FontWeight.w600,
                         color: blueTup.tupBlue,
                         fontSize: widthy / 25),
                     children: <TextSpan>[
                       TextSpan(
                         text: 'United Bank of Africa (UBA)',
                         style: TextStyle(
                             color: blueTup.tupBlue,
                             fontWeight: FontWeight.w400,
                             fontSize: widthy / 25),
                       ),

                     ]),
               ),

               SizedBox(
                 height: 25,
               ),
               RichText(
                 text: TextSpan(
                     text: 'Account Name: ',
                     style: TextStyle(
                         fontWeight: FontWeight.w600,
                         color: blueTup.tupBlue,
                         fontSize: widthy / 25),
                     children: <TextSpan>[
                       TextSpan(
                         text: 'Bluetup HQ Limited',
                         style: TextStyle(
                             color: blueTup.tupBlue,
                             fontWeight: FontWeight.w400,
                             fontSize: widthy / 25),
                       ),

                     ]),
               ),

               SizedBox(
                 height: 25,
               ),



               RichText(
                 text: TextSpan(
                     text: 'Account Number: ',
                     style: TextStyle(
                         fontWeight: FontWeight.w600,
                         color: blueTup.tupBlue,
                         fontSize: widthy / 25),
                     children: <TextSpan>[
                       TextSpan(
                         text: ' 1025293941',
                         style: TextStyle(
                             color: blueTup.tupBlue,
                             fontWeight: FontWeight.w400,
                             fontSize: widthy / 25),
                       ),

                     ]),
               ),
             ],
           )
       ),
       SizedBox(
         height: 30,
       ),
       buildBTContainer(
           content:Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               RichText(
                 text: TextSpan(
                     text: 'Bank: ',
                     style: TextStyle(
                         fontWeight: FontWeight.w600,
                         color: blueTup.tupBlue,
                         fontSize: widthy / 25),
                     children: <TextSpan>[
                       TextSpan(
                         text: 'ZENITH BANK PLC',
                         style: TextStyle(
                             color: blueTup.tupBlue,
                             fontWeight: FontWeight.w400,
                             fontSize: widthy / 25),
                       ),

                     ]),
               ),

               SizedBox(
                 height: 25,
               ),
               RichText(
                 text: TextSpan(
                     text: 'Account Name: ',
                     style: TextStyle(
                         fontWeight: FontWeight.w600,
                         color: blueTup.tupBlue,
                         fontSize: widthy / 25),
                     children: <TextSpan>[
                       TextSpan(
                         text: 'Bluetup HQ Limited',
                         style: TextStyle(
                             color: blueTup.tupBlue,
                             fontWeight: FontWeight.w400,
                             fontSize: widthy / 25),
                       ),

                     ]),
               ),

               SizedBox(
                 height: 25,
               ),



               RichText(
                 text: TextSpan(
                     text: 'Account Number: ',
                     style: TextStyle(
                         fontWeight: FontWeight.w600,
                         color: blueTup.tupBlue,
                         fontSize: widthy / 25),
                     children: <TextSpan>[
                       TextSpan(
                         text: '1224356665',
                         style: TextStyle(
                             color: blueTup.tupBlue,
                             fontWeight: FontWeight.w400,
                             fontSize: widthy / 25),
                       ),

                     ]),
               ),
             ],
           )
       ),
     ],
    );
  }



Column secondCont(){
  const btnStyle = MaterialStateProperty.all;
  final heighty = MediaQuery.of(context).size.height;
  final widthy = MediaQuery.of(context).size.width;
  return Column(
    children: [
      buildBTContainer(
          content:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    text: 'BANK: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: blueTup.tupBlue,
                        fontSize: widthy / 25),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'UNITED BANK OF AFRICA (UBA)',
                        style: TextStyle(
                            color: blueTup.tupBlue,
                            fontWeight: FontWeight.w400,
                            fontSize: widthy / 25),
                      ),

                    ]),
              ),

              SizedBox(
                height: 25,
              ),
              RichText(
                text: TextSpan(
                    text: 'ACCOUNT NAME: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: blueTup.tupBlue,
                        fontSize: widthy / 25),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Bluetup HQ Limited',
                        style: TextStyle(
                            color: blueTup.tupBlue,
                            fontWeight: FontWeight.w400,
                            fontSize: widthy / 25),
                      ),

                    ]),
              ),

              SizedBox(
                height: 25,
              ),



              RichText(
                text: TextSpan(
                    text: 'ACCOUNT NUMBER: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: blueTup.tupBlue,
                        fontSize: widthy / 25),
                    children: <TextSpan>[
                      TextSpan(
                        text: '3003744858',
                        style: TextStyle(
                            color: blueTup.tupBlue,
                            fontWeight: FontWeight.w400,
                            fontSize: widthy / 25),
                      ),

                    ]),
              ),
              SizedBox(
                height: 25,
              ),

              RichText(
                text: TextSpan(
                    text: 'SORT CODE: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: blueTup.tupBlue,
                        fontSize: widthy / 25),
                    children: <TextSpan>[
                      TextSpan(
                        text: '033213563',
                        style: TextStyle(
                            color: blueTup.tupBlue,
                            fontWeight: FontWeight.w400,
                            fontSize: widthy / 25),
                      ),

                    ]),
              ),
            ],
          )
      ),
    ],
  );
}
}
