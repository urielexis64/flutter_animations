import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _AnimatedRect(),
      ),
    );
  }
}

class _AnimatedRect extends StatefulWidget {
  @override
  _AnimatedRectState createState() => _AnimatedRectState();
}

class _AnimatedRectState extends State<_AnimatedRect>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotation;
  Animation<double> opacity;
  Animation<double> opacityOut;
  Animation<double> moveRight;
  Animation<double> scale;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    rotation = Tween(begin: 0.0, end: 1.0 * Math.pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    opacity = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, .5, curve: Curves.ease)));
    opacityOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.75, 1.0, curve: Curves.ease)));
    moveRight = Tween(begin: 0.0, end: 150.0).animate(controller);
    scale = Tween(begin: 0.0, end: 1.4).animate(controller);

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: controller,
          child: Rectangle(),
          builder: (BuildContext context, Widget child) {
            return Transform.scale(
              scale: scale.value,
              child: Transform.translate(
                offset: Offset(moveRight.value, 0),
                child: Transform.rotate(
                    angle: rotation.value,
                    child: Opacity(
                      opacity: opacity.value - opacityOut.value,
                      child: child,
                    )),
              ),
            );
          },
        ),
        TextButton(onPressed: () => controller.forward(), child: Text('XD'))
      ],
    );
  }
}

class Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
