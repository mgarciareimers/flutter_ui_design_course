import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _TasksList(),
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(left: 20 , right: 20, top: 20),
          child: Text('New', style: TextStyle(color: Color(0xff532128), fontSize: 50)),
        ),
        Stack(
          children: [
            SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: Color(0xffF7CDD5),
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
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(30),
      height: 130,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: this.backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(this.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
    );
  }
}
