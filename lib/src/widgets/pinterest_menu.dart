import 'dart:ffi';

import 'package:flutter/material.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.onPressed, @required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final List<PinterestButton> items = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _PinteresMenuBack(items: items),
    );
  }
}

class _PinteresMenuBack extends StatelessWidget {
  const _PinteresMenuBack({
    @required this.items,
  });

  final List<PinterestButton> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: items.length * 65.0,
      height: 60,
      child: _MenuItems(items),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: [
            BoxShadow(
                blurRadius: 12,
                spreadRadius: -4,
                color: Colors.black38,
                offset: Offset(0, 4))
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length,
          (index) => _PinterestMenuButton(index, menuItems[index])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onPressed,
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: 25,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
