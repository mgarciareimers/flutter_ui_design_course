import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as Math;
class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {
  double percentage = 0;
  double newPercentage = 0;
  AnimationController controller;

  @override
  void initState() {
    this.controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    this.controller.addListener(() {
      this.percentage = lerpDouble(percentage, newPercentage, controller.value);
      this.setState(() {});
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: () {
          this.percentage = this.newPercentage;
          this.newPercentage = this.newPercentage + 10;

          if (this.newPercentage > 100) {
            this.percentage = 0;
            this.newPercentage = 0;
          }

          this.controller.forward(from: 0);

          this.setState(() {});
        },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _MyRadialProgressPainter(this.percentage),
          ),
        ),
      ),
    );
  }
}

class _MyRadialProgressPainter extends CustomPainter {
  final percentage;

  _MyRadialProgressPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    // Completed circle.
    final paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset center = new Offset(size.width * 0.5, size.height * 0.5);
    final double radius = Math.min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // Progress arch.
    final paintArch = new Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    // Arch filling.
    double archAngle = 2 * Math.pi * (this.percentage / 100);
    
    canvas.drawArc(Rect.fromCircle(center: center, radius:  radius), - Math.pi / 2, archAngle, false, paintArch);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
