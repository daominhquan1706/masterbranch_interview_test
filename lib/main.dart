import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masterbranch_interview_test/ui/home_screen.dart';
import 'package:masterbranch_interview_test/ui/splash_screen.dart';
import 'package:masterbranch_interview_test/view_models/home_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context)
              .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
        ),
      ),
      home: ChangeNotifierProvider<HomeViewModel>(
          create: (_) => HomeViewModel(),
          builder: (context, child) {
            return FutureBuilder<void>(
                future: Provider.of<HomeViewModel>(context, listen: false)
                    .fetchData(),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      {
                        return const SplashScreen();
                      }
                    case ConnectionState.done:
                      return const HomeScreen();
                    default:
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                  }
                  return const SplashScreen();
                });
          }),
    );
  }
}
