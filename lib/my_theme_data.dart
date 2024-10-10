import 'package:flutter/material.dart';
import 'colors.dart';

class MyThemeData{
  //light mode and dark mode
  //no build here therefore hot restart
  static final ThemeData lightMode = ThemeData(//constant throughout app
    primaryColor: AppColors.primaryLightColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColors.blackColor
      )

    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.blackColor,
        fontSize: 30,
        fontWeight: FontWeight.bold
      ),
      bodyMedium: TextStyle(
        color: AppColors.blackColor,
        fontSize: 25,
        fontWeight: FontWeight.w700
      ),
      bodySmall: TextStyle(
          color: AppColors.blackColor,
          fontSize: 22,
          fontWeight: FontWeight.bold
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.blackColor,
      showSelectedLabels: true, //default
        selectedIconTheme: IconThemeData(),
      backgroundColor: AppColors.primaryLightColor //msh betsama3
    ),

  );
}
