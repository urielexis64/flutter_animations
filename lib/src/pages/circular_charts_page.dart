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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomRadialProgress(
                  percentage: percentage,
                  gradient: LinearGradient(colors: [
                    Colors.blueAccent,
                    Colors.limeAccent,
                    Colors.redAccent,
                    Colors.orangeAccent
                  ]),
                ),
                CustomRadialProgress(
                  percentage: percentage,
                  gradient: LinearGradient(colors: [
                    Colors.blueAccent,
                    Colors.limeAccent,
                  ]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                  percentage: percentage,
                  gradient: LinearGradient(colors: [
                    Colors.purpleAccent,
                    Colors.lightBlueAccent,
                  ]),
                ),
                CustomRadialProgress(
                  percentage: percentage,
                  gradient: LinearGradient(colors: [
                    Colors.amberAccent,
                    Colors.lightBlueAccent,
                  ]),
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
  final gradient;

  const CustomRadialProgress(
      {@required this.percentage, this.color, this.gradient});

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 150,
        child: RadialProgress(
          percentage: percentage,
          primaryColor: color != null ? color : null,
          gradient: gradient != null ? gradient : null,
          secondaryColor: Colors.grey[200],
          primaryStroke: 10,
          secondaryStroke: 5,
        ));
  }
}
