/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 24,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 30,June,2025
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/constants.dart';
import '../../../core/constants/strings.dart';
import '../../../core/helpers/helpers.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/styling/colors.dart';
import '../../../core/styling/images.dart';
import '../../../core/styling/text_style.dart';
import '../../../view_models.dart';
import '../../location/presentation/screens/map_screen.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/copyright.dart';
import '../../widgets/media/image_view.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static const routeName = '/splash';
  static const path = "/";

  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(trashDisposalLocationsViewModel.notifier).fetchLocations();

      Future.delayed(const Duration(seconds: 3), () async {
        if (mounted) {
          NavigationService.jumpToScreen(
            context: context,
            routeName: MapScreen.routeName,
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppHelpers.wrapChildWithLayoutBuilder(
        padding: AppHelpers.defaultPadding(bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
                
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: ImageView(
                  image: AppImages.logo,
                  width: 100,
                  height: 100,
                ),
              ),
            ),

            Column(
              children: [
                AppTextField(
                  text: AppStrings.appName,
                  textStyle: AppTextStyle(
                    context: context,
                    color: AppColors.white,
                    fontSize: 30,
                  ).fw900(),
                ),
                AppConstants.smallYSpace,
                Copyright(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
