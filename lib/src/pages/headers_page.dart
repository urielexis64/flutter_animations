import 'package:custom_painter/src/widgets/headers.dart';
import 'package:custom_painter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(
      child: Scaffold(
          body: CurveHeader(
        color: appTheme.accentColor,
      )),
    );
  }
}
