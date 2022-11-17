import 'package:flutter_ethiopian_date_converter/mvc/model/ethiopian_date.dart';

import '../ethiopian_to_gregorian.dart';
import '../mvc/model/ethiopian_day.dart';

class GetCalender {
  static EthiopianMonth generateCalender(EthiopianDate date) {
    List<EthiopianDay> Months = [];
    int day = getDay(date.month, date.year);

    var getTheFirstDayOftheMonth = getTheFirstDayOfTheMonth(
        date.month, date.year);

    if (date.month == 12) {
      getDay(13, date.year);
    }
    if (date.month == 1) {
      getDay(13, date.year);
    }
    int lastMonthDates = getPrevousMonthDay(date.month, date.year);

    for (int i = getTheFirstDayOftheMonth - 1; i > 0; i--) {
      String lstMonth = (date.month - 1).toString();
      String lstMonthDates = (lastMonthDates - (i - 1)).toString();
      if (date.month == 1) {
        lstMonth = 13.toString();
      }

      Months.add(EthiopianDay(
          false,
          false,
          false,
          lstMonthDates,
          lstMonth,
          "",
          ""));
    }

    for (int i = 1; i <= day; i++) {
      if (date.day == i) {
        Months.add(EthiopianDay(
            true,
            false,
            false,
            i.toString(),
            date.month.toString(),
            "",
            ""));
      }
      else {
        Months.add(EthiopianDay(
            false,
            false,
            false,
            i.toString(),
            date.month.toString(),
            "",
            ""));
      }
    }

    int nextMonth = 7 - (Months.length % 7);
    if (nextMonth > 0) {
      for (int i = 1; i <= nextMonth; i++) {
        Months.add(EthiopianDay(
            false,
            false,
            false,
            i.toString(),
            date.month.toString(),
            "",
            ""));
      }
    }

    EthiopianMonth ethiopianMonths = EthiopianMonth(Months);
    return ethiopianMonths;
  }

  static int getDay(month, year) {
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

  static int getPrevousMonthDay(month, year) {
    if (month == 1) {
      month = 13;
    }
    return getDay(month - 1, year);
  }

  static int getTheFirstDayOfTheMonth(int month, int year) {
    var ethiopianDate = EthiopianDate(1, month, year, '', 0);
    var gregorianDate = EthiopianToGregorian.calculateDate(ethiopianDate);
    return gregorianDate.weekday;
  }
}
