import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  late DateTime currentCalendarTime;
  late DateTime currentSelectedTime;
  HomeViewModel() {
    currentCalendarTime = DateTime.now();
    currentSelectedTime = DateTime.now();
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
}
