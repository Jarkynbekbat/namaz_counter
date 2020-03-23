import 'package:flutter/material.dart';
import 'package:namaz_counter_provider/pages/components/namaz_item.dart';
import 'package:namaz_counter_provider/providers/namaz_provider.dart';
import 'package:provider/provider.dart';

class CalcPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<NamazProvider>(
        builder: (context, namazModel, _) {
          namazModel.initData();
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                NamazItem(name: 'Багымдат', count: namazModel.bagymdatCount),
                NamazItem(name: 'Бешим', count: namazModel.beshimCount),
                NamazItem(name: 'Аср', count: namazModel.asrCount),
                NamazItem(name: 'Шам', count: namazModel.shamCount),
                NamazItem(name: 'Куптан', count: namazModel.kuptanCount),
              ],
            ),
          );
        },
      ),
    );
  }
}
