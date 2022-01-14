import 'package:flutter/material.dart';
import 'package:masterbranch_interview_test/constants/text_style_constant.dart';

class EmptyEventWidget extends StatelessWidget {
  const EmptyEventWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Nothing!",
            style: AppTextStyle.textViewBodyBig,
          ),
          Text(
            "Your event list is empty",
            style: AppTextStyle.textViewBody,
          ),
        ],
      ),
    );
  }
}
