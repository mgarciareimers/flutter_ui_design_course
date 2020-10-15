import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

// WAVE HEADER.
class WaveHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _WaveHeaderPainter(),
      ),
    );
  }
}

class _WaveHeaderPainter extends CustomPainter {
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

// WAVE GRADIENT HEADER.
class WaveGradientHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _WaveGradientHeaderPainter(),
      ),
    );
  }
}

class _WaveGradientHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = new Rect.fromCircle(
      center: Offset(0, 25),
      radius: 180
    );


    final Gradient gradient = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff615AAB),
        Color(0xffC012FF),
        Color(0xff6D05FA),
      ],
      stops: [
        0.2,
        0.5,
        1,
      ],
    );

    final paint = new Paint()..shader = gradient.createShader(rect);

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

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color colorStart;
  final Color colorEnd;

  const IconHeader({ @required this.icon, @required this.title, @required this.subtitle, this.colorStart = Colors.grey, this.colorEnd = Colors.blueGrey });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _IconHeaderBackground(colorStart: this.colorStart, colorEnd: this.colorEnd),
        Positioned(
          top: -50,
          left: -50,
          child: FaIcon(this.icon, size: 220, color: Colors.white.withOpacity(0.2)),
        ),
        Column(
          children: [
            SizedBox(height: 80, width: double.infinity),
            Text(this.subtitle, style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.7)), textAlign: TextAlign.center),
            SizedBox(height: 20),
            Text(this.title, style: TextStyle(fontSize: 25, color: Colors.white.withOpacity(0.7), fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            SizedBox(height: 20),
            FaIcon(this.icon, size: 80, color: Colors.white),
          ],
        )
      ]
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color colorStart;
  final Color colorEnd;

  const _IconHeaderBackground({ @required this.colorStart, @required this.colorEnd });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color> [
            this.colorStart,
            this.colorEnd,
          ],
        )
      ),
    );
  }
}
