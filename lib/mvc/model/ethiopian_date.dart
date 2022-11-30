import 'split_characters.dart';

class EthiopianDate {
  final int month;
  final int day;
  final int year;
  final int weekDays;
  final String date;

  EthiopianDate(this.day,
      this.month,
      this.year,
      this.date,
      this.weekDays,);

  static const int meskerem = 1;
  static const int tikimt = 2;
  static const int hidar = 3;
  static const int tahsas = 4;
  static const int tir = 5;
  static const int yakatit = 6;
  static const int maggabit = 7;
  static const int miyazya = 8;
  static const int ginbot = 9;
  static const int sene = 10;
  static const int hamle = 11;
  static const int nehasa = 12;
  static const int pagume = 13;


  SplitCharacters getCarcters(String text) {
    final characters = [' ', '  ', '-', '/', '_', ',',', ',':',' ,'];
    List<String> charchterslist =[];
    for (int i = 0; i < characters.length; i++) {
      var spliced = text.split(characters[i]);
      if (spliced.length > 1) {

        return SplitCharacters(characters[i], spliced, true);
      }
    }
    return SplitCharacters('', [text], true);
  }

  String toStringFormat(String? format) {
    String stringDate = '';

    var splited = getCarcters(format ?? '');

    if (format != null || splited.isSuccess) {
      String tempDate = '';
      for (int i = 0; i < splited.splitted.length; i++) {
        String convertedString='';
        switch (splited.splitted[i]) {
          case "yyyy":
            {
              convertedString = '$year';
            }
            break;
          case "yy":
            {
              convertedString = '$year'.substring(0,2);
            }
            break;
          case "M":
            {
              convertedString = '$month';
            }
            break;
          case "MM":
            {
              convertedString = ConvertMonthShort(month);
            }
            break;
          case "MMM":
            {
              convertedString = ConvertMonth(month);
            }
            break;
          case "d":
            {
              convertedString = '$day';
            }
            break;
          case "dd":
            {
              convertedString = '$day';
            }
            break;
          case "E":
            {
              convertedString = ConvertDateShort(weekDays);
            }
            break;
          case "EEEE":
            {
              convertedString = ConvertDate(weekDays);
            }
            break;
          default:
            {
              convertedString = '';
            }
            break;
        }
        if (i < splited.splitted.length - 1) {
          tempDate += (convertedString +splited.characters) ;
        }
        else{
          tempDate += convertedString ;
        }
      }
      stringDate = tempDate;
    }
    return stringDate;
  }

  String ConvertDate(int weekdays) {
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

  String ConvertDateShort(int weekdays) {
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

  String ConvertMonthShort(int month) {
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

  String ConvertMonth(int month) {
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

