import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masterbranch_interview_test/view_models/home_viewmodel.dart';
import 'package:provider/provider.dart';

import 'calendar_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
        create: (_) => HomeViewModel(),
        builder: (context, value) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _topView(context),
                    const CalendarView(),
                    Divider(
                      thickness: 4,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    const Text("Upcoming Events"),
                    const Text("Today, 4 Apr"),
                    _buildCardItem(),
                    _buildCardItem(),
                    _buildCardItem()
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildCardItem() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          margin: const EdgeInsets.only(left: 10),
          child: ListTile(
            title: const Text("Frist Session with Alen Stan"),
            trailing: const CircleAvatar(
              child: Icon(Icons.camera_alt_outlined),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("9:00 AM - 09:30 AM GMT+8"),
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

  Widget _topView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            Provider.of<HomeViewModel>(context, listen: false)
                .onPreviousMonth();
          },
          icon: const Icon(Icons.arrow_left),
        ),
        Consumer<HomeViewModel>(builder: (context, value, child) {
          final f = DateFormat('MMMM yyyy');
          return SizedBox(
            width: 120,
            child: Text(
              f.format(value.currentCalendarTime),
              textAlign: TextAlign.center,
            ),
          );
        }),
        IconButton(
          onPressed: () {
            Provider.of<HomeViewModel>(context, listen: false).onNextMonth();
          },
          icon: const Icon(Icons.arrow_right),
        ),
      ],
    );
  }
}
