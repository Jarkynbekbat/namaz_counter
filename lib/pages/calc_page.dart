import 'package:flutter/material.dart';
import 'package:namaz_counter_provider/pages/components/namaz_item.dart';

class CalcPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NamazItem(name: 'Багымдат', count: 12),
            NamazItem(name: 'Бешим', count: 12),
            NamazItem(name: 'Аср', count: 12),
            NamazItem(name: 'Шам', count: 12),
            NamazItem(name: 'Куптан', count: 12),
          ],
        ),
      ),
    );
  }
}
