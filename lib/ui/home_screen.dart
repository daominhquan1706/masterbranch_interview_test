import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masterbranch_interview_test/constants/app_constants.dart';
import 'package:masterbranch_interview_test/constants/colors_constant.dart';
import 'package:masterbranch_interview_test/constants/text_style_constant.dart';
import 'package:masterbranch_interview_test/ui/widget/card_item_widget.dart';
import 'package:masterbranch_interview_test/ui/widget/empty_event_widget.dart';
import 'package:masterbranch_interview_test/view_models/home_viewmodel.dart';
import 'package:provider/provider.dart';

import 'widget/calendar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.calendarTileColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth <= Constant.mobileScreenSize) {
              return _buildMobileUI(context);
            }
            return _buildWebUI(context);
          }),
        ),
      ),
    );
  }

  Widget _buildWebUI(BuildContext context) {
    return Column(
      children: [
        _topView(context),
        const Expanded(child: CalendarWidget(isWeb: true)),
      ],
    );
  }

  Widget _buildMobileUI(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _topView(context),
        const CalendarWidget(),
        Container(
          width: double.infinity,
          height: 4,
          color: Colors.grey.withOpacity(0.2),
        ),
        Consumer<HomeViewModel>(
          builder: (context, value, child) {
            if (value.listCalendarByCurrentDate.isEmpty) {
              return const Expanded(child: EmptyEventWidget());
            } else {
              return _buildListEvents(context, value);
            }
          },
        )
      ],
    );
  }

  Widget _buildListEvents(BuildContext context, HomeViewModel value) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Upcoming Events",
                style: AppTextStyle.textViewH1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                Provider.of<HomeViewModel>(context).getCurrentDateString,
                style: AppTextStyle.textViewSubTitle,
              ),
            ),
            Column(
              children: value.listCalendarByCurrentDate
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CardItemWidget(
                        calendarItem: e,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Provider.of<HomeViewModel>(context, listen: false)
                .onPreviousMonth();
          },
          icon: const Icon(CupertinoIcons.back),
        ),
        Expanded(
          child: Consumer<HomeViewModel>(builder: (context, value, child) {
            final f = DateFormat('MMMM yyyy');
            return Text(
              f.format(value.currentCalendarTime),
              style: AppTextStyle.textViewH1,
              textAlign: TextAlign.center,
            );
          }),
        ),
        IconButton(
          onPressed: () {
            Provider.of<HomeViewModel>(context, listen: false).onNextMonth();
          },
          icon: const Icon(CupertinoIcons.forward),
        ),
      ],
    );
  }
}
