import 'package:flutter/material.dart';

const Color tdRed = Color(0xFFDA4040);
const Color tdBlue = Color.fromARGB(255, 255, 255, 255);

const Color tdBlack = Color.fromARGB(255, 255, 255, 255);
const Color tdGrey = Color(0xFF717171);

const Color tdBGColor = Color.fromARGB(255, 0, 0, 0);

final timePickerThemeDataclass = TimePickerThemeData(
  backgroundColor: Colors.black,
  hourMinuteShape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    side: BorderSide(color: Colors.white, width: 2),
  ),
  dayPeriodBorderSide: const BorderSide(color: Colors.white, width: 4),
  dayPeriodColor: Colors.black,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    side: BorderSide(color: Colors.white, width: 2),
  ),
  dayPeriodTextColor: Colors.white,
  dayPeriodShape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    side: BorderSide(color: Colors.white, width: 0),
  ),
  hourMinuteColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected) ? Colors.white12 : Colors.black),
  hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected) ? Colors.white : Colors.white),
  dialHandColor: Colors.white54,
  dialBackgroundColor: Colors.white12,
  hourMinuteTextStyle:
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  dayPeriodTextStyle:
      const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  helpTextStyle: const TextStyle(
      fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    contentPadding: EdgeInsets.all(0),
  ),
  dialTextColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected) ? Colors.black : Colors.white),
  entryModeIconColor: Colors.white,
);
