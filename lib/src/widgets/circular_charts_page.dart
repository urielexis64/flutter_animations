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
        child: Text(
          '$percentage %',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
