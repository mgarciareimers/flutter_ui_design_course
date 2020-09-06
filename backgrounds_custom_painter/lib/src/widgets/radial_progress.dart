import 'package:flutter/material.dart';
import 'dart:math' as Math;

class RadialProgress extends StatefulWidget {
  final percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryStroke;
  final double secondaryStroke;

  const RadialProgress({
    Key key,
    @required this.percentage,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryStroke = 10,
    this.secondaryStroke = 4,
  }) : super(key: key);

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {
  AnimationController controller;
  double previousPercentage;

  @override
  void initState() {
    this.previousPercentage = widget.percentage;

    this.controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    this.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    this.controller.forward(from: 0);

    final animationDifference = this.previousPercentage == 100 ? 0 : widget.percentage - this.previousPercentage;
    this.previousPercentage = widget.percentage;

    print(animationDifference);

    return AnimatedBuilder(
      animation: this.controller,
      builder: (BuildContext context, Widget child) {
        return Stack(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(painter: _MyRadialProgressPainter((widget.percentage - animationDifference) + (animationDifference * controller.value ), widget.primaryColor, widget.secondaryColor, widget.primaryStroke, widget.secondaryStroke)),
            ),
            Center(child: Text('${ widget.percentage.toInt() }%', style: TextStyle(fontSize: 50))),
          ],
        );
      },
    );
  }
}

class _MyRadialProgressPainter extends CustomPainter {
  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryStroke;
  final double secondaryStroke;

  _MyRadialProgressPainter(this.percentage, this.primaryColor, this.secondaryColor, this.primaryStroke, this.secondaryStroke);

  @override
  void paint(Canvas canvas, Size size) {
    // Completed circle.
    final paint = new Paint()
      ..strokeWidth = this.secondaryStroke
      ..color = this.secondaryColor
      ..style = PaintingStyle.stroke;

    final Offset center = new Offset(size.width * 0.5, size.height * 0.5);
    final double radius = Math.min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // Progress arch.
    final paintArch = new Paint()
      ..strokeWidth = this.primaryStroke
      ..color = this.primaryColor
      ..style = PaintingStyle.stroke;

    // Arch filling.
    double archAngle = 2 * Math.pi * (this.percentage / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius:  radius), - Math.pi / 2, archAngle, false, paintArch);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
