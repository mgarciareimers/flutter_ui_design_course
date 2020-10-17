import 'package:flutter/material.dart';

class ShoeSizePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      height: 430,
      decoration: BoxDecoration(
        color: Color(0xffFFCF53),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        children: [
          _Shoe(),
        ],
      ),
    );
  }
}

class _Shoe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(60),
      child: Stack(
        children: [
          Image(image: AssetImage('assets/img/blue.png'),)
        ],
      ),
    );
  }
}

