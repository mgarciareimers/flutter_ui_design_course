import 'package:flutter/material.dart';
import 'package:music_player/src/widgets/custom_app_bar.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
        ],
      )
    );
  }
}
