import 'package:flutter/material.dart';
import 'package:masterbranch_interview_test/constants/colors_constant.dart';
import 'package:masterbranch_interview_test/constants/text_style_constant.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              "Frist Session with Alen Stan",
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
                  child: const Text("9:00 AM - 09:30 AM GMT+8"),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: CircleAvatar(
                        child: FlutterLogo(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "View client Profile",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
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
}
