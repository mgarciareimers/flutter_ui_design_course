import 'package:flutter/material.dart';

class AnimatedSquarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _AnimatedSquare()
      ),
    );
  }
}

class _AnimatedSquare extends StatefulWidget {
  const _AnimatedSquare({Key key}) : super(key: key);

  @override
  __AnimatedSquareState createState() => __AnimatedSquareState();
}

class __AnimatedSquareState extends State<_AnimatedSquare> with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation<double> moveRight, moveUp, moveLeft, moveDown;

  CurvedAnimation curveRight, curveUp, curveLeft, curveDown;

  @override
  void initState() {
    this.controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 4000));

    this.curveRight = new CurvedAnimation(parent: this.controller, curve: Interval(0.0, 0.25, curve: Curves.bounceOut));
    this.curveUp = new CurvedAnimation(parent: this.controller, curve: Interval(0.25, 0.5, curve: Curves.bounceOut));
    this.curveLeft = new CurvedAnimation(parent: this.controller, curve: Interval(0.5, 0.75, curve: Curves.bounceOut));
    this.curveDown = new CurvedAnimation(parent: this.controller, curve: Interval(0.75, 1.0, curve: Curves.bounceOut));

    this.moveRight = new Tween(begin: 0.0, end: 100.0).animate(this.curveRight);
    this.moveUp = new Tween(begin: 0.0, end: 100.0).animate(this.curveUp);
    this.moveLeft = new Tween(begin: 0.0, end: 100.0).animate(this.curveLeft);
    this.moveDown = new Tween(begin: 0.0, end: 100.0).animate(this.curveDown);

    this.controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
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
    this.controller.forward();

    //print(this.moveRight.value - this.moveLeft.value);
    return AnimatedBuilder(
      child: _Rectangle(),
      animation: this.controller,
      builder: (BuildContext context, Widget rectangleChild) {
        return Transform.translate(
          offset: Offset(this.moveRight.value - this.moveLeft.value, this.moveDown.value - this.moveUp.value),
          child: rectangleChild,
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