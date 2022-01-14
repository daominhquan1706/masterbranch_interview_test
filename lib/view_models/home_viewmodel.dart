import 'package:flutter/material.dart';
import 'package:masterbranch_interview_test/model/calendar_model.dart';
import 'package:masterbranch_interview_test/utils/asset_util.dart';
import 'package:masterbranch_interview_test/utils/date_util.dart';

class HomeViewModel with ChangeNotifier {
  late DateTime currentCalendarTime;
  late DateTime currentSelectedTime;

  List<CalendarItem> listItem = [];

  HomeViewModel() {
    currentCalendarTime = DateTime.now();
    currentSelectedTime = DateTime.now();
  }

  Future<void> fetchData() async {
    final map = await AssetUtils.parseJsonFromAssets("assets/db.json");
    listItem = (map['calendars'] as List)
        .map((e) => CalendarItem.fromJson(e))
        .toList();
  }

  List<CalendarItem> get listCalendarByCurrentDate {
    if (listItem.isEmpty) return [];

    return getListCalendarByDate(currentSelectedTime);
  }

  List<CalendarItem> getListCalendarByDate(DateTime dateTime) {
    if (listItem.isEmpty) return [];

    return listItem
        .where((element) =>
            AppDateUtils.isSameDate(element.startDateTime, dateTime))
        .toList();
  }

  bool isDateHaveEvent(DateTime dateTime) {
    return getListCalendarByDate(dateTime).isNotEmpty;
  }

  void onNextMonth() {
    var date = currentCalendarTime.add(const Duration(days: 32));
    currentCalendarTime = DateTime(date.year, date.month, 0);
    notifyListeners();
  }

  void onPreviousMonth() {
    var date = currentCalendarTime.subtract(const Duration(days: 1));
    currentCalendarTime = DateTime(date.year, date.month, 0);
    notifyListeners();
  }

  void onSelectTime(DateTime dateTime) {
    currentSelectedTime = dateTime;
    notifyListeners();
  }

  String get getCurrentDateString {
    return AppDateUtils.getDateTitle(currentSelectedTime);
  }
}
