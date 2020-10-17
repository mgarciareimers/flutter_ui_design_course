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
          ShoeSizePreview(),
        ],
      ),
    );
  }
}
