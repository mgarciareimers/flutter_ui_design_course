import 'package:flutter/material.dart';

// Widgets.
import 'package:backgrounds_custom_painter/src/widgets/headers.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TriangularHeader(isTop: false),
    );
  }
}


