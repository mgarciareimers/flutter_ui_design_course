import 'package:flutter/material.dart';

// SQUARED HEADER.
class SquaredHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

// SQUARED RADIUS HEADER.
class SquaredRadiusHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
      ),
    );
  }
}

// DIAGONAL HEADER.
class DiagonalHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _DiagonalHeaderPainter(),
      ),
    );
  }
}

class _DiagonalHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // If .stroke, paint draws lines (no fill).
    paint.strokeWidth = 1;

    final path = new Path();

    // Define path.
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// TRIANGULAR CONTAINER.
class TriangularHeader extends StatelessWidget {
  final bool isTop;

  const TriangularHeader({Key key, this.isTop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _TriangularHeaderPainter(this.isTop),
      ),
    );
  }
}

class _TriangularHeaderPainter extends CustomPainter {
  final bool isTop;

  _TriangularHeaderPainter(this.isTop);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // If .stroke, paint draws lines (no fill).
    paint.strokeWidth = 1;

    final path = new Path();

    // Define path.
    path.lineTo(size.width, size.height);
    path.lineTo(this.isTop ? size.width : 0, this.isTop ? 0 : size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// PEAK HEADER.
class PeakHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _PeakHeaderPainter(),
      ),
    );
  }
}

class _PeakHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // If .stroke, paint draws lines (no fill).
    paint.strokeWidth = 1;

    final path = new Path();

    // Define path.
    path.lineTo(0, size.height * 0.27);
    path.lineTo(size.width * 0.5, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.27);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// CURVE HEADER.
class CurveHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _CurveHeaderPainter(),
      ),
    );
  }
}

class _CurveHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // If .stroke, paint draws lines (no fill).
    paint.strokeWidth = 1;

    final path = new Path();

    // Define path.
    path.lineTo(0, size.height * 0.27);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.4, size.width, size.height * 0.27);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// CURVE EXTRA HEADER.
class WaveHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // If .stroke, paint draws lines (no fill).
    paint.strokeWidth = 1;

    final path = new Path();

    // Define path.
    path.lineTo(0, size.height * 0.27);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.33, size.width * 0.5, size.height * 0.27);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.21, size.width, size.height * 0.27);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


