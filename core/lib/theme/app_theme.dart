import 'package:core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData primaryTheme = ThemeData(
  colorSchemeSeed: primaryColor,
  brightness: Brightness.light,
  useMaterial3: true,
  // scaffoldBackgroundColor: lightBackgroundColorWhite,
  // unselectedWidgetColor: lightBackgroundColorWhite,
  // appBarTheme: AppBarTheme(
  //   titleTextStyle: const TextStyle(color: Colors.white),
  //   backgroundColor: lightBackgroundColorWhite,
  // ),
  cardTheme: const CardTheme(color: Colors.white),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: lightBackgroundColorWhite,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.white,
  ),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    minWidth: double.infinity,
    height: 60,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  ),
  // colorScheme: ColorScheme(
  //   tertiaryContainer: containerBackgroundColor,
  //   brightness: Brightness.light,
  //   primary: lightPrimarycolor,
  //   onPrimary: Colors.white,
  //   secondary: lightSecondaryColor,
  //   onSecondary: Colors.white,
  //   error: Colors.red,
  //   onError: Colors.red,
  // ),
  //primarySwatch: Colors.deepPurple,
  textTheme: TextTheme(
    //For title and subtitle used in card and container
    bodyLarge: GoogleFonts.karla(
      fontSize: 19,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.karla(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodySmall: GoogleFonts.karla(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    labelLarge: GoogleFonts.karla(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    //For Button
    labelMedium: GoogleFonts.karla(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    //For Bottom Nav Text
    labelSmall: GoogleFonts.karla(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.karla(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    displaySmall: GoogleFonts.karla(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    displayLarge: GoogleFonts.karla(
      fontSize: 22,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  ),
);
final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: backgroundColor,
  // unselectedWidgetColor: Colors.white,
  colorSchemeSeed: primaryColor,
  brightness: Brightness.dark,
  useMaterial3: true,
  // appBarTheme: AppBarTheme(
  //   titleTextStyle: const TextStyle(color: Colors.white),
  //   backgroundColor: darkBackGroundColor,
  // ),
  cardTheme: const CardTheme(
    //color: cardColor,
    color: Colors.white,
  ),
  // Cursor style for dark theme
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: colorScheme.primary, // highlight color
    selectionHandleColor: colorScheme.primary, // <- the "bubble" arrow color
    cursorColor: colorScheme.primary,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.black),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    minWidth: double.infinity,
    height: 60,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Colors.black26,
    elevation: 2,
  ),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(foregroundColor: colorScheme.primaryFixedDim),
  // colorScheme: ColorScheme(
  //   tertiaryContainer: Colors.white,
  //   brightness: Brightness.dark,
  //   primary: Colors.black,
  //   onPrimary: Colors.white,
  //   secondary: Colors.black,
  //   onSecondary: Colors.white,
  //   error: Colors.red,
  //   onError: Colors.red,
  //   surface: Colors.black26,
  //   onSurface: Colors.black,
  //   shadow: Colors.black.withOpacity(0.9),
  // ),

  textTheme: TextTheme(
    bodyLarge: GoogleFonts.karla(
      fontSize: 19,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.karla(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodySmall: GoogleFonts.karla(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    labelLarge: GoogleFonts.karla(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    labelMedium: GoogleFonts.karla(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    labelSmall: GoogleFonts.karla(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.karla(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    displaySmall: GoogleFonts.karla(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    displayLarge: GoogleFonts.karla(
      fontSize: 30,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  ),
);
