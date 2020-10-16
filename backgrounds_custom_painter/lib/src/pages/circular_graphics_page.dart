import 'package:flutter/material.dart';

// Widgets.
import 'package:backgrounds_design/src/widgets/radial_progress.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(percentage: percentage, primaryColor: Colors.red, secondaryColor: Colors.redAccent, width: 150, height: 150, fontSize: 20),
              CustomRadialProgress(percentage: percentage * 1.2, primaryColor: Colors.green, secondaryColor: Colors.lightGreen, width: 150, height: 150, fontSize: 20),
            ],
          ),
          CustomRadialProgress(percentage: percentage, primaryColor: Colors.blueGrey, secondaryColor: Colors.grey, width: 300, height: 300, fontSize: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(percentage: percentage * 1.4, primaryColor: Colors.lightBlue, secondaryColor: Colors.lightBlueAccent, width: 150, height: 150, fontSize: 20),
              CustomRadialProgress(percentage: percentage * 1.6, primaryColor: Colors.purple, secondaryColor: Colors.deepPurpleAccent, width: 150, height: 150, fontSize: 20),
            ],
          ),
        ],
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

class CustomRadialProgress extends StatelessWidget {
  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double width;
  final double height;
  final double fontSize;

  const CustomRadialProgress({ Key key, @required this.percentage, this.primaryColor, this.secondaryColor, @required this.width, @required this.height, this.fontSize }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.width,
        height: this.height,
        child: RadialProgress(percentage: this.percentage, primaryColor: this.primaryColor, secondaryColor: this.secondaryColor, fontSize: this.fontSize,),
      ),
    );
  }
}
