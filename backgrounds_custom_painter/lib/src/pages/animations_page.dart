import 'package:flutter/material.dart';

class AnimationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _AnimatedRectangle(),
      ),
    );
  }
}

class _AnimatedRectangle extends StatefulWidget {
  const _AnimatedRectangle({Key key,}) : super(key: key);

  @override
  __AnimatedRectangleState createState() => __AnimatedRectangleState();
}

class __AnimatedRectangleState extends State<_AnimatedRectangle> {
  @override
  Widget build(BuildContext context) {
    return _Rectangle();
  }
}

class _Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.blue,
            ),
        ),
      ),
    );
  }
}