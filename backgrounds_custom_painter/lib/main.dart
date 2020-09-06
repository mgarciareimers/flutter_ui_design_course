import 'package:flutter/material.dart';

// Pages.
import 'package:backgrounds_custom_painter/src/pages/headers_page.dart';
import 'package:backgrounds_custom_painter/src/pages/animations_page.dart';
import 'package:backgrounds_custom_painter/src/challenges/animated_square_page.dart';
import 'package:backgrounds_custom_painter/src/labs/circular_progress_page.dart';
import 'package:backgrounds_custom_painter/src/pages/circular_graphics_page.dart';
import 'package:backgrounds_custom_painter/src/pages/slideshow_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Designs',
      debugShowCheckedModeBanner: false,
      home: SlideShowPage(),
    );
  }
}
