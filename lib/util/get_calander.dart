import 'package:flutter_ethiopian_date_converter/mvc/model/ethiopian_date.dart';

class GetCalender{
  generateCalender(EthiopianDate date){
    int day=getDay(month,year);
    if(month == 13){
      if(year+1 %4==0 ) {
        day = 5;
      } else {
        day = 6;
      }
    }
    var GetTheFirstDayOftheMonth= ()
  }
  int getDay(month,year)
  {
    int day=30;
    if(month == 13){
      if(year+1 %4==0 ) {
        day = 5;
      } else {
        day = 6;
      }
    }
    return day;
  }
}