import 'package:custom_painter/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconHeader(
        icon: FontAwesomeIcons.plus,
        title: "Asistencia Cuántica",
        subtitle: "Has solicitado",
      ),
    );
  }
}
