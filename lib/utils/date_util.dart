class AppDateUtils {
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
}
