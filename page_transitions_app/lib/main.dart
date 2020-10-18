import 'package:flutter/material.dart';

// Pages.
import 'package:page_transitions_app/src/pages/page_one.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: PageOnePage(),
    );
  }
}