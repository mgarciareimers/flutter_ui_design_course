import 'package:flutter/material.dart';

// Pages.
import 'package:page_transitions_app/src/pages/page_two.dart';

class PageOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 40),
          _CustomButton(text: 'Slide Transition', color: Colors.blue, onClick: () => this._createRouteSlideTransition(Colors.blue)),
          SizedBox(height: 20),
          _CustomButton(text: 'Scale Transition', color: Colors.green, onClick: () => this._createRouteScaleTransition(Colors.green)),
          SizedBox(height: 20),
          _CustomButton(text: 'Rotation Transition', color: Colors.orange, onClick: () => this._createRouteRotationTransition(Colors.orange)),
          SizedBox(height: 20),
          _CustomButton(text: 'Fade Transition', color: Colors.red, onClick: () => this._createRouteFadeTransition(Colors.red)),
          SizedBox(height: 20),
          _CustomButton(text: 'Mixed Transition', color: Colors.purple, onClick: () => this._createRouteMixedTransition(Colors.purple)),
        ],
      ),
    );
  }

  // Method that creates the route as slide transition.
  Route _createRouteSlideTransition(Color color) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => PageTwoPage(color: color),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final CurvedAnimation curvedAnimation = new CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        return SlideTransition(
          position: Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(curvedAnimation),
          child: child,
        );
      },
    );
  }

  // Method that creates the route as scale transition.
  Route _createRouteScaleTransition(Color color) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => PageTwoPage(color: color),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final CurvedAnimation curvedAnimation = new CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        return ScaleTransition(
          scale: Tween<double>(begin: 0, end: 1).animate(curvedAnimation),
          child: child,
        );
      },
    );
  }

  // Method that creates the route as rotation transition.
  Route _createRouteRotationTransition(Color color) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => PageTwoPage(color: color),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final CurvedAnimation curvedAnimation = new CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        return RotationTransition(
          turns: Tween<double>(begin: 0, end: 1).animate(curvedAnimation),
          child: child,
        );
      },
    );
  }

  // Method that creates the route as fade transition.
  Route _createRouteFadeTransition(Color color) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => PageTwoPage(color: color),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final CurvedAnimation curvedAnimation = new CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        return FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(curvedAnimation),
          child: child,
        );
      },
    );
  }

  // Method that creates the route as mixed fade and rotation transition.
  Route _createRouteMixedTransition(Color color) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => PageTwoPage(color: color),
      transitionDuration: Duration(milliseconds: 1000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final CurvedAnimation curvedAnimation = new CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        return FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(curvedAnimation),
          child: RotationTransition(
            turns: Tween<double>(begin: 0, end: 1).animate(curvedAnimation),
            child: child,
          ),
        );
      },
    );
  }
}

class _CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function() onClick;

  const _CustomButton({ Key key, @required this.text, @required this.color, @required this.onClick }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: Text(this.text, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          decoration: BoxDecoration(
            color: this.color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onTap: () => Navigator.push(context, this.onClick()),
      ),
    );
  }
}

