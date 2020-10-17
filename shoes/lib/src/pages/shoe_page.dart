import 'package:flutter/material.dart';
import 'package:shoes/src/widgets/custom_widgets.dart';

class ShoePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: CustomAppBar(text: 'For you'),
      body: Column(
        children: [
          CustomAppBar(text: 'For you'),
          SizedBox(height: 20),
          Expanded(child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ShoeSizePreview(),
                SizedBox(height: 20),
                ShoeDescription(
                  title: 'Nike Air Max 720',
                  description: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
              ],
            ),
          )),
          AddCartButton(price: 180),
        ],
      ),
    );
  }
}
