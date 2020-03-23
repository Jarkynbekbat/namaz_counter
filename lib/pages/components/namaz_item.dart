import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:namaz_counter_provider/providers/namaz_provider.dart';
import 'package:provider/provider.dart';

class NamazItem extends StatelessWidget {
  final String name;
  final int count;

  NamazItem({this.name, this.count});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        // margin: EdgeInsets.only(top: 12.0, left: 15.0, right: 15.0),
        color: Colors.green,
        child: ListTile(
          leading: Text(name),
          trailing: Text(count.toString()),
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          color: Colors.red,
          iconWidget: Icon(Icons.add, size: 35.0),
          onTap: () {
            Provider.of<NamazProvider>(context, listen: false).plusNamaz(name);
          },
        ),
        IconSlideAction(
          color: Colors.green,
          iconWidget: Icon(Icons.remove, size: 35.0),
          onTap: () {
            Provider.of<NamazProvider>(context, listen: false).minusNamaz(name);
          },
        ),
      ],
    );
  }
}
