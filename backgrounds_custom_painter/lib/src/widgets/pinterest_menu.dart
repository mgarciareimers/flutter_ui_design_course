import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({ @required this.onPressed, @required this.icon });
}

class PinterestMenu extends StatelessWidget {
  final bool show;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  PinterestMenu({ Key key, this.show = true, this.backgroundColor = Colors.white, this.activeColor = Colors.black, this.inactiveColor = Colors.grey, @required this.items }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Builder(
        builder: (context) {
          Provider.of<_MenuModel>(context).backgroundColor = this.backgroundColor;
          Provider.of<_MenuModel>(context).activeColor= this.activeColor;
          Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;

          return this._createContent();
        },
      ),
    );
  }

  // Method that creates the content.
  Widget _createContent() {
    return AnimatedOpacity(
      opacity: this.show ? 1 : 0,
      duration: Duration(milliseconds: 250),
      child: _PinteresMenuBackground(
          child: _MenuItems(menuItems: this.items)
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
        color: Provider.of<_MenuModel>(context).backgroundColor,
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
          color: selectedIndex == index ? Provider.of<_MenuModel>(context).activeColor : Provider.of<_MenuModel>(context).inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _selectedIndex = 0;
  Color _backgroundColor;
  Color _activeColor;
  Color _inactiveColor;

  int get selectedIndex => this._selectedIndex;

  set selectedIndex(int index){
    this._selectedIndex = index;

    notifyListeners();
  }

  Color get backgroundColor => this._backgroundColor;

  set backgroundColor(Color color){
    this._backgroundColor = color;
  }

  Color get activeColor => this._activeColor;

  set activeColor(Color color){
    this._activeColor = color;
  }

  Color get inactiveColor => this._inactiveColor;

  set inactiveColor(Color color){
    this._inactiveColor = color;
  }
}


