import 'package:custom_painter/src/widgets/slideshow.dart';
import 'package:custom_painter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Expanded(child: MySlideshow()),
          Expanded(child: MySlideshow()),
        ],
      )),
    );
  }
}

class MySlideshow extends StatelessWidget {
  const MySlideshow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Slideshow(
      primaryColor: appTheme.darkTheme ? accentColor : Colors.red,
      primaryBullet: 15,
      secondaryBullet: 10,
      slides: [
        SvgPicture.asset('assets/svgs/slide_1.svg'),
        SvgPicture.asset('assets/svgs/slide_2.svg'),
        SvgPicture.asset('assets/svgs/slide_3.svg'),
        SvgPicture.asset('assets/svgs/slide_4.svg'),
      ],
    );
  }
}
