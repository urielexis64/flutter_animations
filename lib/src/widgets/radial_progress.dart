import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RadialProgress extends StatefulWidget {
  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryStroke;
  final double secondaryStroke;
  final Gradient gradient;

  const RadialProgress(
      {@required this.percentage,
      this.primaryColor,
      this.secondaryColor = Colors.grey,
      this.primaryStroke = 10,
      this.secondaryStroke = 5,
      this.gradient});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double _lastPercentage;

  @override
  void initState() {
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
    assert(widget.gradient == null || widget.primaryColor == null,
        'Cannot provide both gradient and a color.');
    assert(widget.primaryStroke >= widget.secondaryStroke,
        'Background stroke width can\'t be bigger than stroke width');

    _controller.forward(from: 0);

    final differenceAnim = widget.percentage - _lastPercentage;
    _lastPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _RadialProgressPainter(
                  percentage: (widget.percentage - differenceAnim) +
                      (differenceAnim * _controller.value),
                  primaryColor:
                      widget.primaryColor != null ? widget.primaryColor : null,
                  secondaryColor: widget.secondaryColor,
                  gradient: widget.gradient != null ? widget.gradient : null,
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
  final Gradient gradient;

  _RadialProgressPainter({
    @required this.percentage,
    this.primaryColor,
    this.secondaryColor,
    this.primaryStroke = 10,
    this.secondaryStroke = 5,
    this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(center: Offset(0, 0), radius: 180);

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
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    if (primaryColor != null) {
      arcPaint.color = primaryColor;
    } else {
      arcPaint.shader = gradient.createShader(rect);
    }

    // Filling part
    double arcAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, arcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
