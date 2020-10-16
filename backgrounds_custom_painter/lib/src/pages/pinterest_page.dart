import 'package:backgrounds_design/main.dart';
import 'package:backgrounds_design/src/pages/home_big_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Theme.
import 'package:backgrounds_design/src/theme/theme_changer.dart';

// Widgets.
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:backgrounds_design/src/widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => new _MenuModel(),
        child: Stack(
          children: [
            PinterestGrid(),
            _PositionedPinterestMenu(),
          ],
        ),
      ),
    );
  }
}

class _PositionedPinterestMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final ThemeData theme = Provider.of<ThemeChanger>(context).currentTheme;
  final Size screenSize = MediaQuery.of(context).size;

    return Positioned(
      bottom: 16,
      child: Container(
        width: screenSize.width >= MyApp.BIG_SCREEN_SIZE ? screenSize.width - HomeBigPage.MENU_SIZE_BIG_SCREEN : screenSize.width,
        alignment: Alignment.center,
          child: PinterestMenu(
            show: Provider.of<_MenuModel>(context).show,
            backgroundColor: theme.scaffoldBackgroundColor,
            activeColor: theme.accentColor,
            inactiveColor: Colors.grey,
            items: [
              PinterestButton(icon: Icons.pie_chart, onPressed: () => print('Icon pie chart!')),
              PinterestButton(icon: Icons.search, onPressed: () => print('Icon search!')),
              PinterestButton(icon: Icons.notifications, onPressed: () => print('Icon notifications!')),
              PinterestButton(icon: Icons.supervised_user_circle, onPressed: () => print('Icon supervised user circle!')),
            ],
          ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);

  ScrollController controller = new ScrollController();
  double previousOffset = 0;

  @override
  void initState() {
    super.initState();

    this.controller.addListener(() {
      if (this.controller.offset < 0) {
        return;
      } else if (this.previousOffset < this.controller.offset) {
        Provider.of<_MenuModel>(context, listen: false).show = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).show = true;
      }

      this.previousOffset = this.controller.offset;
    });
  }

  @override
  void dispose() {
    super.dispose();
    this.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count = MediaQuery.of(context).size.width >= MyApp.BIG_SCREEN_SIZE ? 3 : 2;

    return StaggeredGridView.countBuilder(
      physics: BouncingScrollPhysics(),
      controller: this.controller,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index: index),
      staggeredTileBuilder: (int index) =>
      new StaggeredTile.count(1, index.isEven ? 1 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem({ Key key, this.index }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;

  bool get show => this._show;

  set show(bool value) {
    this._show = value;
    notifyListeners();
  }
}
