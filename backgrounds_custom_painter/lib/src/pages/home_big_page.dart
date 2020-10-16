import 'package:backgrounds_design/src/models/layout_model.dart';
import 'package:backgrounds_design/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// Theme.
import 'package:backgrounds_design/src/theme/theme_changer.dart';

// Routes.
import 'package:backgrounds_design/src/routes/routes.dart';

class HomeBigPage extends StatelessWidget {
  static const double MENU_SIZE_BIG_SCREEN = 280;

  @override
  Widget build(BuildContext context) {
    final ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    final LayoutModel layoutModel = Provider.of<LayoutModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Designs in Flutter - Big'),
        backgroundColor: themeChanger.currentTheme.accentColor,
      ),
      body: Row(
        children: [
          Container(
            width: MENU_SIZE_BIG_SCREEN,
            height: double.infinity,
            child: _OptionsList(),
          ),
          Container(
            width: 2,
            height: double.infinity,
            color: themeChanger.darkTheme ? Colors.grey : themeChanger.currentTheme.accentColor,
          ),
          Expanded(
            child: layoutModel.currentPage,
          ),
        ],
      ),
      drawer: _Menu(),
    );
  }
}

class _OptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(color: theme.primaryColorLight),
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(pageRoutes[index].icon, color: theme.accentColor),
        title: Text(pageRoutes[index].title),
        trailing: Icon(Icons.chevron_right, color: theme.accentColor),
        onTap: () {
          final LayoutModel layoutModel = Provider.of<LayoutModel>(context, listen: false);
          layoutModel.currentPage = pageRoutes[index].page;
        },
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 180,
              child: CircleAvatar(
                backgroundColor: themeChanger.currentTheme.accentColor,
                child: Text('MG', style: TextStyle(fontSize: 50)),
              ),
            ),
            Expanded(
              child: _OptionsList(),
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: themeChanger.currentTheme.accentColor),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: themeChanger.darkTheme,
                activeColor: themeChanger.currentTheme.accentColor,
                onChanged: (value) => themeChanger.darkTheme = value
              ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              right: false,
              left: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: themeChanger.currentTheme.accentColor),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  value: themeChanger.customTheme,
                  activeColor: themeChanger.currentTheme.accentColor,
                  onChanged: (value) => themeChanger.customTheme = value
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

