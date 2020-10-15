import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:backgrounds_design/src/pages/headers_page.dart';
import 'package:backgrounds_design/src/challenges/animated_square_page.dart';
import 'package:backgrounds_design/src/pages/circular_graphics_page.dart';
import 'package:backgrounds_design/src/pages/slideshow_page.dart';
import 'package:backgrounds_design/src/pages/pinterest_page.dart';
import 'package:backgrounds_design/src/pages/emergency_page.dart';
import 'package:backgrounds_design/src/pages/sliver_list_page.dart';

final List<_Route> pageRoutes = [
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlideShowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergency', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Headers', HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Animated Square', AnimatedSquarePage()),
  _Route(FontAwesomeIcons.circleNotch, 'Circular Progress', CircularGraphicsPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliverListPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}