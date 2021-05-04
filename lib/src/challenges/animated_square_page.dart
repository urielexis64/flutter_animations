import 'package:flutter/material.dart';

class AnimatedSquarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: _AnimatedSquare()));
  }
}

class _AnimatedSquare extends StatefulWidget {
  const _AnimatedSquare({
    Key key,
  }) : super(key: key);

  @override
  __AnimatedSquareState createState() => __AnimatedSquareState();
}

class __AnimatedSquareState extends State<_AnimatedSquare>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation<double> moveRight;
  Animation<double> moveUp;
  Animation<double> moveLeft;
  Animation<double> moveDown;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4500),
    );

    moveRight = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, 0.25, curve: Curves.bounceOut)));
    moveUp = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.25, 0.5, curve: Curves.bounceOut)));
    moveLeft = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 0.75, curve: Curves.bounceOut)));
    moveDown = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.75, 1, curve: Curves.bounceOut)));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangle(),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
              moveRight.value - moveLeft.value, moveDown.value - moveUp.value),
          child: child,
        );
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
