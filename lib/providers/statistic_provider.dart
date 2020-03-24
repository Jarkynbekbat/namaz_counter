import 'package:flutter/cupertino.dart';
import 'package:namaz_counter_provider/providers/namaz_provider.dart';
import 'package:namaz_counter_provider/services/local/local_data_service.dart';
import 'package:provider/provider.dart';

class StatisticProvider extends ChangeNotifier {
  int firstSum;
  int currentSum;

  int averageCountPerDay;
  int daysBeforeGetGoal;

  initData(context) async {
    String tempStartDate = await LocalDataService.getData('startDate');
    //если есть данные настройки
    if (tempStartDate != null) {
      String tempSum = await LocalDataService.getData('firstSum');
      //если есть данные о количествах и суммах
      if (tempSum != null) {
        this.firstSum = int.parse(await LocalDataService.getData('firstSum'));
        this.currentSum =
            int.parse(await LocalDataService.getData('currentSum'));
        // найти среднее количество дополнительных намазов в день
        this.averageCountPerDay = this.getAverageCountPerDay(tempStartDate);
        // количество дней до завершения в таком темпе
        this.daysBeforeGetGoal = this.getDaysCountBeforeGoal(tempStartDate);
        notifyListeners();
      }
    }
    // если нет данных настроек
    else {}
  }

  int getAverageCountPerDay(String tempStartDate) {
    int madeNamazes = this.firstSum - this.currentSum;
    DateTime startDate = DateTime.parse(tempStartDate);
    DateTime now = DateTime.now();
    int daysSinceStart = now.difference(startDate).inDays;
    return daysSinceStart == 0
        ? madeNamazes
        : (madeNamazes / daysSinceStart).floor();
  }

  int getDaysCountBeforeGoal(String tempStartDate) {
    int averageSum = this.getAverageCountPerDay(tempStartDate);
    if (averageSum > 0) {
      int count = 0;
      int tempSum = 0;
      do {
        tempSum += averageSum;
        count++;
      } while (tempSum < this.currentSum);
      return count;
    } else
      return 0;
  }
}
