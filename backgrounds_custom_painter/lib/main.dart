import 'package:backgrounds_design/src/pages/home_big_page.dart';
import 'package:backgrounds_design/src/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Theme.
import 'package:backgrounds_design/src/theme/theme_changer.dart';

// Models.
import 'package:backgrounds_design/src/models/layout_model.dart';

// Pages.
import 'package:backgrounds_design/src/pages/home_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // TODO - Delete in case preferences alone works fine.
  await Preferences().initPreferences();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeChanger>(create: (context) => new ThemeChanger(Preferences().theme)),
      ChangeNotifierProvider<LayoutModel>(create: (context) => new LayoutModel()),
    ],
    child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  static const double BIG_SCREEN_SIZE = 500;


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      title: 'Designs',
      debugShowCheckedModeBanner: false,
      home: OrientationBuilder(
        builder: (context, orientation) {
          return MediaQuery.of(context).size.width >= BIG_SCREEN_SIZE ? HomeBigPage() : HomePage();
        },
      ),
      theme: theme,
    );
  }
}
