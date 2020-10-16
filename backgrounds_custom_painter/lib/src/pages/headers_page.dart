import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Theme.
import 'package:backgrounds_design/src/theme/theme_changer.dart';

// Widgets.
import 'package:backgrounds_design/src/widgets/headers.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      body: WaveHeader(color: theme.accentColor),
      //body: WaveGradientHeader(),
    );
  }
}


