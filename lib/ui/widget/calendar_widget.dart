import 'package:flutter/material.dart';
import 'package:masterbranch_interview_test/constants/app_constants.dart';
import 'package:masterbranch_interview_test/constants/colors_constant.dart';
import 'package:masterbranch_interview_test/constants/dimension_constant.dart';
import 'package:masterbranch_interview_test/utils/date_util.dart';
import 'package:masterbranch_interview_test/view_models/home_viewmodel.dart';
import 'package:provider/provider.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
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
    var isSelectedDate =
        AppDateUtils.isSameDate(value.currentSelectedTime, date);
    var isDayInMonth =
        AppDateUtils.isSameYearAndMonth(value.currentCalendarTime, date);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (isDayInMonth) {
            value.onSelectTime(date);
          }
        },
        child: CircleAvatar(
          backgroundColor: isSelectedDate
              ? AppColors.selectedDate
              : (value.isDateHaveEvent(date)
                  ? AppColors.lightOrange
                  : Colors.transparent),
          child: Text(
            date.day.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: isDayInMonth
                    ? (isSelectedDate
                        ? AppColors.calendarMainTextColorHightLight
                        : AppColors.calendarMainTextColor)
                    : AppColors.calendarSecondaryTextColor,
                fontSize: AppDimension.textSizeSmall),
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
            style: TextStyle(
              color: AppColors.textBodyColor,
              fontSize: AppDimension.textSizeSmall,
            ),
          ),
        ),
      ),
    );
  }
}
