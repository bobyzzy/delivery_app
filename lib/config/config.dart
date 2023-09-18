import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Config {
  static TextTheme lightTextTheme = const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'SF',
      fontSize: 28,
      height: 1.5,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontFamily: 'SF',
      fontWeight: FontWeight.w700,
      fontSize: 25,
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      fontFamily: "SF",
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: GoogleFonts.roboto(
        fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
    displayLarge: GoogleFonts.roboto(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.roboto(
      fontWeight: FontWeight.w700,
      fontSize: 21,
      color: Colors.white,
    ),
    displaySmall: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleLarge: GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromARGB(253, 51, 100, 224),
          ),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
        ),
      ),
      textTheme: lightTextTheme,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromARGB(253, 51, 100, 224),
        unselectedItemColor: Colors.grey,
        elevation: 1,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(brightness: Brightness.dark);
  }
}
