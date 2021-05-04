import 'package:custom_painter/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class CircularChartsPage extends StatefulWidget {
  @override
  _CircularChartsPageState createState() => _CircularChartsPageState();
}

class _CircularChartsPageState extends State<CircularChartsPage> {
  double percentage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            percentage += 10;
            if (percentage > 100) percentage = 0;
          });
        },
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(10),
            width: 250,
            height: 250,
            child: RadialProgress(
              percentage: percentage,
              primaryColor: Colors.red,
              secondaryColor: Colors.grey[200],
              primaryStroke: 20,
              secondaryStroke: 20,
            )),
      ),
    );
  }
}
