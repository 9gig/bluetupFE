import 'package:bluetup_inc/main.dart';
import 'package:bluetup_inc/screens/main/invest.dart';
import 'package:bluetup_inc/screens/main/home.dart';
import 'package:bluetup_inc/screens/main/profile.dart';
import 'package:bluetup_inc/screens/main/savings.dart';
import 'package:bluetup_inc/screens/main/more.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MajorPage extends StatefulWidget {
  const MajorPage({Key? key}) : super(key: key);

  @override
  State<MajorPage> createState() => _MajorPageState();
}

class _MajorPageState extends State<MajorPage> {
  int pageValue = 0;
  List<Widget> mainPages = [
    const HomePage(),
    const InvestPage(),
    const SavingsPage(),
    const ProfilePage(),
    const MorePage()
  ];

  @override
  Widget build(BuildContext context) {
    const btnStyle = MaterialStateProperty.all;
    final heighty = MediaQuery.of(context).size.height;
    final widthy = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fb),
      body: SafeArea(
        child: mainPages[pageValue],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 20,
        selectedItemColor: blueTup.tupBlue,
        unselectedItemColor: blueTup.tupBlue.withOpacity(.3),
        selectedFontSize: widthy / 30,
        unselectedFontSize: widthy / 30,
        showUnselectedLabels: true,
        iconSize: 25,
        currentIndex: pageValue,
        onTap: (value) {
          setState(() {
            pageValue = value;
            if (pageValue == 1) {}
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/home.svg'),
              activeIcon: SvgPicture.asset('assets/svg/hh.svg'),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/invest.svg'),
              activeIcon: SvgPicture.asset('assets/svg/ii.svg'),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/savings.svg'),
              activeIcon: SvgPicture.asset('assets/svg/ss.svg'),
              label: ''),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/porfile.svg'),
            activeIcon: SvgPicture.asset('assets/svg/pp.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/more.svg'),
            activeIcon: SvgPicture.asset('assets/svg/mm.svg'),
            label: '',
          ),
        ],
      ),
    );
  }
}
