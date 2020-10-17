import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/src/models/shoe_model.dart';

// Pages.
import 'package:shoes/src/pages/shoe_description_page.dart';

class ShoeSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ShoeSizePreview({ Key key, this.fullScreen = false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (this.fullScreen) {
          return;
        }

        Navigator.push(context, MaterialPageRoute(builder: (context) => ShoeDescriptionPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: this.fullScreen ? 0 : 30),
        padding: EdgeInsets.only(bottom: 30, left: this.fullScreen ? 15 : 0, right: this.fullScreen ? 15 : 0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffFFCF53),
          borderRadius: this.fullScreen ? BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ) : BorderRadius.circular(40),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _Shoe(),
              this.fullScreen ? Container() : _ShoeSizes(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Shoe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ShoeModel shoeModel = Provider.of<ShoeModel>(context);

    return Padding(
      padding: EdgeInsets.all(60),
      child: Stack(
        children: [
          Positioned(bottom: 20, right: 0,child: _ShoeShadow()),
          Image(image: AssetImage(shoeModel.assetImage)),
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
          _ShoeSize(shoeSize: 7),
          _ShoeSize(shoeSize: 7.5),
          _ShoeSize(shoeSize: 8),
          _ShoeSize(shoeSize: 8.5),
          _ShoeSize(shoeSize: 9),
          _ShoeSize(shoeSize: 9.5),
        ],
      ),
    );
  }
}

class _ShoeSize extends StatelessWidget {
  final double shoeSize;

  const _ShoeSize({ Key key, @required this.shoeSize }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ShoeModel shoeModel = Provider.of<ShoeModel>(context);
    final bool isSelected = shoeModel.size == this.shoeSize;

    return GestureDetector(
      onTap: () {
        final ShoeModel shoeModel = Provider.of<ShoeModel>(context, listen: false);
        shoeModel.size = this.shoeSize;
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Color(0xffF1A23A) : Colors.white,
          boxShadow: isSelected ? [
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
            color: isSelected ? Colors.white : Color(0xffF1A23A),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}



