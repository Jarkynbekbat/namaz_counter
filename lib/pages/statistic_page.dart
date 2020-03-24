import 'package:flutter/material.dart';
import 'package:namaz_counter_provider/providers/statistic_provider.dart';
import 'package:provider/provider.dart';

class StatisticPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StatisticProvider>(
      builder: (context, model, _) {
        model.initData(context);
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                leading: Text(
                  model.firstSum.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                title: Text(
                    'Общее количество пропущенных намазов в момент начала учета'),
              ),
              ListTile(
                leading: Text(
                  model.currentSum.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                title: Text(
                    'Общее количество пропущенных намазов на текущий момент'),
              ),
              Divider(color: Colors.black45),
              ListTile(
                leading: Text(
                  model.averageCountPerDay.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                title: Text('Среднее количество дополнительних намазов в день'),
              ),
              ListTile(
                leading: model.daysBeforeGetGoal == 0
                    ? Icon(
                        Icons.all_inclusive,
                        color: Theme.of(context).textTheme.bodyText1.color,
                      )
                    : Text(
                        model.daysBeforeGetGoal.toString(),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                title: Text('Количество дней до завершения в таком темпе'),
              ),
            ],
          ),
        );
      },
    );
  }
}
