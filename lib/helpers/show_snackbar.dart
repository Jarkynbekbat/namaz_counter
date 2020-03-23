import 'package:flutter/material.dart';

void showSnackBar(message, context) {
  final snackBar = SnackBar(content: Text(message));
  Scaffold.of(context).showSnackBar(snackBar);
}
