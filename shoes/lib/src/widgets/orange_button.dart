import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final String text;

  const OrangeButton({ Key key, @required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.orange,
      ),
      child: Text(this.text, style: TextStyle(color: Colors.white),),
    );
  }
}
