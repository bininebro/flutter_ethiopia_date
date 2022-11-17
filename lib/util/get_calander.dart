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


    for (int i = getTheFirstDayOftheMonth - 1; i > 0; i--) {
      int lastMonthDates = getPrevousMonthDay(date.month, date.year);
      String lstMonth = (date.month - 1).toString();
      String lstMonthDates = (lastMonthDates - (i - 1)).toString();
      if (date.month == 1) {
        lstMonth = 13.toString();
        if(getTheFirstDayOftheMonth==7 && lastMonthDates==5){
           lstMonth = 12.toString();
           lstMonthDates = 1.toString();
        }
      }

      Months.add(EthiopianDay(
          false,
          false,
          false,
          lstMonthDates,
          lstMonth,
          "",
          "",true));
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
            "",false));
      }
      else {
        Months.add(EthiopianDay(
            false,
            false,
            false,
            i.toString(),
            date.month.toString(),
            "",
            "",false));
      }
    }

    int nextMonth = 7 - (Months.length % 7);
    if (nextMonth > 0) {
      for (int i = 1; i <= nextMonth; i++) {
       String dates= i.toString();
       int nextMonthDates = getNextMonthDay(date.month, date.year);
       String monthDates = date.month.toString();
        if( nextMonthDates==5 && i==6){
          dates = 1.toString();
          monthDates = 1.toString();
        }
        Months.add(EthiopianDay(
            false,
            false,
            false,
            dates,
            monthDates,
            "",
            "",true));
      }
    }

    EthiopianMonth ethiopianMonths = EthiopianMonth(Months);
    return ethiopianMonths;
  }

  static int getDay(month, year) {
    int day = 30;
    if (month == 13) {
      if (year + 1 % 4 == 0) {
        day = 6;
      } else {
        day = 5;
      }
    }
    return day;
  }

  static int getPrevousMonthDay(month, year) {
    if (month == 1) {
      month = 13;
    }else{
      month -= 1;
    }
    return getDay(month, year);
  }

  static int getNextMonthDay(month, year) {
    if (month == 13) {
      month = 1;
    }else{
      month += 1;
    }
    return getDay(month, year);
  }

  static int getTheFirstDayOfTheMonth(int month, int year) {
    var ethiopianDate = EthiopianDate(1, month, year, '', 0);
    var gregorianDate = EthiopianToGregorian.calculateDate(ethiopianDate);
    return gregorianDate.weekday;
  }
}
