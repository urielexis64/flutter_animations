import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* body: _Title(), */
      /*  body: _TasksList(), */
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(bottom: 0, right: 0, child: _NewListButton())
        ],
      ),
    );
  }
}

class _NewListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
        minWidth: size.width * .8,
        height: 60,
        child: RaisedButton(
          onPressed: () {},
          color: Color(0xffed6762),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(80))),
          child: Text(
            "CREATE NEW LIST",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 3),
          ),
        ));
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xfff08f66)),
    _ListItem('Family', Color(0xfff2a38a)),
    _ListItem('Subscriptions', Color(0xfff7cdd5)),
    _ListItem('Books', Color(0xfffcebaf)),
    _ListItem('Orange', Color(0xfff08f66)),
    _ListItem('Family', Color(0xfff2a38a)),
    _ListItem('Subscriptions', Color(0xfff7cdd5)),
    _ListItem('Books', Color(0xfffcebaf)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /* SliverAppBar(
          backgroundColor: Colors.red,
          title: Text('Title'),
          floating: true,
          expandedHeight: 50,
        ), */
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
                minHeight: 170,
                maxHeight: 200,
                child: Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                    child: _Title()))),
        SliverList(
            delegate: SliverChildListDelegate([...items, SizedBox(height: 80)]))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {@required this.minHeight,
      @required this.maxHeight,
      @required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text('New',
                style: TextStyle(color: Color(0xff532128), fontSize: 50)),
          ),
          Stack(
            children: [
              Text('List',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 50,
                      fontWeight: FontWeight.bold)),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  height: 5,
                  width: 190,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TasksList extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xfff08f66)),
    _ListItem('Family', Color(0xfff2a38a)),
    _ListItem('Subscriptions', Color(0xfff7cdd5)),
    _ListItem('Books', Color(0xfffcebaf)),
    _ListItem('Orange', Color(0xfff08f66)),
    _ListItem('Family', Color(0xfff2a38a)),
    _ListItem('Subscriptions', Color(0xfff7cdd5)),
    _ListItem('Books', Color(0xfffcebaf)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String text;
  final Color color;

  _ListItem(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        this.text,
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      margin: EdgeInsets.all(10),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: this.color, borderRadius: BorderRadius.circular(30)),
    );
  }
}
