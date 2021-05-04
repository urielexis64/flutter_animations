import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double percentage = 0.0;
  double newPercentage = 0.0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    controller.addListener(() {
      percentage = lerpDouble(percentage, newPercentage, controller.value);
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          percentage = newPercentage;
          newPercentage += 10;
          if (newPercentage > 100) {
            percentage = 0;
            newPercentage = 0;
          }
          controller.forward(from: 0.0);
          setState(() {});
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _RadialProgressPainter(percentage),
          ),
        ),
      ),
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  final double percentage;

  _RadialProgressPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    // Circle completed
    Paint paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);

    // Arc
    Paint arcPaint = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    // Filling part
    double arcAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, arcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
