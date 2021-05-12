import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.onPressed, @required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool show;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;

  final List<PinterestButton> items;

  PinterestMenu({
    @required this.items,
    this.show = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.pink,
    this.inactiveColor = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => _MenuModel(),
        child: Builder(
          builder: (context) {
            Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = inactiveColor;

            return AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: show ? 1 : 0,
                child: _PinteresMenuBack(items: items));
          },
        ));
  }
}

class _PinteresMenuBack extends StatelessWidget {
  const _PinteresMenuBack({
    @required this.items,
  });

  final List<PinterestButton> items;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      width: items.length * 65.0,
      height: 60,
      child: _MenuItems(items),
      decoration: BoxDecoration(
          color: backgroundColor,
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
    final selectedItem = Provider.of<_MenuModel>(context).selectedItem;
    final activeColor = Provider.of<_MenuModel>(context).activeColor;
    final inactiveColor = Provider.of<_MenuModel>(context).inactiveColor;

    double size = 25;
    Color color = inactiveColor;

    if (selectedItem == index) {
      size = 30;
      color = activeColor;
    }

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).selectedItem = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: size,
          color: color,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _selectedItem = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.pink;
  Color _inactiveColor = Colors.blueGrey;

  int get selectedItem => this._selectedItem;

  set selectedItem(int index) {
    _selectedItem = index;
    notifyListeners();
  }

  Color get backgroundColor => this._backgroundColor;

  set backgroundColor(Color color) {
    _backgroundColor = color;
  }

  Color get activeColor => this._activeColor;

  set activeColor(Color color) {
    _activeColor = color;
  }

  Color get inactiveColor => this._inactiveColor;

  set inactiveColor(Color color) {
    _inactiveColor = color;
  }
}
