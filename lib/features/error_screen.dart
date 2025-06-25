/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 24,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 24,June,2025
Description: This screen routing error 
*/

import 'package:flutter/material.dart';

import '../core/styling/colors.dart';
import '../core/styling/text_style.dart';
import 'widgets/app_text_field.dart';

class ErrorScreen extends StatelessWidget {
  static const routeName = '/error';
  static const path = routeName;

  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppTextField(
          text: 'Error',
          textStyle: AppTextStyle(
            context: context,
            color: AppColors.white,
          ).fw900(),
        ),
      ),
    );
  }
}
