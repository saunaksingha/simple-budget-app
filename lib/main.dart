import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_budget_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: const Size(363.42, 800),
      minTextAdapt: true,
      autoRebuild: false,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(textTheme: GoogleFonts.publicSansTextTheme()),
        home: HomeScreen(),
      ),
    );
  }
}
