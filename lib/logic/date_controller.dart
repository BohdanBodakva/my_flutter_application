class DateController{
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
