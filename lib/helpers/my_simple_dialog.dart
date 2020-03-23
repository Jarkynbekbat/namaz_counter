import 'package:flutter/material.dart';

showMyDialog(context, title, descreption, ok, cancel) async {
  bool _result = false;
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(descreption),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              _result = true;
              Navigator.of(context).pop();
            },
            child: Text(ok),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(cancel),
          ),
        ],
      );
    },
  );
  return _result;
}
