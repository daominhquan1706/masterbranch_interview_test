import 'package:flutter/material.dart';
import 'package:masterbranch_interview_test/utils/constants.dart';
import 'package:masterbranch_interview_test/utils/date_util.dart';
import 'package:masterbranch_interview_test/view_models/home_viewmodel.dart';
import 'package:provider/provider.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Consumer<HomeViewModel>(builder: (context, value, child) {
        return Column(
          children: [
            _buildWeekDateRow(),
            ...AppDateUtils.getListMonday(
                    month: value.currentCalendarTime.month,
                    year: value.currentCalendarTime.year)
                .map((e) => _buildRow(AppDateUtils.getListDateFromMonday(e)))
                .toList()
          ],
        );
      });
    });
  }

  Widget _buildRow(List<DateTime> weekDays) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: weekDays.map((e) => _buildDay(e)).toList(),
    );
  }

  Widget _buildDay(DateTime date) {
    var value = Provider.of<HomeViewModel>(context, listen: false);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          value.onSelectTime(date);
        },
        child: CircleAvatar(
          backgroundColor: value.currentSelectedTime.day == date.day &&
                  value.currentSelectedTime.month == date.month &&
                  value.currentCalendarTime.year == date.year
              ? Colors.green
              : Colors.transparent,
          child: Text(
            date.day.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: value.currentCalendarTime.month == date.month
                    ? Colors.black
                    : Colors.black38),
          ),
        ),
      ),
    );
  }

  Widget _buildWeekDateRow() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          Constant.listWeeksDay.map((e) => _buildWeekDateText(e)).toList(),
    );
  }

  Widget _buildWeekDateText(String weekDay) {
    return Expanded(
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            weekDay,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
