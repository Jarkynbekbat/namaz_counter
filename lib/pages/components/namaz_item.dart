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
        padding: EdgeInsets.symmetric(horizontal: 22),
        decoration: BoxDecoration(
          // color: Color(0xFFa6b1e1),
          color: Color(0xFFa6b1e1),
          border: Border(
            bottom: BorderSide(
              color: Color(0xfff4eeff),
            ),
          ),
        ),
        child: ListTile(
          leading: Text(
            name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          trailing: Container(
            height: 40.0,
            padding: EdgeInsets.only(left: 15.0),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Color(0xff424874),
                ),
              ),
            ),
            child: Text(
              count.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: 20, fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
      secondaryActions: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFa6b1e1),
            border: Border(
              bottom: BorderSide(
                color: Color(0xfff4eeff),
              ),
            ),
          ),
          child: IconSlideAction(
            // color: Colors.red,
            color: Color(0xff424874),
            iconWidget: Icon(Icons.add),
            onTap: () {
              Provider.of<NamazProvider>(context, listen: false)
                  .plusNamaz(name);
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFa6b1e1),
            border: Border(
              bottom: BorderSide(
                color: Color(0xfff4eeff),
              ),
            ),
          ),
          child: IconSlideAction(
            // color: Colors.green,
            color: Color(0xff424874),
            iconWidget: Icon(Icons.remove),
            onTap: () {
              Provider.of<NamazProvider>(context, listen: false)
                  .minusNamaz(name);
            },
          ),
        ),
      ],
    );
  }
}
