import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models.
import 'package:backgrounds_design/src/models/pinterest_button_model.dart';

class PinterestMenu extends StatelessWidget {
  final bool show;

  PinterestMenu({ Key key, this.show = true }) : super(key: key);

  final List<PinterestButton> items = [
    PinterestButton(icon: Icons.pie_chart, onPressed: () => print('Icon pie chart!')),
    PinterestButton(icon: Icons.search, onPressed: () => print('Icon search!')),
    PinterestButton(icon: Icons.notifications, onPressed: () => print('Icon notifications!')),
    PinterestButton(icon: Icons.supervised_user_circle, onPressed: () => print('Icon supervised user circle!')),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        opacity: this.show ? 1 : 0,
        duration: Duration(milliseconds: 250),
        child: _PinteresMenuBackground(
          child: _MenuItems(menuItems: this.items)
        ),
      ),
    );
  }
}

class _PinteresMenuBackground extends StatelessWidget {
  final Widget child;
  const _PinteresMenuBackground({ Key key, this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            //offset: Offset(10, 10),
            blurRadius: 10,
            spreadRadius: -5
          ),
        ],
      ),
      child: this.child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems({Key key, this.menuItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(this.menuItems.length, (index) => _PinterestMenuButton(index: index, item: this.menuItems[index],)),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton({Key key, this.index, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedIndex = Provider.of<_MenuModel>(context).selectedIndex;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).selectedIndex = this.index;
        this.item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          this.item.icon,
          size: selectedIndex == index ? 35 : 25,
          color: selectedIndex == index ? Colors.black : Colors.grey
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => this._selectedIndex;

  set selectedIndex(int index){
    this._selectedIndex = index;

    notifyListeners();
  }
}


