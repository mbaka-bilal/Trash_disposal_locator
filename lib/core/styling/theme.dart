/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 24,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 24,June,2025
*/

import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.black),
    primaryColor: AppColors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: const Color.fromARGB(255, 7, 5, 5),
    ),
    scaffoldBackgroundColor: AppColors.black,
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.darkGrey,
      elevation: 30,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        backgroundColor: WidgetStateProperty.resolveWith((
          Set<WidgetState> state,
        ) {
          if (state.contains(WidgetState.disabled)) {
            return AppColors.grey;
          }

          return AppColors.complimentary;
        }),
        fixedSize: WidgetStateProperty.all(Size(double.infinity, 45)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        backgroundColor: WidgetStateProperty.all(AppColors.complimentary),
        side: WidgetStateProperty.all(
          BorderSide(color: AppColors.complimentary),
        ),
        fixedSize: WidgetStateProperty.all(Size(double.infinity, 45)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      outlineBorder: BorderSide(color: AppColors.black45),
      hintStyle: TextStyle(
        fontSize: 12,
        color: Colors.grey,
        fontWeight: FontWeight.w300,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.black45),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.black45),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.black45),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(color: AppColors.white),
      displayMedium: TextStyle(color: AppColors.white),
      displaySmall: TextStyle(color: AppColors.white),
      headlineLarge: TextStyle(color: AppColors.white),
      headlineMedium: TextStyle(color: AppColors.white),
      headlineSmall: TextStyle(color: AppColors.white),
      titleLarge: TextStyle(color: AppColors.white),
      titleMedium: TextStyle(color: AppColors.white),
      titleSmall: TextStyle(color: AppColors.white),
      bodyLarge: TextStyle(color: AppColors.white),
      bodyMedium: TextStyle(color: AppColors.white),
      bodySmall: TextStyle(color: AppColors.white),
      labelLarge: TextStyle(color: AppColors.white),
      labelMedium: TextStyle(color: AppColors.white),
      labelSmall: TextStyle(color: AppColors.white),
    ),
  );
}
