import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Colors.dart';

class MyThemeData {
  static String backgroundligth = "assets/images/background.png";
  static String backgrounddark = "assets/images/darkback.png";

  static ThemeData light = ThemeData(
      scaffoldBackgroundColor: mint,
//comment at TextTheme
     /* textTheme: TextTheme(
        bodySmall: GoogleFonts.elMessiri(
          color: BlackColor,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: GoogleFonts.elMessiri(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: GoogleFonts.elMessiri(
          color: BlackColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),*/
      brightness: Brightness.light,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor:PrimaryColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false

      ));
  static ThemeData dark = ThemeData();
}
