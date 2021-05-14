import 'package:custom_painter/src/widgets/big_button.dart';
import 'package:custom_painter/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class _ItemButton {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;

  _ItemButton(this.icon, this.text, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <_ItemButton>[
      _ItemButton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      _ItemButton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      _ItemButton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      _ItemButton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      _ItemButton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      _ItemButton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      _ItemButton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      _ItemButton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      _ItemButton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      _ItemButton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      _ItemButton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      _ItemButton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> mapItems = items
        .map((e) => BigButton(
            icon: e.icon,
            text: e.text,
            color1: e.color1,
            color2: e.color2,
            onPress: () {
              print(e.text);
            }))
        .toList();

    return Scaffold(
        body: Center(
            child: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 200),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [SizedBox(height: 80), ...mapItems],
          ),
        ),
        _MainHeader(),
      ],
    )));
  }
}

class _MainHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
            icon: FontAwesomeIcons.carCrash,
            title: "Motor Accident",
            subtitle: "You have requested"),
        Positioned(
            right: 0,
            top: 50,
            child: RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(),
              child: PopupMenuButton(
                tooltip: 'Settings',
                iconSize: 20,
                offset: Offset(-20, 5),
                icon: FaIcon(
                  FontAwesomeIcons.ellipsisV,
                  color: Colors.white,
                ),
                itemBuilder: (BuildContext context) {
                  return [PopupMenuItem(child: Text('Settings'))];
                },
              ),
            ))
      ],
    );
  }
}
