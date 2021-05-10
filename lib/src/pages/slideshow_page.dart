import 'package:custom_painter/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slideshow(
        slides: [
          SvgPicture.asset('assets/svgs/slide_3.svg'),
          SvgPicture.asset('assets/svgs/slide_3.svg'),
          SvgPicture.asset('assets/svgs/slide_3.svg'),
          SvgPicture.asset('assets/svgs/slide_3.svg'),
          SvgPicture.asset('assets/svgs/slide_3.svg'),
        ],
      ),
    );
  }
}
