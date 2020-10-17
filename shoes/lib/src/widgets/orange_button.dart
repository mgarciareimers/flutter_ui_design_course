import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final String text;
  final double verticalPadding;
  final double horizontalPadding;
  final Color color;

  const OrangeButton({ Key key, @required this.text, @required this.verticalPadding, @required this.horizontalPadding, this.color = Colors.orange }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: this.horizontalPadding, vertical: this.verticalPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: this.color,
      ),
      child: Text(this.text, style: TextStyle(color: Colors.white)),
    );
  }
}
