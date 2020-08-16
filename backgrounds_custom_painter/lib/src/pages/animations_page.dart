import 'package:flutter/material.dart';
import 'dart:math' as Math;

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
  //Animation<double> opacity;

  CurvedAnimation curve;

  @override
  void initState() {
    this.controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    //this.rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(controller);

    this.curve = new CurvedAnimation(parent: this.controller, curve: Curves.easeOut);
    //this.rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(controller);
    this.rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(this.curve);

    controller.addListener(() {
      // Do the something when animation is completed.
      if (controller.status == AnimationStatus.completed) {
        //controller.reverse();
        controller.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    this.controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Play the animation.
    this.controller.forward();

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Transform.rotate(angle: this.rotation.value, child: _Rectangle());
      },
    );
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