import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Designs in Flutter'),
      ),
      body: _OptionsList(),
      drawer: _Menu(),
    );
  }
}

class _OptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(color: Colors.blue),
      itemCount: 10,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(FontAwesomeIcons.slideshare, color: Colors.blue),
        title: Text('Hello World!'),
        trailing: Icon(Icons.chevron_right, color: Colors.blue),
        onTap: () {},
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                backgroundColor: Colors.blue,
                child: Text('MG', style: TextStyle(fontSize: 50, color: Colors.white)),
              ),
            ),
            Expanded(
              child: _OptionsList(),
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: Colors.blue),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(value: true, activeColor: Colors.blue, onChanged: (value) {}),
            ),
            ListTile(
              leading: Icon(Icons.add_to_home_screen, color: Colors.blue),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(value: true, activeColor: Colors.blue, onChanged: (value) {}),
            )
          ],
        ),
      ),
    );
  }
}

