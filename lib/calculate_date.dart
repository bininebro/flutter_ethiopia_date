import 'dart:core';
import 'dart:html';

import 'package:get/get.dart';

import 'mvc/model/ethiopian_date.dart';
import 'mvc/model/split_characters.dart';

class EthiopianDateConverter {
  static int year = 2000;
  static int month = 1;
  static int date = 0;
  static int weekDays = 1;

  static EthiopianDate calculateDate(DateTime datetime) {
    weekDays = datetime.weekday;
    if (DateTime.january >= datetime.month ||
        datetime.month <= DateTime.september) {
      if (datetime.month != DateTime.september) {
        year = datetime.year - 8;
      } else if (datetime.month == DateTime.september &&
          (datetime.year % 4 + 1) != 0 &&
          datetime.day < 11) {
        year = datetime.year - 8;
      } else if (datetime.month == DateTime.september &&
          (datetime.year + 1) % 4 == 0 &&
          datetime.day < 12) {
        year = datetime.year - 8;
      } else {
        year = datetime.year - 7;
      }
    } else {
      year = datetime.year - 7;
    }
    var tempyear = year - 1;

    if (DateTime.january == datetime.month) {
      if (tempyear % 4 == 0) {
        if (datetime.day < 10) {
          month = 4;
          date = datetime.day + 31 - 10;
        } else {
          month = 5;
          date = datetime.day - 9;
        }
      } else {
        if (datetime.day < 9) {
          month = 4;
          date = datetime.day + 31 - 9;
        } else {
          month = 5;
          date = datetime.day - 8;
        }
      }
    } else if (DateTime.february == datetime.month) {
      if (tempyear % 4 == 0) {
        if (datetime.day < 10) {
          month = 5;
          date = datetime.day + 31 - 9;
        } else {
          month = 6;
          date = datetime.day - 8;
        }
      } else {
        if (datetime.day < 8) {
          month = 5;
          date = datetime.day + 31 - 8;
        } else {
          month = 6;
          date = datetime.day - 7;
        }
      }
    } else if (DateTime.march == datetime.month) {
      if (datetime.day < 10) {
        month = 6;
        date = datetime.day + 29 - 8;
      } else {
        month = 7;
        date = datetime.day - 9;
      }
    } else if (DateTime.april == datetime.month) {
      if (datetime.day < 9) {
        month = 7;
        date = datetime.day + 30 - 8;
      } else {
        month = 8;
        date = datetime.day - 8;
      }
    } else if (DateTime.may == datetime.month) {
      if (datetime.day < 9) {
        month = 8;
        date = datetime.day + 30 - 8;
      } else {
        month = 9;
        date = datetime.day - 8;
      }
    } else if (DateTime.june == datetime.month) {
      if (datetime.day < 8) {
        month = 9;
        date = datetime.day + 31 - 8;
      } else {
        month = 10;
        date = datetime.day - 7;
      }
    } else if (DateTime.july == datetime.month) {
      if (datetime.day < 8) {
        month = 10;
        date = datetime.day + 30 - 7;
      } else {
        month = 11;
        date = datetime.day - 7;
      }
    } else if (DateTime.august == datetime.month) {
      if (datetime.day < 7) {
        month = 11;
        date = datetime.day + 31 - 7;
      } else {
        month = 12;
        date = datetime.day - 6;
      }
    } else if (DateTime.september == datetime.month) {
      if (tempyear % 4 == 0) {
        if (datetime.day < 6) {
          month = 12;
          date = datetime.day + 31 - 6;
        } else {
          if (datetime.day < 12) {
            month = 13;
            date = datetime.day - 5;
          } else {
            month = 1;
            date = datetime.day - 10;
          }
        }
      } else {
        if (datetime.day < 6) {
          month = 12;
          date = datetime.day + 31 - 6;
        } else {
          if (datetime.day < 11) {
            month = 13;
            date = datetime.day - 5;
          } else {
            month = 1;
            date = datetime.day - 10;
          }
        }
      }
    } else if (DateTime.october == datetime.month) {
      if (tempyear % 4 == 0) {
        if (datetime.day < 12) {
          month = 1;
          date = datetime.day + 30 - 11;
        } else {
          month = 2;
          date = datetime.day - 11;
        }
      } else {
        if (datetime.day < 11) {
          month = 1;
          date = datetime.day + 30 - 10;
        } else {
          month = 2;
          date = datetime.day - 10;
        }
      }
    } else if (DateTime.november == datetime.month) {
      if (tempyear % 4 == 0) {
        if (datetime.day < 11) {
          month = 2;
          date = datetime.day + 31 - 11;
        } else {
          month = 3;
          date = datetime.day - 10;
        }
      } else {
        if (datetime.day < 10) {
          month = 2;
          date = datetime.day + 30 - 10;
        } else {
          month = 3;
          date = datetime.day - 9;
        }
      }
    } else if (DateTime.december == datetime.month) {
      if (tempyear % 4 == 0) {
        if (datetime.day < 11) {
          month = 3;
          date = datetime.day + 30 - 10;
        } else {
          month = 4;
          date = datetime.day - 10;
        }
      } else {
        if (datetime.day < 10) {
          month = 3;
          date = datetime.day + 30 - 9;
        } else {
          month = 4;
          date = datetime.day - 9;
        }
      }
    }
    EthiopianDate ethiopianDate =
        EthiopianDate(date, month, year, '$date $month $year', weekDays);
    return ethiopianDate;
  }

