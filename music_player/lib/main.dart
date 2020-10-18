import 'package:flutter/material.dart';

// Models.
import 'package:music_player/src/models/audio_player_model.dart';

// Theme.
import 'package:music_player/src/theme/theme.dart';

// Pages.
import 'package:music_player/src/pages/music_player_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new AudioPlayerModel()),
      ],
      child: MaterialApp(
        title: 'Music Player',
        debugShowCheckedModeBanner: false,
        theme: myTheme,
        home: MusicPlayerPage(),
      ),
    );
  }
}