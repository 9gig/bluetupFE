import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';

class Transc extends StatelessWidget {
  const Transc({Key? key}) : super(key: key);
  final String amt = '₦5,050';
  @override
  Widget build(BuildContext context) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return Column(
      children: [
        buildTab(widthy),
        const SizedBox(height: 10),
        buildContent(width: widthy, height: heighty)
      ],
    );
  }

  Container buildTab(double widthy) {
    return Container(
      width: widthy,
      height: 35,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: blueTup.tupBlue.withOpacity(.2),
          border: Border.all(color: blueTup.tupBlue, width: 1.5),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: blueTup.tupBlue,
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                'All',
                style: TextStyle(color: Colors.white, fontSize: widthy / 26),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            alignment: Alignment.center,
            child: Text(
              'Credits',
              style: TextStyle(color: blueTup.tupBlue, fontSize: widthy / 26),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            alignment: Alignment.center,
            child: Text(
              'Debits',
              style: TextStyle(color: blueTup.tupBlue, fontSize: widthy / 26),
            ),
          ),
        ],
      ),
    );
  }

  buildContent({required double width, required double height}) {
    return Scrollbar(
      child: Container(
        width: width,
        height: height,
        child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) => Column(
                  children: [
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/svg/Credit.svg',
                        width: 40,
                      ),
                      title: Text(
                        'Deposit to challange(Jude franker ) ',
                        style: TextStyle(
                            color: blueTup.tupBlue, fontSize: width / 28),
                      ),
                      subtitle: Text(
                        'Jun 26, 2021 17:22:18 GMT',
                        style: TextStyle(
                            color: blueTup.tupBlue.withOpacity(.6),
                            fontSize: width / 30),
                      ),
                      trailing: Text(
                        amt,
                        style: TextStyle(
                            color: blueTup.tupBlue, fontSize: width / 28),
                      ),
                    ),
                    Divider(
                      height: 10,
                    )
                  ],
                ))),
      ),
    );
  }
}
