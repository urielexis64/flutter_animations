import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryStroke;
  final double secondaryStroke;

  const RadialProgress({
    @required this.percentage,
    this.primaryColor = Colors.pink,
    this.secondaryColor = Colors.grey,
    this.primaryStroke = 10,
    this.secondaryStroke = 5,
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double _lastPercentage;

  @override
  void initState() {
    assert(widget.primaryStroke >= widget.secondaryStroke,
        'Background stroke width can\'t be bigger than stroke width');
    _lastPercentage = widget.percentage;
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward(from: 0);

    final differenceAnim = widget.percentage - _lastPercentage;
    _lastPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _RadialProgressPainter(
                  percentage: (widget.percentage - differenceAnim) +
                      (differenceAnim * _controller.value),
                  primaryColor: widget.primaryColor,
                  secondaryColor: widget.secondaryColor,
                  primaryStroke: widget.primaryStroke,
                  secondaryStroke: widget.secondaryStroke),
            ));
      },
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryStroke;
  final double secondaryStroke;

  _RadialProgressPainter({
    @required this.percentage,
    this.primaryColor,
    this.secondaryColor,
    this.primaryStroke = 10,
    this.secondaryStroke = 5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Circle completed
    Paint paint = Paint()
      ..strokeWidth = secondaryStroke
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);

    // Arc
    Paint arcPaint = Paint()
      ..strokeWidth = primaryStroke
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Filling part
    double arcAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, arcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
