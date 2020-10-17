import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/src/helpers/helpers.dart';
import 'package:shoes/src/models/shoe_model.dart';

// Widgets.
import 'package:shoes/src/widgets/custom_widgets.dart';

class ShoeDescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    changeStatusLight();

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
            Hero(tag: 'shoe', child: ShoeSizePreview(fullScreen: true)),
              Positioned(
                top: 60,
                child: FloatingActionButton(
                  child: Icon(Icons.chevron_left, color: Colors.white, size: 60),
                  onPressed: () {
                    Navigator.pop(context);
                    changeStatusDark();
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                ),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  SizedBox(height: 20),
                  _PriceBuyNow(price: 180),
                  SizedBox(height: 20),
                  _ColorsAndMore(),
                  SizedBox(height: 20),
                  _BottomButtons(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceBuyNow extends StatelessWidget {
  final double price;

  const _PriceBuyNow({Key key, @required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(width: 30),
          Text('\$$price', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          Spacer(),
          Bounce(delay: Duration(milliseconds: 500), from: 10, child: OrangeButton(text: 'Buy now', horizontalPadding: 25, verticalPadding: 12)),
          SizedBox(width: 30),
        ],
      ),
    );
  }
}

class _ColorsAndMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(child: _ColorButton(color: Color(0xffC6D642), index: 4, assetImage: 'assets/img/green.png',), left: 90),
                Positioned(child: _ColorButton(color: Color(0xffFFAD29), index: 3, assetImage: 'assets/img/yellow.png',), left: 60),
                Positioned(child: _ColorButton(color: Color(0xff2099F1), index: 2, assetImage: 'assets/img/blue.png',), left: 30),
                _ColorButton(color: Color(0xff364D56), index: 1, assetImage: 'assets/img/black.png',),
              ],
            ),
          ),
          OrangeButton(text: 'More related items', horizontalPadding: 20, verticalPadding: 10, color: Color(0xffFFC675),),
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color color;
  final int index;
  final String assetImage;

  const _ColorButton({ Key key, @required this.color, @required this.index, @required this.assetImage }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 100),
      duration: Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: () {
          final ShoeModel shoeModel = Provider.of<ShoeModel>(context, listen: false);
          shoeModel.assetImage = this.assetImage;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: this.color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _BottomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BottomButton(icon: Icon(Icons.favorite, color: Colors.red, size: 25)),
          _BottomButton(icon: Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4), size: 25)),
          _BottomButton(icon: Icon(Icons.settings, color: Colors.grey.withOpacity(0.4), size: 25)),
        ],
      ),
    );
  }
}

class _BottomButton extends StatelessWidget {
  final Icon icon;

  const _BottomButton({ Key key, @required this.icon }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: -5, blurRadius: 20, offset: Offset(0, 5)),
        ]
      ),
      child: this.icon,
    );
  }
}





