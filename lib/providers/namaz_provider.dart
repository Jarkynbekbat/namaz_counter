import 'package:flutter/widgets.dart';
import 'package:namaz_counter_provider/providers/setting_provider.dart';
import 'package:namaz_counter_provider/services/local/local_data_service.dart';

class NamazProvider extends ChangeNotifier {
  int bagymdatCount;
  int beshimCount;
  int asrCount;
  int shamCount;
  int kuptanCount;

  int firstSum;
  int currentSum;

  NamazProvider() {
    initData();
  }

  void initData() async {
    try {
      // получить данные из локального хранилища
      this.bagymdatCount =
          int.parse(await LocalDataService.getData('bagymdatCount'));
      this.beshimCount =
          int.parse(await LocalDataService.getData('beshimCount'));
      this.asrCount = int.parse(await LocalDataService.getData('asrCount'));
      this.shamCount = int.parse(await LocalDataService.getData('shamCount'));
      this.kuptanCount =
          int.parse(await LocalDataService.getData('kuptanCount'));
      await LocalDataService.setData('currentSum', getSum().toString());
      notifyListeners();
    } catch (ex) {
      //  если нет локальных данных , до делаю подсчет
      int diff = await SettingProvider.getDiffInDays();
      print(diff);
      this.bagymdatCount = diff;
      this.beshimCount = diff;
      this.asrCount = diff;
      this.shamCount = diff;
      this.kuptanCount = diff;
      await LocalDataService.setData('bagymdatCount', diff.toString());
      await LocalDataService.setData('beshimCount', diff.toString());
      await LocalDataService.setData('asrCount', diff.toString());
      await LocalDataService.setData('shamCount', diff.toString());
      await LocalDataService.setData('kuptanCount', diff.toString());

      await LocalDataService.setData('firstSum', getSum().toString());
      await LocalDataService.setData('currentSum', getSum().toString());
      notifyListeners();
    }
  }

  int getSum() {
    int sum = 0;
    try {
      sum += this.bagymdatCount;
      sum += this.beshimCount;
      sum += this.asrCount;
      sum += this.shamCount;
      sum += this.kuptanCount;
      return sum;
    } catch (ex) {
      return 0;
    }
  }

  void plusNamaz(name) async {
    name == 'Багымдат'
        ? await LocalDataService.setData(
            'bagymdatCount', (++this.bagymdatCount).toString())
        : name == 'Бешим'
            ? await LocalDataService.setData(
                'beshimCount', (++this.beshimCount).toString())
            : name == 'Аср'
                ? await LocalDataService.setData(
                    'asrCount', (++this.asrCount).toString())
                : name == 'Шам'
                    ? await LocalDataService.setData(
                        'shamCount', (++this.shamCount).toString())
                    : await LocalDataService.setData(
                        'kuptanCount', (++this.kuptanCount).toString());
    initData();
  }

  void minusNamaz(name) async {
    name == 'Багымдат'
        ? await LocalDataService.setData(
            'bagymdatCount', (--this.bagymdatCount).toString())
        : name == 'Бешим'
            ? await LocalDataService.setData(
                'beshimCount', (--this.beshimCount).toString())
            : name == 'Аср'
                ? await LocalDataService.setData(
                    'asrCount', (--this.asrCount).toString())
                : name == 'Шам'
                    ? await LocalDataService.setData(
                        'shamCount', (--this.shamCount).toString())
                    : await LocalDataService.setData(
                        'kuptanCount', (--this.kuptanCount).toString());

    if (this.bagymdatCount < 0) {
      await LocalDataService.setData(
          'bagymdatCount', (++this.bagymdatCount).toString());
    } else if (this.beshimCount < 0) {
      await LocalDataService.setData(
          'beshimCount', (++this.beshimCount).toString());
    } else if (this.beshimCount < 0) {
      await LocalDataService.setData('asrCount', (++this.asrCount).toString());
    } else if (this.beshimCount < 0) {
      await LocalDataService.setData(
          'shamCount', (++this.shamCount).toString());
    } else if (this.beshimCount < 0) {
      await LocalDataService.setData(
          'kuptanCount', (++this.kuptanCount).toString());
    }

    initData();
  }
}
