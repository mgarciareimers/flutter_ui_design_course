import 'package:animate_do_app/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate_do'),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.twitter),
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => TwitterPage()));
            },
          ),
          SlideInLeft(
            from: 100,
            child: IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => HomePage()));
              },
            ),
          )
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.play),
          onPressed: () {},
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(child: Icon(Icons.new_releases, color: Colors.blue, size: 40), delay: Duration(milliseconds: 1100)),
            FadeInDown(child: Text('Title', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200)), delay: Duration(milliseconds: 200)),
            FadeInDown(child: Text('I am a small text', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)), delay: Duration(milliseconds: 800)),
            SizedBox(height: 8),
            FadeInLeft(child: Container(width: 200, height: 2, color: Colors.blue), delay: Duration(milliseconds: 1100)),
          ],
        ),
      ),
    );
  }
}
