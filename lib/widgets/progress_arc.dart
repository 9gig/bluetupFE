import 'dart:math' as math;

import 'package:bluetup_inc/main.dart';
import 'package:flutter/material.dart';

final Gradient gradient = new LinearGradient(colors: <Color>[
  Colors.greenAccent.withOpacity(1.0),
  Colors.yellowAccent.withOpacity(1.0),
  Colors.redAccent.withOpacity(1.0)
], stops: [
  0.0,
  0.5,
  1.0
]);

// class Circular_Arc extends StatefulWidget {
//   const Circular_Arc({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<Circular_Arc> createState() => _Circular_ArcState();
// }

// class _Circular_ArcState extends State<Circular_Arc>
//     with SingleTickerProviderStateMixin {
//   late Animation<double> animation;
//   late AnimationController animController;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     animController =
//         AnimationController(duration: Duration(seconds: 2), vsync: this);

//     final curvedAnimation =
//         CurvedAnimation(parent: animController, curve: Curves.easeInOutCubic);

//     animation = Tween<double>(begin: 0.0, end: 1.57).animate(curvedAnimation)
//       ..addListener(() {
//         setState(() {});
//       });

//     animController.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Stack(children: [
//         Positioned(
//           left: 40,
//           child: CustomPaint(
//             size: Size(300, 300),
//             painter:
//                 ProgressArc(math.pi, blueTup.tupBlue.withOpacity(.1), false),
//           ),
//         ),
//         Positioned(
//           left: 40,
//           child: CustomPaint(
//             size: const Size(300, 300),
//             foregroundPainter: ProgressArc(animation.value, Colors.black, true),
//           ),
//         ),
//         Positioned(
//             top: 80,
//             left: 150,
//             child: Text(
//               "Total Saved",
//               style: TextStyle(
//                   color: blueTup.tupBlue.withOpacity(.5), fontSize: 15),
//             )),
//         Positioned(
//             top: 100,
//             left: 150,
//             child: Text(
//               "₦ ${(animation.value / 3.14 * 100).round()}%",
//               style: TextStyle(color: blueTup.tupBlue, fontSize: 30),
//             )),
//         Positioned(
//             top: 160,
//             left: 20,
//             child: Text(
//               "₦0,000",
//               style: TextStyle(
//                   color: blueTup.tupBlue.withOpacity(.5), fontSize: 20),
//             )),
//         Positioned(
//             top: 160,
//             right: 20,
//             child: Text(
//               "₦250,000",
//               style: TextStyle(
//                   color: blueTup.tupBlue.withOpacity(.5), fontSize: 20),
//             ))
//       ]),
//     );
//   }
// }

class ProgressArc extends CustomPainter {
  bool isBackground;
  double? arc;
  Color progressColor;

  ProgressArc(this.arc, this.progressColor, this.isBackground);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, 250, 250);
    final startAngle = -math.pi;
    final sweepAngle = arc ?? math.pi;
    final userCenter = false;
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;

    if (isBackground) {
      paint.shader = gradient.createShader(rect);
    }

    canvas.drawArc(rect, startAngle, sweepAngle, userCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
