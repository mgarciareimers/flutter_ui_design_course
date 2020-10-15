import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => new _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Notifications Page'),
        ),
        floatingActionButton: _FloatingButton(),
        bottomNavigationBar: _BottomNavigationBar(),
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int number = Provider.of<_NotificationModel>(context).number;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bone),
          title: Text('Bones')
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                child: BounceInDown(
                  animate: number > 0,
                  from: 6,
                  child: Bounce(
                    child: _NotificationCircle(number: number),
                    from: 8,
                    controller: (controller) => Provider.of<_NotificationModel>(context).bounceController = controller,
                  )
                ),
                top: 0,
                right: 0,
              ),
            ],
          ),
          title: Text('Notifications')
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.dog),
          title: Text('My Dog')
        ),
      ],
    );
  }
}

class _NotificationCircle extends StatelessWidget {
  const _NotificationCircle({ Key key, @required this.number }) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: Colors.pink,
        shape: BoxShape.circle,
      ),
      child: Text('$number', style: TextStyle(color: Colors.white, fontSize: 7)),
    );
  }
}

class _FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: FaIcon(FontAwesomeIcons.play),
      backgroundColor: Colors.pink,
      onPressed: () {
        int number = Provider.of<_NotificationModel>(context, listen: false).number;
        number++;

        Provider.of<_NotificationModel>(context, listen: false).number = number;

        if (number > 1) {
          Provider.of<_NotificationModel>(context, listen: false).bounceController.forward(from: 0);
        }
      },
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _number = 0;
  AnimationController _bounceController;

  int get number => this._number;

  set number(int value) {
    this._number = value;

    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;

  set bounceController(AnimationController controller) {
    this._bounceController = controller;
  }
}

