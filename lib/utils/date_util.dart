import 'package:intl/intl.dart';

class AppDateUtils {
  static List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  static List<DateTime> getListMonday({required int year, required int month}) {
    var date = (DateTime(year, month, 0)).subtract(const Duration(days: 7));
    List<DateTime> listMonday = [];
    while (date.month == month || listMonday.length < 5) {
      if (date.weekday == 7) {
        listMonday.add(date);
      }
      date = date.add(const Duration(days: 1));
    }

    return listMonday;
  }

  static List<DateTime> getListDateFromMonday(DateTime date) {
    List<DateTime> newList = [];
    while (newList.length < 7) {
      newList.add(date);
      date = date.add(const Duration(days: 1));
    }
    return newList;
  }

  static bool isSameDate(DateTime date1, DateTime date2) {
    return date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year;
  }

  static bool isSameYearAndMonth(DateTime date1, DateTime date2) {
    return date1.month == date2.month && date1.year == date2.year;
  }

  static DateTime convertStringToDateTime(String str) => DateTime.parse(str);

  static String getStringTime(DateTime date) {
    return DateFormat.jm().format(date);
  }

  static String getDateTitle(DateTime date) {
    var weekDay = DateFormat('EEEE').format(date);
    final day = DateFormat('d').format(date);
    final month = months[date.month - 1];
    if (AppDateUtils.isSameDate(date, DateTime.now())) {
      weekDay = "Today";
    }
    return "$weekDay, $day $month";
  }
}
