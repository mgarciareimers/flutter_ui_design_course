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
      body: Center(
        child: Text('Page 1'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () {
          //Navigator.push(context, this._createRouteSlideTransition());
          Navigator.push(context, this._createRouteScaleTransition());
        },
      ),
    );
  }

  // Method that creates the route as slide transition.
  Route _createRouteSlideTransition() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => PageTwoPage(),
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
  Route _createRouteScaleTransition() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => PageTwoPage(),
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
}
