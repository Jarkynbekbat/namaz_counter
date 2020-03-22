import 'package:flutter/material.dart';

class NamazItem extends StatelessWidget {
  final String name;
  final int count;

  NamazItem({this.name, this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.0, left: 15.0, right: 15.0),
      color: Colors.green,
      child: ListTile(
        leading: Text(name),
        trailing: Text(count.toString()),
      ),
    );
  }
}
