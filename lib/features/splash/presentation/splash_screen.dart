/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 24,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 24,June,2025
*/

import 'package:flutter/material.dart';

import '../../../core/constants/strings.dart';
import '../../../core/helpers/helpers.dart';
import '../../../core/styling/colors.dart';
import '../../../core/styling/images.dart';
import '../../../core/styling/text_style.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/media/image_view.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/';
  static const path = routeName;

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppHelpers.wrapChildWithLayoutBuilder(
        padding: AppHelpers.defaultPadding(bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 100),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ImageView(image: AppImages.logo),
            ),

            AppTextField(
              text: AppStrings.appName,
              textStyle: AppTextStyle(
                context: context,
                color: AppColors.white,
              ).fw900(),
            ),
          ],
        ),
      ),
    );
  }
}
