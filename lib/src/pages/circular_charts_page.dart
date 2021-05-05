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
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              percentage += 10;
              if (percentage > 100) percentage = 0;
            });
          },
          child: Icon(Icons.refresh),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                  percentage: percentage,
                  color: Colors.pinkAccent,
                ),
                CustomRadialProgress(
                  percentage: percentage,
                  color: Colors.redAccent,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                  percentage: percentage,
                  color: Colors.orangeAccent,
                ),
                CustomRadialProgress(
                  percentage: percentage,
                  color: Colors.purpleAccent,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final color;

  const CustomRadialProgress({@required this.percentage, @required this.color});

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 150,
        child: RadialProgress(
          percentage: percentage,
          primaryColor: color,
          secondaryColor: Colors.grey[200],
          primaryStroke: 10,
          secondaryStroke: 5,
        ));
  }
}
