import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool topDots;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  const Slideshow({
    @required this.slides,
    this.topDots = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryBullet = 12.0,
    this.secondaryBullet = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: Center(
        child: Builder(builder: (context) {
          Provider.of<_SlideshowModel>(context).primaryColor =
              this.primaryColor;
          Provider.of<_SlideshowModel>(context).secondaryColor =
              this.secondaryColor;
          Provider.of<_SlideshowModel>(context).primaryBullet =
              this.primaryBullet;
          Provider.of<_SlideshowModel>(context).secondaryBullet =
              this.secondaryBullet;

          return _SlideshowStructure(topDots: topDots, slides: slides);
        }),
      ),
    );
  }
}

class _SlideshowStructure extends StatelessWidget {
  const _SlideshowStructure({
    @required this.slides,
    this.topDots,
  });

  final bool topDots;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      verticalDirection:
          topDots ? VerticalDirection.up : VerticalDirection.down,
      children: [
        Expanded(child: _Slides(this.slides)),
        _Dots(this.slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  _Dots(
    this.totalSlides,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);
    final pageViewIndex = ssModel.currentPage;
    final primaryColor = ssModel.primaryColor;
    final secondaryColor = ssModel.secondaryColor;
    final primaryBullet = ssModel.primaryBullet;
    final secondaryBullet = ssModel.secondaryBullet;

    double size = 0;
    Color color;

    if (pageViewIndex >= index - 0.5 && pageViewIndex <= index + 0.5) {
      size = primaryBullet;
      color = primaryColor;
    } else {
      size = secondaryBullet;
      color = secondaryColor;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: size,
      height: size,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(30),
        child: slide);
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  double _primaryBullet = 12;
  double _secondaryBullet = 12;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;

  set primaryColor(Color color) {
    this._primaryColor = color;
  }

  Color get secondaryColor => this._secondaryColor;

  set secondaryColor(Color color) {
    this._secondaryColor = color;
  }

  double get primaryBullet => this._primaryBullet;

  set primaryBullet(double size) {
    this._primaryBullet = size;
  }

  double get secondaryBullet => this._secondaryBullet;

  set secondaryBullet(double size) {
    this._secondaryBullet = size;
  }
}
