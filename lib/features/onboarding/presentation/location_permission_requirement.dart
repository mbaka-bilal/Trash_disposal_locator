/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 26,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 26,June,2025
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/strings.dart';
import '../../../core/extensions/integer_extensions.dart';
import '../../../core/extensions/string_extensions.dart';
import '../../../core/helpers/helpers.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/styling/colors.dart';
import '../../../core/styling/images.dart';
import '../../../core/styling/text_style.dart';
import '../../../view_models.dart';
import '../../location/presentation/screens/map_screen.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/buttons/plain_button.dart';
import '../../widgets/media/image_view.dart';

class LocationPermissionRequirementScreen extends ConsumerStatefulWidget {
  static const routeName = "location-permission";
  static const path = "/$routeName";

  const LocationPermissionRequirementScreen({super.key});

  @override
  ConsumerState<LocationPermissionRequirementScreen> createState() =>
      _LocationPermissionRequirementScreenState();
}

class _LocationPermissionRequirementScreenState
    extends ConsumerState<LocationPermissionRequirementScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen(locationViewModel, (previous, next) {
      AppHelpers.handleState(
        status: next,
        title: AppStrings.permissionError,
        context: context,
        onSuccess: () {
          if (mounted) {
            NavigationService.jumpToScreen(
              context: context,
              routeName: MapScreen.routeName,
            );
          }
        },
      );
    });

    return Scaffold(
      body: AppHelpers.wrapChildWithLayoutBuilder(
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ImageView(
                    image: AppImages.locationPermission,
                    width: 300,
                    height: 500,
                    boxFit: BoxFit.contain,
                    color: AppColors.transparent,
                  ),

                  50.h,

                  AppTextField(
                    text:
                        "${AppStrings.appName.firstLetterToUppercase()} ${AppStrings.needsYouLocationToPerformAsExpected}.",
                    overflow: false,
                    alignment: TextAlign.center,
                    textStyle: AppTextStyle(context: context).fw900(),
                  ),

                  30.h,

                  Consumer(
                    builder: (context, ref, child) {
                      final state = ref.watch(locationViewModel);

                      return PlainButton(
                        text: AppStrings.allow,
                        isLoading: state.isLoading,
                        onTap: requestPermission,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> requestPermission() async {
    await ref.read(locationViewModel.notifier).requestPermission();
  }
}
