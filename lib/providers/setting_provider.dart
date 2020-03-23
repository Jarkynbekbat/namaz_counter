import 'package:flutter/widgets.dart';
import 'package:namaz_counter_provider/helpers/my_simple_dialog.dart';
import 'package:namaz_counter_provider/helpers/show_snackbar.dart';
import 'package:namaz_counter_provider/services/local/local_data_service.dart';

class SettingProvider extends ChangeNotifier {
  DateTime dateFrom;
  DateTime dateTo;

  SettingProvider() {
    initData();
  }

  void initData() async {
    this.dateFrom = DateTime.parse(await LocalDataService.getData('dateFrom'));
    this.dateTo = DateTime.parse(await LocalDataService.getData('dateTo'));
    notifyListeners();
  }

  void setDates(DateTime from, DateTime to, BuildContext context) async {
    if (from != null && to != null) {
      //если есть данные настройки , то спросить "Текущий прогресс будет потерян , вы точно хотите сохранить новые даты ?"
      if (this.dateFrom != null && this.dateTo != null) {
        bool result = await showMyDialog(
          context,
          'Текущий прогресс будет потерян',
          'вы точно хотите сохранить новые даты ?',
          'да',
          'нет',
        );
        if (result) {
          //если ответ да то сохранить локально
          await LocalDataService.setData('dateFrom', from.toString());
          await LocalDataService.setData('dateTo', to.toString());

          showSnackBar('Сохранено!', context);

          await LocalDataService.deleteData('bagymdatCount');
          await LocalDataService.deleteData('beshimCount');
          await LocalDataService.deleteData('asrCount');
          await LocalDataService.deleteData('shamCount');
          await LocalDataService.deleteData('kuptanCount');

          initData();
        }
      } else {
        // сохранить данные локально
        await LocalDataService.setData('dateFrom', from.toString());
        await LocalDataService.setData('dateTo', to.toString());

        showSnackBar('Сохранено!', context);
        initData();
      }
    } else if ((from != null && to == null) && this.dateTo != null) {
      bool result = await showMyDialog(
        context,
        'Текущий прогресс будет потерян',
        'вы точно хотите установить новые даты ?',
        'да',
        'нет',
      );
      if (result) {
        //если ответ да то сохранить локально
        await LocalDataService.setData('dateFrom', from.toString());
        await LocalDataService.setData('dateTo', this.dateTo.toString());

        showSnackBar('Сохранено!', context);

        await LocalDataService.deleteData('bagymdatCount');
        await LocalDataService.deleteData('beshimCount');
        await LocalDataService.deleteData('asrCount');
        await LocalDataService.deleteData('shamCount');
        await LocalDataService.deleteData('kuptanCount');
        initData();
      }
    } else if ((from == null && to != null) && this.dateFrom != null) {
      bool result = await showMyDialog(
        context,
        'Текущий прогресс будет потерян',
        'вы точно хотите установить новые даты ?',
        'да',
        'нет',
      );
      if (result) {
        //если ответ да то сохранить локально
        await LocalDataService.setData('dateFrom', this.dateFrom.toString());
        await LocalDataService.setData('dateTo', to.toString());

        showSnackBar('Сохранено!', context);

        await LocalDataService.deleteData('bagymdatCount');
        await LocalDataService.deleteData('beshimCount');
        await LocalDataService.deleteData('asrCount');
        await LocalDataService.deleteData('shamCount');
        await LocalDataService.deleteData('kuptanCount');

        initData();
      }
    } else {
      showSnackBar('Выберите даты!', context);
    }

    // TODO вывести сообщение
  }

  static Future<int> getDiffInDays() async {
    try {
      DateTime date1 =
          DateTime.parse(await LocalDataService.getData('dateFrom'));
      DateTime date2 = DateTime.parse(await LocalDataService.getData('dateTo'));
      return date2.difference(date1).inDays;
    } catch (ex) {
      return 0;
    }
  }
}
