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
  Animation<double> opacity;
  Animation<double> moveRight;
  Animation<double> scaleUp;
  Animation<double> opacityOut;

  CurvedAnimation curveRotation, curveOpacity, curveMoveRight, curveScaleUp, curveOpacityOut;

  @override
  void initState() {
    this.controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    //this.rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(controller);

    // Rotation.
    this.curveRotation = new CurvedAnimation(parent: this.controller, curve: Curves.easeOut);
    //this.rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(controller);
    this.rotation = new Tween(begin: 0.0, end: 2 * Math.pi).animate(this.curveRotation);

    // Opacity.
    this.curveOpacity = new CurvedAnimation(parent: this.controller, curve: Interval(0.0, 0.25, curve: Curves.easeOut)); // Interval animates from 0 to 1 of the total animation time.
    this.opacity = new Tween(begin: 0.0, end: 1.0).animate(this.curveOpacity);

    // Move right.
    this.curveMoveRight = new CurvedAnimation(parent: this.controller, curve: Interval(0.0, 1, curve: Curves.easeOut));
    this.moveRight = new Tween(begin: 0.0, end: 100.0).animate(this.curveMoveRight);

    // Scale Up.
    this.curveScaleUp = new CurvedAnimation(parent: this.controller, curve: Interval(0.0, 1, curve: Curves.easeOut));
    this.scaleUp = new Tween(begin: 0.0, end: 2.0).animate(this.curveScaleUp);

    // Opacity Out.
    this.curveOpacityOut = new CurvedAnimation(parent: this.controller, curve: Interval(0.75, 1, curve: Curves.easeOut)); // Interval animates from 0 to 1 of the total animation time.
    this.opacityOut = new Tween(begin: 0.0, end: 1.0).animate(this.curveOpacityOut);

    this.controller.addListener(() {
      // Do the something when animation is completed.
      if (controller.status == AnimationStatus.completed) {
        //controller.reverse();
        controller.reset();
        //controller.repeat();
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
      child: _Rectangle(),
      animation: controller,
      builder: (BuildContext context, Widget rectangleChild) {
        return Transform.scale(
          scale: this.scaleUp.value,
          child: Transform.translate(
            offset: Offset(this.moveRight.value, 0),
            child: Transform.rotate(
              angle: this.rotation.value,
              child: Opacity(
                opacity: this.opacity.value - this.opacityOut.value,
                child: rectangleChild,
              ),
            ),
          ),
        );
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