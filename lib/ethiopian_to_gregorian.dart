import 'dart:core';

import 'mvc/model/ethiopian_date.dart';

class EthiopianToGregorian {
  static int year = 2000;
  static int month = 1;
  static int date = 1;
  static int weekDays = 1;

  static int gregorianMonth(int month,bool isLeap) {
    switch(month) {
      case 2:
        if (isLeap) {
          return 29;
        } else {
          return 28;
        }
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        return 31;
      default:
        return 30;
    }
  }
  static calculateDayAndMonth(int currentMonth,int currentDate,int addedDate,bool isLeap) {
    int day = currentDate + addedDate;
    int gregorianMonthDates = gregorianMonth(currentMonth, isLeap);
    if (day <= gregorianMonthDates) {
      month = currentMonth;
      date = day;
    }
    else {
      month = currentMonth + 1;
      date = day - gregorianMonthDates;
    }
  }



  static DateTime calculateDate(EthiopianDate datetime) {
     int addDays = 1;
     int tempMonth = 1;

     bool isLeapYear = (datetime.year) % 4 == 0;

     if (EthiopianDate.meskerem >= datetime.month &&
         datetime.month <= EthiopianDate.hidar) {
       year = datetime.year + 7;
     }
     else {
       if (EthiopianDate.tahsas >= datetime.month) {
         if (datetime.day <= 20) {
           year = datetime.year + 7;
         }
         else if (datetime.day <= 21 && isLeapYear) {
           year = datetime.year + 7;
         }
         else {
           year = datetime.year + 8;
         }
       }
       else {
         year = datetime.year + 8;
       }
     }

     //isLeapYear = (year +1) % 4 == 0;
     if (EthiopianDate.meskerem == datetime.month) {
       tempMonth = 9;
       if (isLeapYear) {
         addDays = 11;
       } else {
         addDays = 10;
       }
     } else if (EthiopianDate.tikimt == datetime.month) {
       tempMonth = 10;
       if (isLeapYear) {
         addDays = 11;
       } else {
         addDays = 10;
       }
     } else if (EthiopianDate.hidar == datetime.month) {
       tempMonth = 11;
       if (isLeapYear) {
         addDays = 10;
       } else {
         addDays = 9;
       }
     }
     else if (EthiopianDate.tahsas == datetime.month) {
       tempMonth = 12;
       if (isLeapYear) {
         addDays = 10;
       } else {
         addDays = 9;
       }
     }
     else if (EthiopianDate.tir == datetime.month) {
       tempMonth = 1;
       if (isLeapYear) {
         addDays = 9;
       } else {
         addDays = 8;
       }
     }
     else if (EthiopianDate.yakatit == datetime.month) {
       tempMonth = 2;
       if (isLeapYear) {
         addDays = 8;
       } else {
         addDays = 7;
       }
     }
     else if (EthiopianDate.maggabit == datetime.month) {
       tempMonth = 3;
       addDays = 9;
     }
     else if (EthiopianDate.miyazya == datetime.month) {
       tempMonth = 4;
       addDays = 8;
     }
     else if (EthiopianDate.ginbot == datetime.month) {
       tempMonth = 5;
       addDays = 8;
     }
     else if (EthiopianDate.sene == datetime.month) {
       tempMonth = 6;
       addDays = 7;
     }
     else if (EthiopianDate.hamle == datetime.month) {
       tempMonth = 7;
       addDays = 7;
     }
     else if (EthiopianDate.nehasa == datetime.month) {
       tempMonth = 8;
       addDays = 6;
     }
     else if (EthiopianDate.pagume == datetime.month) {
       tempMonth = 9;
       addDays = 5;
     }
     calculateDayAndMonth(tempMonth,datetime.day,addDays,isLeapYear);
     DateTime gregorianDateTime =DateTime(year, month,date);
     return gregorianDateTime;
   }
}
