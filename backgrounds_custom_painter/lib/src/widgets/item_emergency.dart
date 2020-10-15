import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemEmergency extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color colorStart;
  final Color colorEnd;
  final Function onPress;

  const ItemEmergency({ @required this.icon, @required this.text, this.colorStart = Colors.grey, this.colorEnd = Colors.blueGrey, @required this.onPress });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: [
          _Background(icon: this.icon, colorStart: this.colorStart, colorEnd: this.colorEnd),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 140, width: 40),
              FaIcon(this.icon, size: 40, color: Colors.white),
              SizedBox(width: 20),
              Expanded(child: Text(this.text, style: TextStyle(color: Colors.white, fontSize: 18))),
              FaIcon(FontAwesomeIcons.chevronRight, size: 20, color: Colors.white),
              SizedBox(width: 40),
            ],
          ),
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  final IconData icon;
  final Color colorStart;
  final Color colorEnd;

  const _Background({ @required this.icon, @required this.colorStart, @required this.colorEnd });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow> [
          BoxShadow(color: Colors.black.withOpacity(0.2), offset: Offset(4, 6), blurRadius: 10),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: <Color> [
            this.colorStart,
            this.colorEnd,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              child: FaIcon(this.icon, size: 150, color: Colors.white.withOpacity(0.2)),
              top: -20,
              right: -20,
            )
          ],
        ),
      ),
    );
  }
}
