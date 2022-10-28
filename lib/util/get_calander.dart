import 'package:flutter_ethiopian_date_converter/mvc/model/ethiopian_date.dart';

import '../mvc/model/ethiopian_day.dart';

class GetCalender {
  List<EthiopianDay> generateCalender(EthiopianDate date) {
    int day = getDay(date.month, date.year);
    if (date.month == 13) {
      if (date.year + 1 % 4 == 0) {
        day = 5;
      } else {
        day = 6;
      }
    }

    var getTheFirstDayOftheMonth = GetTheFirstDayOftheMonth(1, month, year);
    if (date.month == 12) {
      getDay(13, date.year);
    }
    if (date.month == 1) {
      getDay(13, date.year);
    }
  }

  int getDay(month, year) {
    int day = 30;
    if (month == 13) {
      if (year + 1 % 4 == 0) {
        day = 5;
      } else {
        day = 6;
      }
    }
    return day;
  }
}
