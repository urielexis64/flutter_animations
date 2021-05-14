import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:custom_painter/src/challenges/animated_square_page.dart';
import 'package:custom_painter/src/labs/circular_progress_page.dart';
import 'package:custom_painter/src/pages/emergency_page.dart';
import 'package:custom_painter/src/pages/headers_page.dart';
import 'package:custom_painter/src/pages/pinterest_page.dart';
import 'package:custom_painter/src/pages/slideshow_page.dart';
import 'package:custom_painter/src/pages/sliver_list_page.dart';

final pageRoutes = <_Route>[
  _Route(
      icon: FontAwesomeIcons.slideshare,
      title: 'Slideshow',
      page: SlideshowPage()),
  _Route(
      icon: FontAwesomeIcons.ambulance,
      title: 'Emergency',
      page: EmergencyPage()),
  _Route(icon: FontAwesomeIcons.heading, title: 'Headers', page: HeadersPage()),
  _Route(
      icon: FontAwesomeIcons.peopleCarry,
      title: 'Animated Square',
      page: AnimatedSquarePage()),
  _Route(
      icon: FontAwesomeIcons.circleNotch,
      title: 'Progress Bar',
      page: CircularProgressPage()),
  _Route(
      icon: FontAwesomeIcons.pinterest,
      title: 'Pinterest',
      page: PinterestPage()),
  _Route(
      icon: FontAwesomeIcons.mobile, title: 'Slivers', page: SliverListPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route({this.icon, this.title, this.page});
}
