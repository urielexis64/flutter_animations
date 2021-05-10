import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool topDots;
  final Color primaryColor;
  final Color secondaryColor;

  const Slideshow({
    @required this.slides,
    this.topDots,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
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

          return _SlideshowStructure(topDots: topDots, slides: slides);
        }),
      ),
    );
  }
}

class _SlideshowStructure extends StatelessWidget {
  const _SlideshowStructure({
    Key key,
    @required this.topDots,
    @required this.slides,
  }) : super(key: key);

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

  const _Dots(
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

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);
    final pageViewIndex = ssModel.currentPage;
    final primaryColor = ssModel.primaryColor;
    final secondaryColor = ssModel.secondaryColor;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 10,
      height: 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: pageViewIndex >= index - 0.5 && pageViewIndex <= index + 0.5
              ? primaryColor
              : secondaryColor,
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

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
        /* children: [
          _Slide('assets/svgs/slide_1.svg'),
          _Slide('assets/svgs/slide_2.svg'),
          _Slide('assets/svgs/slide_3.svg'),
        ], */
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

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

  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  Color get primaryColor => _primaryColor;
  set primaryColor(Color color) {
    _primaryColor = color;
    notifyListeners();
  }

  Color get secondaryColor => _secondaryColor;
  set secondaryColor(Color color) {
    _secondaryColor = color;
    notifyListeners();
  }
}
