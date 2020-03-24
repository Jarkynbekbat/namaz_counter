import 'package:flutter/widgets.dart';
import 'package:namaz_counter_provider/providers/setting_provider.dart';
import 'package:namaz_counter_provider/services/local/local_data_service.dart';

class NamazProvider extends ChangeNotifier {
  int bagymdatCount;
  int beshimCount;
  int asrCount;
  int shamCount;
  int kuptanCount;

  NamazProvider() {
    initData();
  }

  void initData() async {
    String testDateFrom = await LocalDataService.getData('dateFrom');
    // если есть данные настроек
    if (testDateFrom != null) {
      String testCount = await LocalDataService.getData('bagymdatCount');
      // если есть данные количествах
      if (testCount != null) {
        // получить данные и показать
        this.bagymdatCount = int.parse(testCount);
        this.beshimCount =
            int.parse(await LocalDataService.getData('beshimCount'));
        this.asrCount = int.parse(await LocalDataService.getData('asrCount'));
        this.shamCount = int.parse(await LocalDataService.getData('shamCount'));
        this.kuptanCount =
            int.parse(await LocalDataService.getData('kuptanCount'));
        await LocalDataService.setData('currentSum', getSum().toString());
        notifyListeners();
      }
      // если нет данных о количествах , но есть данные о настроек , первый раз
      else {
        // делаю подсчет
        int diff = await SettingProvider.getDiffInDays();
        this.bagymdatCount = diff;
        this.beshimCount = diff;
        this.asrCount = diff;
        this.shamCount = diff;
        this.kuptanCount = diff;
        // сохраняю локально
        List<Future> futures = [];
        futures.add(LocalDataService.setData('bagymdatCount', diff.toString()));
        futures.add(LocalDataService.setData('beshimCount', diff.toString()));
        futures.add(LocalDataService.setData('asrCount', diff.toString()));
        futures.add(LocalDataService.setData('shamCount', diff.toString()));
        futures.add(LocalDataService.setData('kuptanCount', diff.toString()));
        await Future.wait(futures);
        //  делаю подсчет сумм и сохраняю локально
        futures = [];
        futures.add(LocalDataService.setData('firstSum', getSum().toString()));
        futures
            .add(LocalDataService.setData('currentSum', getSum().toString()));
        await Future.wait(futures);
        notifyListeners();
      }
    }
    // если нет данных настроек
    else {}
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
    switch (name) {
      case 'Багымдат':
        await LocalDataService.setData(
            'bagymdatCount', (--this.bagymdatCount).toString());
        break;
      case 'Бешим':
        await LocalDataService.setData(
            'beshimCount', (--this.beshimCount).toString());
        break;
      case 'Аср':
        await LocalDataService.setData(
            'asrCount', (--this.asrCount).toString());
        break;
      case 'Шам':
        await LocalDataService.setData(
            'shamCount', (--this.shamCount).toString());
        break;
      case 'Куптан':
        await LocalDataService.setData(
            'kuptanCount', (--this.kuptanCount).toString());
        break;
    }

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
