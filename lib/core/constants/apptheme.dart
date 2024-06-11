import 'package:ecommerce_app/core/constants/color.dart';
import 'package:flutter/material.dart';

ThemeData EnglishTheme = ThemeData(
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.grey[50],
    titleTextStyle: const TextStyle(
      color: AppColor.primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 22,
      fontFamily: "Cairo",
    ),
    iconTheme: const IconThemeData(
      color: AppColor.primaryColor,
    ),
  ),
  //--------------------------------------------------------------
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor,
  ),
  //---------------------------------------------------------------
  fontFamily: "PlayfairDisplay",
  primarySwatch: Colors.blue,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColor.black,
    ),
    headlineMedium: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: AppColor.black,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      height: 2,
      color: AppColor.grey,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      height: 2,
      color: AppColor.grey,
    ),
  ),
);
//--------------------------------------------------------------------------------

ThemeData ArabicTheme = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.grey[50],
      titleTextStyle: const TextStyle(
        fontSize: 20,
        color: AppColor.primaryColor,
        fontWeight: FontWeight.bold,
        fontFamily: "Cairo",
      ),
      iconTheme: const IconThemeData(
        color: AppColor.primaryColor,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryColor),
    fontFamily: "Cairo",
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        height: 2,
        color: AppColor.grey,
      ),
    ));
