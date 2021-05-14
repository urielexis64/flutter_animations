import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BigButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;
  final Function onPress;

  const BigButton(
      {@required this.icon,
      @required this.text,
      this.color1 = Colors.grey,
      this.color2 = Colors.blueGrey,
      @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(children: [
        _BigButtonBack(this.color1, this.color2, this.icon),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 140,
              width: 40,
            ),
            FaIcon(this.icon, color: Colors.white, size: 40),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                this.text,
                style: TextStyle(color: Colors.white),
              ),
            ),
            FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.white,
            ),
            SizedBox(
              width: 40,
            ),
          ],
        )
      ]),
    );
  }
}

class _BigButtonBack extends StatelessWidget {
  final Color color1;
  final Color color2;
  final IconData icon;

  _BigButtonBack(
    this.color1,
    this.color2,
    this.icon,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      child: Stack(children: [
        Positioned(
            right: -20,
            top: -20,
            child: FaIcon(
              this.icon,
              size: 150,
              color: Colors.white.withOpacity(0.1),
            ))
      ]),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(4, 8),
                blurRadius: 8,
                color: Colors.black.withOpacity(0.2))
          ],
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [this.color1, this.color2])),
    );
  }
}
