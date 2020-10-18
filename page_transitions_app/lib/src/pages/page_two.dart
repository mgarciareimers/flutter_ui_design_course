import 'package:flutter/material.dart';

class PageTwoPage extends StatelessWidget {
  final Color color;

  const PageTwoPage({Key key, @required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: this.color,
        title: Text('Page 2'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Page 2', style: TextStyle(color: this.color)),
      ),
    );
  }
}
