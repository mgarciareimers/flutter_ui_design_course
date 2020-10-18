import 'package:flutter/material.dart';

class PageTwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text('Page 2'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Page 2'),
      ),
    );
  }
}
