import 'dart:core';

class EthiopianDate {
  static var datetime = DateTime.now();
  static int year = 2000;
  static int month = 1;
  static int date = 0;
  static String calculateDate() {
    if (DateTime.january <= datetime.month &&
        datetime.month >= DateTime.september) {
      if (datetime.month != DateTime.september) {
        year = datetime.year - 8;
      } else if (datetime.month == DateTime.september &&
          datetime.year % 4 != 0 &&
          datetime.day < 11) {
        year = datetime.year - 8;
      } else if (datetime.month == DateTime.september &&
          datetime.year % 4 == 0 &&
          datetime.day < 12) {
        year = datetime.year - 8;
      } else {
        year = datetime.year - 7;
      }
    } else {
      year = datetime.year - 7;
    }

    if (DateTime.september == datetime.month) {
      if (year % 4 == 0) {
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
      if (year % 4 == 0) {
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
      if (year % 4 == 0) {
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
      if (year % 4 == 0) {
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
    } else if (DateTime.january == datetime.month) {
      if (year % 4 == 0) {
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
      if (year % 4 == 0) {
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
    }
    return '$date $month $year';
  }
}
