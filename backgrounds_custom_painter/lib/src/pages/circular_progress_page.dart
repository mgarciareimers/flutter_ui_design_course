import 'package:flutter/material.dart';
import 'dart:math' as Math;
class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _MyRadialProgressPainter(50),
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
