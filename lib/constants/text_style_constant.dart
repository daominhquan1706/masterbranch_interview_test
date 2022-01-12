import 'package:flutter/material.dart';
import 'package:masterbranch_interview_test/constants/colors_constant.dart';
import 'package:masterbranch_interview_test/constants/dimension_constant.dart';

class AppTextStyle {
  static TextStyle textViewH1 = TextStyle(
    color: AppColors.darkBlue,
    fontWeight: FontWeight.w700,
    fontSize: AppDimension.textSizeLarge,
  );

  static TextStyle textViewBody = TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.normal,
    fontSize: AppDimension.textSizeMedium,
  );
  static TextStyle textViewTitle = TextStyle(
    color: AppColors.darkBlue,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
  static TextStyle textViewSubTitle = const TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.w100,
    fontSize: 12,
  );
}
