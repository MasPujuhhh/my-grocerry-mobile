import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static Color lightBackgroundColor = const Color(0xfff2f2f2);
  static Color lightPrimaryColor = const Color(0xffff8900); // Orange color
  static Color lightSecondaryColor = const Color(0xff040425);
  static Color lightAccentColor = Colors.blueGrey[200]!; // Dynamic color
  static Color lightParticlesColor = const Color(0x44948282);
  static Color lightTextColor = Colors.black54; // Used for text color

  const AppTheme._();

  static final ThemeData lightTheme = ThemeData( // Note: Fixed typo to 'lightTheme'
    brightness: Brightness.light,
    primaryColor: lightPrimaryColor,
    dialogBackgroundColor: lightBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(backgroundColor: lightPrimaryColor),
    colorScheme: ColorScheme.light(secondary: lightSecondaryColor),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: lightTextColor,
      ),
    ),
  );

  static Brightness get currentSystemBrightness =>
      // ignore: deprecated_member_use
      SchedulerBinding.instance.window.platformBrightness;

  static void setStatusBarAndNavigationBarColor(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: lightBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}
