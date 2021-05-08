import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [Expanded(child: _Slides()), _Dots()],
    ));
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(),
          _Dot(),
          _Dot(),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: [
          _Slide('assets/svgs/slide_1.svg'),
          _Slide('assets/svgs/slide_2.svg'),
          _Slide('assets/svgs/slide_3.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svgPath;

  const _Slide(this.svgPath);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(30),
        child: SvgPicture.asset(svgPath));
  }
}
