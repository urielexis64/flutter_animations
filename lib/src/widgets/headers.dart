import 'package:flutter/material.dart';

class SquareHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615aab),
    );
  }
}

class CircularHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
    );
  }
}

class DiagonalHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderDiagonalPainter()),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final paint = Paint();
    final path = Path();

    // Propiedades
    paint.color = Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;

    // Dibujar con el path y el paint
    path.moveTo(0, height * .35);
    path.lineTo(width, height * .3);
    path.lineTo(width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class TriangleHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderTrianglePainter()),
    );
  }
}

class _HeaderTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final paint = Paint();
    final path = Path();

    // Propiedades
    paint.color = Color(0xff615aab);
    paint.style = PaintingStyle.fill;

    // Dibujar con el path y el paint
    path.lineTo(width, height);
    path.lineTo(width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PeakHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderPeakPainter()),
    );
  }
}

class _HeaderPeakPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final paint = Paint();
    final path = Path();

    // Propiedades
    paint.color = Color(0xff615aab);
    paint.style = PaintingStyle.fill;

    // Dibujar con el path y el paint
    path.lineTo(0, height * .25);
    path.lineTo(width * .5, height * .35);
    path.lineTo(width, height * .25);
    path.lineTo(width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class CurveHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderCurvePainter()),
    );
  }
}

class _HeaderCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final Rect rect = Rect.fromCircle(center: Offset(165, 55), radius: 180);
    final Gradient gradient =
        LinearGradient(colors: [Colors.redAccent, Colors.amber]);

    final paint = Paint();
    final path = Path();

    // Propiedades
    paint.color = Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.shader = gradient.createShader(rect);

    // Dibujar con el path y el paint
    path.lineTo(0, height * .85);
    path.quadraticBezierTo(width * .25, height * .90, width * .5, height * .85);
    path.quadraticBezierTo(width * .75, height * .80, width, height * .85);
    path.lineTo(width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class IconHeader extends StatelessWidget {
  const IconHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff526bf6), Color(0xff67acf2)]),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
    );
  }
}
