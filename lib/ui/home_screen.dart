import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masterbranch_interview_test/constants/colors_constant.dart';
import 'package:masterbranch_interview_test/constants/text_style_constant.dart';
import 'package:masterbranch_interview_test/ui/widget/card_item_widget.dart';
import 'package:masterbranch_interview_test/view_models/home_viewmodel.dart';
import 'package:provider/provider.dart';

import 'widget/calendar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
        create: (_) => HomeViewModel(),
        builder: (context, value) {
          return Scaffold(
            backgroundColor: AppColors.calendarTileColor,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _topView(context),
                    const CalendarWidget(),
                    Container(
                      width: double.infinity,
                      height: 4,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    Expanded(
                        child: ListView(
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
                            "Today, 4 Apr",
                            style: AppTextStyle.textViewSubTitle,
                          ),
                        ),
                        _buildCardItem(),
                        _buildCardItem(),
                        _buildCardItem()
                      ],
                    ))
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildCardItem() {
    return const Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: CardItemWidget(),
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
