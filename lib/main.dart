import 'package:custom_painter/src/challenges/animated_square_page.dart';
import 'package:custom_painter/src/pages/animations_page.dart';
import 'package:custom_painter/src/pages/circular_progress_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Designs App',
        home: CircularProgressPage());
  }
}
