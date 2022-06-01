import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internsforyou/utils/extentions.dart';
import 'colors.dart';

//TODO: Restructure whole theme this is just an example

final borderLight = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(color: veryLightGrey, width: 2, style: BorderStyle.solid),
);

final borderDark = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
    color: grey,
    width: 2,
    style: BorderStyle.solid,
  ),
);
final darkTheme = ThemeData.dark().copyWith(
  primaryColor: purple,
  primaryColorLight: darkPrimaryVar,

  appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(color: lightGrey, size: 22.0.sp),
      color: dark,
      titleTextStyle: GoogleFonts.raleway().copyWith(
        color: green,
        fontSize: 20.0.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.3,
      )),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: darkSecondaryVar),
  scaffoldBackgroundColor: dark,
  bottomAppBarColor: Colors.transparent,
  textTheme: GoogleFonts.ralewayTextTheme().apply(bodyColor: green, displayColor: green),
  elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(primary: darkPrimaryVar)),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: green)),
  cardTheme: const CardTheme(color: grey),
  //Input Decoration Theme
  inputDecorationTheme: InputDecorationTheme(
    fillColor: grey,
    filled: true,
    border: borderDark,
    enabledBorder: borderDark,
    focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0)), borderSide: BorderSide(color: darkSecondary)),
    labelStyle: const TextStyle(color: green),
    hintStyle: GoogleFonts.raleway(color: lightGrey, fontSize: Get.height > 1000 ? 9.0.sp : 14.0.sp),
  ),
  dialogTheme: DialogTheme(
    titleTextStyle: TextStyle(color: black, fontSize: Get.height > 1000 ? 12.0.sp : 15.0.sp),
    contentTextStyle: TextStyle(color: grey, fontSize: Get.height > 1000 ? 9.0.sp : 12.0.sp),
  ),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  bottomAppBarTheme: const BottomAppBarTheme(color: darkPrimaryVar),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
  iconTheme: IconThemeData(color: white, size: Get.height > 1000 ? 12.0.sp : 21.0.sp),
  colorScheme: ThemeData().colorScheme.copyWith(
        onPrimary: green,
        primary: green,
        secondary: lightPink,
        onSecondary: white,
        primaryContainer: darkPrimaryVar,
        secondaryContainer: darkSecondaryVar,
        onSurface: green,
      ),
);
