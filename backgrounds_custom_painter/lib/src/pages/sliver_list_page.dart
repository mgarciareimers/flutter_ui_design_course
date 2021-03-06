import 'package:backgrounds_design/main.dart';
import 'package:backgrounds_design/src/pages/home_big_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Theme.
import 'package:backgrounds_design/src/theme/theme_changer.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            child: _ButtonCreateNewList(),
            bottom: -10,
            right: -10,
          ),
        ],
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _TasksListItem(title: 'Orange', backgroundColor: Color(0xffF08F66) ),
    _TasksListItem(title: 'Family', backgroundColor: Color(0xffF2A38A) ),
    _TasksListItem(title: 'Subscriptions', backgroundColor: Color(0xffF7CDD5) ),
    _TasksListItem(title: 'Books', backgroundColor: Color(0xffFCEBAF) ),
    _TasksListItem(title: 'Orange', backgroundColor: Color(0xffF08F66) ),
    _TasksListItem(title: 'Family', backgroundColor: Color(0xffF2A38A) ),
    _TasksListItem(title: 'Subscriptions', backgroundColor: Color(0xffF7CDD5) ),
    _TasksListItem(title: 'Books', backgroundColor: Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Provider.of<ThemeChanger>(context).currentTheme;

    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            maxHeight: 200,
            minHeight: 170,
            child: Container(
              alignment: Alignment.centerLeft,
              color: theme.scaffoldBackgroundColor,
              child: _Title()
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...this.items,
            SizedBox(height: 100),
          ]),
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {

  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({ @required this.minHeight, @required this.maxHeight, @required this.child });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: this.child);
  }

  @override
  double get maxExtent => this.maxHeight > this.minHeight ? this.maxHeight : this.minHeight;

  @override
  double get minExtent => this.minHeight < this.maxHeight ? this.minHeight : this.maxHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return this.maxHeight != oldDelegate.maxHeight || this.minHeight != oldDelegate.minHeight || this.child != oldDelegate.child;
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);

    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(left: 20 , right: 20, top: 20),
          child: Text('New', style: TextStyle(color: themeChanger.darkTheme ? Colors.grey : Color(0xff532128), fontSize: 50)),
        ),
        Stack(
          children: [
            SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: themeChanger.darkTheme ? Colors.grey : Color(0xffF7CDD5),
              ),
            ),
            Container(
              child: Text('List', style: TextStyle(color: Color(0xffD93A30), fontSize: 50)),
            ),
          ],
        )
      ],
    );
  }
}

class _TasksList extends StatelessWidget {
  final items = [
    _TasksListItem(title: 'Orange', backgroundColor: Color(0xffF08F66) ),
    _TasksListItem(title: 'Family', backgroundColor: Color(0xffF2A38A) ),
    _TasksListItem(title: 'Subscriptions', backgroundColor: Color(0xffF7CDD5) ),
    _TasksListItem(title: 'Books', backgroundColor: Color(0xffFCEBAF) ),
    _TasksListItem(title: 'Orange', backgroundColor: Color(0xffF08F66) ),
    _TasksListItem(title: 'Family', backgroundColor: Color(0xffF2A38A) ),
    _TasksListItem(title: 'Subscriptions', backgroundColor: Color(0xffF7CDD5) ),
    _TasksListItem(title: 'Books', backgroundColor: Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: this.items.length,
      itemBuilder: (context, index) => this.items[index],
    );
  }
}

class _TasksListItem extends StatelessWidget {
  final String title;
  final Color backgroundColor;

  const _TasksListItem({ @required this.title, @required this.backgroundColor });

  @override
  Widget build(BuildContext context) {
    final ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);

    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(30),
      height: 130,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: themeChanger.darkTheme ? Colors.grey : this.backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(this.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
    );
  }
}

class _ButtonCreateNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    final Size screenSize = MediaQuery.of(context).size;

    return ButtonTheme(
      minWidth: (screenSize.width >= MyApp.BIG_SCREEN_SIZE ? screenSize.width - HomeBigPage.MENU_SIZE_BIG_SCREEN : screenSize.width) * 0.9,
      height: 100,
      child: RaisedButton(
        onPressed: () {},
        color: themeChanger.darkTheme ? themeChanger.currentTheme.accentColor : Color(0xffED6762),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
        ),
        child: Text('CREATE NEW LIST', style: TextStyle(fontSize: 16, color: themeChanger.currentTheme.scaffoldBackgroundColor, fontWeight: FontWeight.bold, letterSpacing: 2)),
      ),

    );
  }
}
