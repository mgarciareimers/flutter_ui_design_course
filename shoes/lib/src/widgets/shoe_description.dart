import 'package:flutter/material.dart';

class ShoeDescription extends StatelessWidget {
  final String title;
  final String description;

  const ShoeDescription({ Key key, @required this.title, @required this.description }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(this.title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
          SizedBox(height: 10),
          Text(this.description, style: TextStyle(fontSize: 15, color: Colors.black54, height: 1.6)),
        ],
      ),
    );
  }
}
