import 'package:flutter/material.dart';

// Models.
import 'package:backgrounds_design/src/models/pinterest_button_model.dart';

class PinterestMenu extends StatelessWidget {

  final List<PinterestButton> items = [
    PinterestButton(icon: Icons.pie_chart, onPressed: () => print('Icon pie chart!')),
    PinterestButton(icon: Icons.search, onPressed: () => print('Icon search!')),
    PinterestButton(icon: Icons.notifications, onPressed: () => print('Icon notifications!')),
    PinterestButton(icon: Icons.supervised_user_circle, onPressed: () => print('Icon supervised user circle!')),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
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
        child: _MenuItems(menuItems: this.items),
      ),
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
    return Container(
      child: Icon(item.icon),
    );
  }
}



