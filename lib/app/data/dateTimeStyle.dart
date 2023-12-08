import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:employee_system2/app/data/colors.dart';

class TimePickerStyles {
  static final TimePickerThemeData timePickerTheme = TimePickerThemeData(
    backgroundColor: whiteColor,
    helpTextStyle: TextStyle(
        fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.black),
    hourMinuteColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected) ? greyFieldColor : greyColor),
    hourMinuteTextStyle:
        TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700),
    hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected) ? mainColor : blackColor),
    dialHandColor: mainColor, // Warna jarum jam
    dialBackgroundColor: whiteColor,
    dialTextStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
    dialTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected) ? whiteColor : blackColor),
    entryModeIconColor: purpleColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.selected) ? mainColor : greyColor),
      border: InputBorder.none,
      contentPadding: EdgeInsets.all(0),
    ),
  );
}

class DatePickerThemes {
  static ThemeData DatePickerStyles() {
    return ThemeData(
      primaryColor: mainColor,
    );
  }
}