  static EthiopianDate addMonths() {
    EthiopianDate ethiopianDate =
        EthiopianDate(date, month, year, '$date $month $year', weekDays);
    return ethiopianDate;
  }

  static EthiopianDate addDays() {
    EthiopianDate ethiopianDate =
        EthiopianDate(date, month, year, '$date $month $year', weekDays);
    return ethiopianDate;
  }

  static EthiopianDate addYears() {
    EthiopianDate ethiopianDate =
        EthiopianDate(date, month, year, '$date $month $year', weekDays);
    return ethiopianDate;
  }

  static SplitCharacters getCarcters(String text) {
    final characters = [' ', '  ', '-', '/', '_', ','];
    for (int i = 0; i < characters.length; i++) {
      var spliced = text.split(characters[i]);
      if (spliced.length > 1) {
        return SplitCharacters(characters[i], spliced, true);
      }
    }
    return SplitCharacters('', [text], true);
  }

  static String toStringFormat(String? format) {
    String stringDate = '$date $month $year';

    var splited = getCarcters(format ?? '');

    if (format != null || splited.isSuccess) {
      String tempDate = '';
      for (int i = 0; i < splited.splitted.length; i++) {
        var currentString;
        switch (format) {
          case "YYYY":
            {
              tempDate = '$year';
            }
            break;
          case "M":
            {
              tempDate = '$month';
            }
            break;
          case "MMM":
            {
              tempDate = ConvertMonthShort(month);
            }
            break;
          case "MM":
            {
              tempDate = ConvertMonth(month);
            }
            break;
          case "D":
            {
              tempDate = '$date';
            }
            break;
          case "E":
            {
              tempDate = ConvertDateShort(weekDays);
            }
            break;
          case "EEEE":
            {
              tempDate = ConvertDate(weekDays);
            }
            break;
        }
        if (i < splited.splitted.length - 1) {
          tempDate += splited.characters + currentString;
        }
      }
      stringDate = tempDate;
    }
    return stringDate;
  }

  static String ConvertDate(int weekdays) {
    switch (month) {
      case 1:
        return 'ሰኞ';
      case 2:
        return 'ማክሰኞ';
      case 3:
        return 'ሮብ';
      case 4:
        return 'ኀሙስ';
      case 5:
        return 'አርብ';
      case 6:
        return 'ቅዳሜ';
      case 7:
        return 'እሑድ';
      default:
        return 'ሰኞ';
    }
  }

  static String ConvertDateShort(int weekdays) {
    switch (month) {
      case 1:
        return 'ሰ';
      case 2:
        return 'ማ';
      case 3:
        return 'ሮ';
      case 4:
        return 'ኀሙ';
      case 5:
        return 'አር';
      case 6:
        return 'ቅ';
      case 7:
        return 'እ';
      default:
        return 'ሰ';
    }
  }

  static String ConvertMonthShort(int month) {
    switch (month) {
      case 1:
        return 'መስ';
      case 2:
        return 'ጥ';
      case 3:
        return 'ሕ';
      case 4:
        return 'ታሕ';
      case 5:
        return 'ጥር';
      case 6:
        return 'የካ';
      case 7:
        return 'መጋ';
      case 8:
        return 'ሚያ';
      case 9:
        return 'ግን';
      case 10:
        return 'ሰኔ';
      case 11:
        return 'ሐም';
      case 12:
        return 'ነ';
      case 13:
        return 'ጳጉ';
      default:
        return 'መስ';
    }
  }

  static String ConvertMonth(int month) {
    switch (month) {
      case 1:
        return 'መስከረም';
      case 2:
        return 'ጥቅምት';
      case 3:
        return 'ሕዳር';
      case 4:
        return 'ታሕሣስ';
      case 5:
        return 'ጥር';
      case 6:
        return 'የካቲት';
      case 7:
        return 'መጋቢት';
      case 8:
        return 'ሚያዚያ';
      case 9:
        return 'ግንቦት';
      case 10:
        return 'ሰኔ';
      case 11:
        return 'ሐምሌ';
      case 12:
        return 'ነሐሴ	';
      case 13:
        return 'ጳጉሜ';
      default:
        return 'መስከረም';
    }
  }
}
