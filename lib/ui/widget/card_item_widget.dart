import 'package:flutter/material.dart';
import 'package:masterbranch_interview_test/constants/colors_constant.dart';
import 'package:masterbranch_interview_test/constants/text_style_constant.dart';
import 'package:masterbranch_interview_test/model/calendar_model.dart';
import 'package:masterbranch_interview_test/utils/url_util.dart';

class CardItemWidget extends StatelessWidget {
  final CalendarItem calendarItem;
  final bool isWeb;

  const CardItemWidget(
      {Key? key, required this.calendarItem, this.isWeb = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isWeb) {
      return _buildWebUI();
    }
    return _buildMobileUI();
  }

  Container _buildMobileUI() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkOrange,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
        ),
        margin: const EdgeInsets.only(left: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text(
              calendarItem.name,
              style: AppTextStyle.textViewTitle,
            ),
            trailing: CircleAvatar(
              backgroundColor: AppColors.darkBlue,
              child: const Icon(Icons.camera_alt_outlined),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(calendarItem.dateForDisplay),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 30,
                      height: 30,
                      child: CircleAvatar(
                        child: FlutterLogo(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          print(calendarItem.url);
                          UrlUtil.launchURL(calendarItem.url);
                        },
                        child: const Text(
                          "View client Profile",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWebUI() {
    return GestureDetector(
      onTap: () {
        UrlUtil.launchURL(calendarItem.url);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.darkOrange,
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            calendarItem.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
