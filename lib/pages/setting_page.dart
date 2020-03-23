import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BasicDateField(title: 'от'),
          BasicDateField(title: 'до'),
        ],
      ),
    );
  }
}

class BasicDateField extends StatelessWidget {
  final String title;
  final format = DateFormat("yyyy-MM-dd");
  BasicDateField({this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('дата ${title}:'),
        DateTimeField(
          format: format,
          onShowPicker: (context, currentValue) {
            return showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
          },
        ),
      ],
    );
  }
}
