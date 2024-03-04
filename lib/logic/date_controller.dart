import 'package:my_flutter_application/instances/dateUsed.dart';

class DateController{

  static DateUsed generateNextDateAndFormatIt(int weekday, int month, int day){
    final DateTime nextDay = DateTime.now().add(const Duration(days: 1));

    return DateUsed(
      day: nextDay.day, 
      month: nextDay.month, 
      monthName: getMonthByPosition(nextDay.month), 
      dayOfWeek: nextDay.weekday, 
      dayOfWeekName: getWeekdayByPosition(nextDay.weekday), 
      year: nextDay.year,
    );
  }

  static DateUsed generatePreviousDateAndFormatIt(int weekday, int month, int day){
    final DateTime dayBefore = DateTime.now().subtract(const Duration(days: 1));

    return DateUsed(
      day: dayBefore.day, 
      month: dayBefore.month, 
      monthName: getMonthByPosition(dayBefore.month), 
      dayOfWeek: dayBefore.weekday, 
      dayOfWeekName: getWeekdayByPosition(dayBefore.weekday), 
      year: dayBefore.year,
    );
  }

  static String getMonthByPosition(int position){
    switch(position){
      case 1:
        return 'січня';
      case 2:
        return 'лютого';
      case 3:
        return 'березня';
      case 4:
        return 'квітеня';
      case 5:
        return 'травня';
      case 6:
        return 'червня';
      case 7:
        return 'липня';
      case 8:
        return 'серпня';
      case 9:
        return 'вересеня';
      case 10:
        return 'жовтня';
      case 11:
        return 'листопада';
      case 12:
        return 'грудня';
      default:
        return 'unknown';
    }
  }

  static String getWeekdayByPosition(int position){
    switch(position){
      case 1:
        return 'Понеділок';
      case 2:
        return 'Вівторок';
      case 3:
        return 'Середа';
      case 4:
        return 'Четвер';
      case 5:
        return "П'ятниця";
      case 6:
        return 'Субота';
      case 7:
        return 'Неділя';
      default:
        return 'unknown';
    }
  }
}
