// import 'package:bluetup/main.dart';
// import 'package:flutter/material.dart';

// class WalletCards extends StatelessWidget {
//   const WalletCards({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const btnStyle = MaterialStateProperty.all;
//     final heighty = MediaQuery.of(context).size.height;
//     final widthy = MediaQuery.of(context).size.width;
//     return ListView(
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         children: [
//           _buildTotalSavings(context),
//           _buildTotalSavings(context),
//           _buildTotalSavings(context),
//         ],
//       ),
//     );
//   }

//   _buildTotalSavings(BuildContext context) {
//     const btnStyle = MaterialStateProperty.all;
//     final heighty = MediaQuery.of(context).size.height;
//     final widthy = MediaQuery.of(context).size.width;
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 20),
//       height: heighty / 6,
//       width: widthy,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           image: DecorationImage(
//               image: AssetImage('assets/images/Savings.png'),
//               fit: BoxFit.fitWidth)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Total Savings',
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//           Row(
//             children: [
//               Text(
//                 '\$ 32,677',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: widthy / 20,
//                     fontWeight: FontWeight.bold),
//               ),
//               Icon(
//                 Icons.visibility_off_outlined,
//                 color: Colors.white,
//               )
//             ],
//           ),
//           Row(
//             children: [
//               TextButton(
//                   onPressed: () {},
//                   style: ButtonStyle(
//                     backgroundColor: btnStyle(Color(0xffFFC727)),
//                     fixedSize: btnStyle(const Size(100, 28)),
//                     shape: btnStyle(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(6))),
//                   ),
//                   child: Text(
//                     'Deposit',
//                     style: TextStyle(
//                         color: blueTup.tupBlue,
//                         fontSize: widthy / 24,
//                         fontWeight: FontWeight.bold),
//                   )),
//               SizedBox(width: 20),
//               TextButton(
//                 onPressed: () {},
//                 style: ButtonStyle(
//                   backgroundColor: btnStyle(Colors.black45),
//                   //  elevation: btnStyle(4),
//                   fixedSize: btnStyle(const Size(100, 28)),
//                   shape: btnStyle(RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(6))),
//                 ),
//                 child: Text(
//                   'withdraw',
//                   style: TextStyle(
//                       color: blueTup.tupBlue,
//                       fontSize: widthy / 24,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   _buildTotalBalance(BuildContext context) {
//     const btnStyle = MaterialStateProperty.all;
//     final heighty = MediaQuery.of(context).size.height;
//     final widthy = MediaQuery.of(context).size.width;
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 20),
//       height: heighty / 6,
//       width: widthy,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           image: DecorationImage(
//               image: AssetImage('assets/images/Savings.png'),
//               fit: BoxFit.fitWidth)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Total Savings',
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//           Row(
//             children: [
//               Text(
//                 '\$ 32,677',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: widthy / 20,
//                     fontWeight: FontWeight.bold),
//               ),
//               Icon(
//                 Icons.visibility_off_outlined,
//                 color: Colors.white,
//               )
//             ],
//           ),
//           Row(
//             children: [
//               TextButton(
//                   onPressed: () {},
//                   style: ButtonStyle(
//                     backgroundColor: btnStyle(Color(0xffFFC727)),
//                     fixedSize: btnStyle(const Size(100, 28)),
//                     shape: btnStyle(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(6))),
//                   ),
//                   child: Text(
//                     'Deposit',
//                     style: TextStyle(
//                         color: blueTup.tupBlue,
//                         fontSize: widthy / 24,
//                         fontWeight: FontWeight.bold),
//                   )),
//               SizedBox(width: 20),
//               TextButton(
//                 onPressed: () {},
//                 style: ButtonStyle(
//                   backgroundColor: btnStyle(Colors.black45),
//                   //  elevation: btnStyle(4),
//                   fixedSize: btnStyle(const Size(100, 28)),
//                   shape: btnStyle(RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(6))),
//                 ),
//                 child: Text(
//                   'withdraw',
//                   style: TextStyle(
//                       color: blueTup.tupBlue,
//                       fontSize: widthy / 24,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
