import 'package:flutter/material.dart';

// Widgets.
import 'package:backgrounds_custom_painter/src/pages/headers_page.dart';

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
      home: HeadersPage(),
    );
  }
}
