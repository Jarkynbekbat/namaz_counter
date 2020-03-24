import 'package:flutter/material.dart';
import 'package:namaz_counter_provider/providers/setting_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  DateTime tempDateFrom;
  DateTime tempDateTo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Consumer<SettingProvider>(
            builder: (context, settingModel, _) {
              settingModel.initData();

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('дата от', style: Theme.of(context).textTheme.bodyText1),
                  OutlineButton(
                      onPressed: () async {
                        tempDateFrom = await pickDate(context);
                        setState(() {});
                      },
                      child: Text(
                          '${tempDateFrom == null ? settingModel.dateFrom ?? 'выберите дату' : tempDateFrom}')),
                  Text('дата до', style: Theme.of(context).textTheme.bodyText1),
                  OutlineButton(
                    onPressed: () async {
                      tempDateTo = await pickDate(context);
                      setState(() {});
                    },
                    child: Text(
                        '${tempDateTo == null ? settingModel.dateTo ?? 'выберите дату' : tempDateTo}'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          Provider.of<SettingProvider>(context, listen: false)
              .setDates(tempDateFrom, tempDateTo, context);
        },
      ),
    );
  }
}

Future<DateTime> pickDate(context) async {
  return await showDatePicker(
    context: context,
    firstDate: DateTime(1900),
    initialDate: DateTime.now(),
    lastDate: DateTime.now(),
  );
}
