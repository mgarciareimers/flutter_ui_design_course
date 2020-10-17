import 'package:flutter/material.dart';

// Theme.
import 'package:music_player/src/theme/theme.dart';

// Pages.
import 'package:music_player/src/pages/music_player_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: MusicPlayerPage(),
    );
  }
}