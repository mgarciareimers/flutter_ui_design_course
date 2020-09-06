import 'package:backgrounds_custom_painter/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class CircularGraphicsPage extends StatefulWidget {
  @override
  _CircularGraphicsPageState createState() => _CircularGraphicsPageState();
}

class _CircularGraphicsPageState extends State<CircularGraphicsPage> {
  double percentage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: Icon(Icons.refresh, color: Colors.white),
        onPressed: () => this._onButtonPressed(),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: RadialProgress(percentage: this.percentage, primaryColor: Colors.deepPurple),
        ),
      ),

    );
  }

  // Method that is called when the user clicks the button.
  void _onButtonPressed() {
    this.percentage = this.percentage + 10;

    if (this.percentage > 100) {
      this.percentage = 0;
    }

    this.setState(() {});
  }
}
