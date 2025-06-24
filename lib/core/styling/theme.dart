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
        backgroundColor: AppColors.black
      ),
      scaffoldBackgroundColor: AppColors.black,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              backgroundColor:
                  WidgetStateProperty.resolveWith((Set<WidgetState> state) {
                if (state.contains(WidgetState.disabled)) {
                  return AppColors.primaryColor.withOpacity(.5);
                }

                return AppColors.black;
              }),
              fixedSize: WidgetStateProperty.all(Size(double.infinity, 45)))),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              backgroundColor: WidgetStateProperty.all(AppColors.transparent),
              side: WidgetStateProperty.all(
                  BorderSide(color: AppColors.black45)),
              fixedSize: WidgetStateProperty.all(Size(double.infinity, 45)))),
      inputDecorationTheme: InputDecorationTheme(
        outlineBorder: BorderSide(
          color: AppColors.black45,
        ),
        hintStyle: TextStyle(
          fontSize: 12,
          color: Colors.grey,
          fontWeight: FontWeight.w300,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppColors.black45,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppColors.black45,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppColors.black45,
          ),
        ),
      ));
}
