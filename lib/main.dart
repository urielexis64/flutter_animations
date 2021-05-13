import 'package:custom_painter/src/pages/emergency_page.dart';
import 'package:custom_painter/src/pages/pinterest_page.dart';
import 'package:custom_painter/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Designs App',
        home: EmergencyPage());
  }
}
