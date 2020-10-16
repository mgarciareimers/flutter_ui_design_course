import 'package:backgrounds_design/src/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Theme.
import 'package:backgrounds_design/src/theme/theme_changer.dart';

// Pages.
import 'package:backgrounds_design/src/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // TODO - Delete in case preferences alone works fine.
  await Preferences().initPreferences();

  runApp(ChangeNotifierProvider(
      create: (context) => new ThemeChanger(Preferences().theme),
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      title: 'Designs',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: theme,
    );
  }
}
