import 'package:flutter/material.dart';

class AnimationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedRectangle(),
      ),
    );
  }
}

class AnimatedRectangle extends StatefulWidget {
  const AnimatedRectangle({Key key,}) : super(key: key);

  @override
  _AnimatedRectangleState createState() => _AnimatedRectangleState();
}

class _AnimatedRectangleState extends State<AnimatedRectangle> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotation;

  @override
  void initState() {
    this.controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    this.rotation = Tween(begin: 0.0, end: 360.0).animate(controller);



    super.initState();
  }

  @override
  void dispose() {
    this.controller.dispose();

    super.dispose();
  }

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