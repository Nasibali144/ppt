// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'app.dart';
//
// void main() {
//   runApp(const PaintingLearn());
// }
//
// class PaintingLearn extends StatelessWidget {
//   const PaintingLearn({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: PaintingPage(),
//     );
//   }
// }
//
// /*
// class PaintingPage extends StatelessWidget {
//   const PaintingPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: CustomPaint(
//           painter: Sky(),
//           child: const Center(
//             child: Text(
//               'Once upon a time...',
//               style: TextStyle(
//                 fontSize: 40.0,
//                 fontWeight: FontWeight.w900,
//                 color: Color(0xFFFFFFFF),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class Sky extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Rect rect = Offset.zero & size;
//     const RadialGradient gradient = RadialGradient(
//       center: Alignment(0.7, -0.6),
//       radius: 0.2,
//       colors: <Color>[Color(0xFFFFFF00), Color(0xFF0099FF)],
//       stops: <double>[0.4, 1.0],
//     );
//     canvas.drawRect(
//       rect,
//       Paint()..shader = gradient.createShader(rect),
//     );
//   }
//
//   @override
//   SemanticsBuilderCallback get semanticsBuilder {
//     return (Size size) {
//       // Annotate a rectangle containing the picture of the sun
//       // with the label "Sun". When text to speech feature is enabled on the
//       // device, a user will be able to locate the sun on this picture by
//       // touch.
//       Rect rect = Offset.zero & size;
//       final double width = size.shortestSide * 0.4;
//       rect = const Alignment(0.8, -0.9).inscribe(Size(width, width), rect);
//       return <CustomPainterSemantics>[
//         CustomPainterSemantics(
//           rect: rect,
//           properties: const SemanticsProperties(
//             label: 'Sun',
//             textDirection: TextDirection.ltr,
//           ),
//         ),
//       ];
//     };
//   }
//
//   // Since this Sky painter has no fields, it always paints
//   // the same thing and semantics information is the same.
//   // Therefore we return false here. If we had fields (set
//   // from the constructor) then we would return true if any
//   // of them differed from the same fields on the oldDelegate.
//   @override
//   bool shouldRepaint(Sky oldDelegate) => false;
//   @override
//   bool shouldRebuildSemantics(Sky oldDelegate) => false;
// }
// */
//
// /*
// class PaintingPage extends StatelessWidget {
//   const PaintingPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: CustomPaint(
//           size: Size.infinite, //2
//           painter: ProfileCardPainter(color: Colors.blueAccent, avatarRadius: 100), //3
//         ),
//       ),
//     );
//   }
// }
//
//
// class ProfileCardPainter extends CustomPainter {
//   ProfileCardPainter({required this.avatarRadius, required this.color});
//
//   final Color color;
//   final double avatarRadius;
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final shapeBounds = Rect.fromLTWH(0, 0, size.width, size.height - avatarRadius);
//     //1
//     final centerAvatar = Offset(shapeBounds.center.dx, shapeBounds.bottom);
// //2
//     final avatarBounds = Rect.fromCircle(center: centerAvatar,
//         radius: avatarRadius).inflate(6);//3
//     _drawBackground(canvas, shapeBounds, avatarBounds);
//
//     //1
//     final curvedShapeBounds = Rect.fromLTRB(
//       shapeBounds.left,
//       shapeBounds.top + shapeBounds.height * 0.35,
//       shapeBounds.right,
//       shapeBounds.bottom,
//     );
//
// //2
//     _drawCurvedShape(canvas, curvedShapeBounds, avatarBounds);
//
//   }
//
//   //5
//   @override
//   bool shouldRepaint(ProfileCardPainter oldDelegate) {
//     return color != oldDelegate.color;
//   }
//
//   void _drawBackground(Canvas canvas, Rect shapeBounds, Rect avatarBounds) {
//     //1
//     final paint = Paint()..color = color;
//
//     //2
//     final backgroundPath = Path()
//       ..moveTo(shapeBounds.left, shapeBounds.top) //3
//       ..lineTo(shapeBounds.bottomLeft.dx, shapeBounds.bottomLeft.dy) //4
//       ..arcTo(avatarBounds, -pi, pi, false) //5
//       ..lineTo(shapeBounds.bottomRight.dx, shapeBounds.bottomRight.dy) //6
//       ..lineTo(shapeBounds.topRight.dx, shapeBounds.topRight.dy) //7
//       ..close(); //8
//
//     //9
//     canvas.drawPath(backgroundPath, paint);
//   }
//
//   void _drawCurvedShape(Canvas canvas, Rect bounds, Rect avatarBounds) {
//
//     //1
//     final colors = [color.darker(), color, color.darker()];
// //2
//     final stops = [0.0, 0.3, 1.0];
// //3
//     final gradient = LinearGradient(colors: colors, stops: stops);
//
//     //1
//     final paint = Paint()..shader = gradient.createShader(bounds);
//
//     //2
//     final handlePoint = Offset(bounds.left + (bounds.width * 0.25), bounds.top);
//
//     //3
//     final curvePath = Path()
//       ..moveTo(bounds.bottomLeft.dx, bounds.bottomLeft.dy) //4
//       ..arcTo(avatarBounds, -pi, pi, false) //5
//       ..lineTo(bounds.bottomRight.dx, bounds.bottomRight.dy) //6
//       ..lineTo(bounds.topRight.dx, bounds.topRight.dy) //7
//       ..quadraticBezierTo(handlePoint.dx, handlePoint.dy,
//           bounds.bottomLeft.dx, bounds.bottomLeft.dy) //8
//       ..close(); //9
//
//     //10
//     canvas.drawPath(curvePath, paint);
//   }
//
//
// }
//
// extension ColorShades on Color {
//   Color darker() {
//     const int darkness = 10;
//     int r = (red - darkness).clamp(0, 255);
//     int g = (green - darkness).clamp(0, 255);
//     int b = (blue - darkness).clamp(0, 255);
//     return Color.fromRGBO(r, g, b, 1);
//   }
// }*/
//
// class PaintingPage extends StatefulWidget {
//   const PaintingPage({Key? key}) : super(key: key);
//
//   @override
//   State<PaintingPage> createState() => _PaintingPageState();
// }
//
// class _PaintingPageState extends State<PaintingPage> {
//   late List<ChartDataPoint> chartData;
//
//   // List<ChartDataPoint> normalizeData(WeekData weekData) {
//   //   final maxDay = weekData.days.reduce((DayData dayA, DayData dayB) {
//   //     return dayA.laughs > dayB.laughs ? dayA : dayB;
//   //   });
//   //   final normalizedList = <ChartDataPoint>[];
//   //   weekData.days.forEach((element) {
//   //     normalizedList.add(ChartDataPoint(
//   //         value: maxDay.laughs == 0 ? 0 : element.laughs / maxDay.laughs));
//   //   });
//   //   return normalizedList;
//   // }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.teal,
//       body: CustomPaint(
//         size: Size(MediaQuery.of(context).size.width, 300),
//         painter: PathPainter(
//           path: drawPath(),
//         ),
//       ),
//     );
//   }
//
//   Path drawPath() {
//     final width = MediaQuery.of(context).size.width;
//     const height = 300.0;
//     final path = Path();
//     path.moveTo(0, height);
//     path.lineTo(width / 2, height * 0.5);
//     path.lineTo(width, height * 0.75);
//     return path;
//   }
// }
//
// class PathPainter extends CustomPainter {
//   Path path;
//   PathPainter({required this.path});
//   @override
//   void paint(Canvas canvas, Size size) {
//     // paint the line
//     final paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 4.0;
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }
//
//
// class ChartDataPoint {
//   double value;
//   ChartDataPoint({required this.value});
// }
//
//


import 'package:flutter/material.dart';

void main() {
  runApp(DemoApp());
}

class DemoApp extends StatelessWidget {
  // This widget is
  //the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipOval',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DemoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Devs'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ClipOval(
          child: Container(
            height: 350,
            width: 350,
            color: Colors.red,
          ),
          clipper: MyClip(),
        ),
      ),
      backgroundColor: Colors.lightBlue[50],
    );
  }
}

class MyClip extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return const Rect.fromLTRB(0, 100, 100, 100);
  }

  @override
  bool shouldReclip(oldClipper) {
    return false;
  }
}