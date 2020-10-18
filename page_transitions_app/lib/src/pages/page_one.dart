import 'package:flutter/material.dart';

class PageOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Page 1'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () {},
      ),
    );
  }
}
