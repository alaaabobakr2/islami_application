import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFB7935F),
      primary: Colors.black,
      secondary: Colors.white,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: const Color(0xFFB7935F).withOpacity(0.8),
    ),
    primaryColor: const Color(0xFFB7935F),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: GoogleFonts.elMessiri(
        fontWeight: FontWeight.w700,
        fontSize: 30,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFFB7935F),
      selectedIconTheme: IconThemeData(color: Colors.black, size: 37),
      unselectedIconTheme: IconThemeData(color: Colors.white, size: 27),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.elMessiri(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        fontSize: 28,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodySmall: GoogleFonts.elMessiri(
        fontSize: 25,
        fontWeight: FontWeight.w300,
        color: Colors.black,
      ),
    ),
    dividerColor: const Color(0xFFB7935F),
  );

  static ThemeData darkTheme = ThemeData(
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: const Color(0xFF0A0D17).withOpacity(0.8),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF141A2E),
      primary: const Color(0xFF0A0D17),
      secondary: const Color(0xFFFACC1D),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: GoogleFonts.elMessiri(
        fontWeight: FontWeight.w700,
        fontSize: 30,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF0A0D17),
      selectedIconTheme: IconThemeData(color: Color(0xFFFACC1D), size: 37),
      unselectedIconTheme: IconThemeData(color: Colors.white, size: 27),
      selectedItemColor: Color(0xFFFACC1D),
      unselectedItemColor: Colors.white,
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.elMessiri(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: const Color(0xFFFACC1D),
      ),
      bodyLarge: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        fontSize: 28,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodySmall: GoogleFonts.elMessiri(
        fontSize: 25,
        fontWeight: FontWeight.w300,
        color: const Color(0xFFFACC1D),
      ),
    ),
    dividerColor: const Color(0xFFFACC1D),
  );
}
