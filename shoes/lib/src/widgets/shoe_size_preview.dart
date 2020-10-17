import 'package:flutter/material.dart';

class ShoeSizePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffFFCF53),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        children: [
          _Shoe(),
          _ShoeSizes(),
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
          Positioned(bottom: 20, right: 0,child: _ShoeShadow()),
          Image(image: AssetImage('assets/img/blue.png')),
        ],
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: MediaQuery.of(context).size.width - 180,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Color(0xffEAA14E), blurRadius: 40),
          ],
        ),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ShoeSize(shoeSize: 7, isSelected: true),
          _ShoeSize(shoeSize: 7.5, isSelected: false),
          _ShoeSize(shoeSize: 8, isSelected: false),
          _ShoeSize(shoeSize: 8.5, isSelected: false),
          _ShoeSize(shoeSize: 9, isSelected: false),
          _ShoeSize(shoeSize: 9.5, isSelected: false),
        ],
      ),
    );
  }
}

class _ShoeSize extends StatelessWidget {
  final double shoeSize;
  final bool isSelected;

  const _ShoeSize({ Key key, @required this.shoeSize, @required this.isSelected }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: this.isSelected ? Color(0xffF1A23A) : Colors.white,
        boxShadow: this.isSelected ? [
          BoxShadow(
            color: Color(0xffF1A23A),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ] : [],
      ),
      alignment: Alignment.center,
      child: Text(
        '${ this.shoeSize.toString().replaceAll('.0', '') }',
        style: TextStyle(
          color: this.isSelected ? Colors.white : Color(0xffF1A23A),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}



