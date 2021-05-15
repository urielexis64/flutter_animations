import 'package:custom_painter/src/widgets/pinterest_menu.dart';
import 'package:custom_painter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [PinterestGrid(), _PinterestMenuLocated()],
        ),
      ),
    );
  }
}

class _PinterestMenuLocated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final show = Provider.of<_MenuModel>(context).show;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Positioned(
        bottom: 0,
        child: Container(
            height: 100,
            width: width,
            child: Align(
                child: PinterestMenu(
              show: show,
              activeColor: appTheme.accentColor,
              backgroundColor: appTheme.scaffoldBackgroundColor,
              items: [
                PinterestButton(
                    icon: Icons.pie_chart,
                    onPressed: () {
                      print('pie_chart');
                    }),
                PinterestButton(
                    icon: Icons.search,
                    onPressed: () {
                      print('search');
                    }),
                PinterestButton(
                    icon: Icons.notifications,
                    onPressed: () {
                      print('notifications');
                    }),
                PinterestButton(
                    icon: Icons.supervised_user_circle,
                    onPressed: () {
                      print('supervised_user_circle');
                    }),
                PinterestButton(
                    icon: Icons.favorite,
                    onPressed: () {
                      print('favorite');
                    }),
              ],
            ))));
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(50, (index) => index);
  ScrollController controller = ScrollController();
  double lastScrollValue = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      final provider = Provider.of<_MenuModel>(context, listen: false);
      if (controller.offset > lastScrollValue && controller.offset > 150) {
        provider.show = false;
      } else {
        provider.show = true;
      }
      lastScrollValue = controller.offset;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      physics: BouncingScrollPhysics(),
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5),
      clipBehavior: Clip.antiAlias,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
      /*  child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ) */
      child: FadeInImage(
        image: NetworkImage(
          'https://picsum.photos/id/$index/200',
        ),
        placeholder: NetworkImage(
          'https://media3.giphy.com/media/3oEjI6SIIHBdRxXI40/giphy.gif',
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;

  get show => _show;

  set show(bool value) {
    _show = value;
    notifyListeners();
  }
}
