/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 01,July,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 01,July,2025
Description: Widget displaying information about the disposal location
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/services/location_service.dart';
import '../../../../core/styling/colors.dart';
import '../../../../core/styling/images.dart';
import '../../../../core/styling/text_style.dart';
import '../../../../view_models.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/media/image_view.dart';
import '../../data/models/trash_disposal_locations_model.dart';

class DisposalInfo extends StatelessWidget {
  const DisposalInfo({super.key, required this.disposalLocation});

  final DisposalLocation disposalLocation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          text: disposalLocation.address!,
          textStyle: AppTextStyle(context: context, fontSize: 15).fw900(),
        ),

        AppConstants.smallYSpace,
        Consumer(
          builder: (context, ref, child) {
            final myLocation = ref.watch(locationViewModel).data;

            return AppTextField(
              text: myLocation == null
                  ? ""
                  : "~ ${LocationService.distanceInKm(sourceLatitude: myLocation.latitude, sourceLongitude: myLocation.longitude, destinationLatitude: disposalLocation.location!.lat!, destinationLongitude: disposalLocation.location!.lng!).toStringAsFixed(2)}km away",
              textStyle: AppTextStyle(context: context, fontSize: 12).fw500(),
            );
          },
        ),
        AppConstants.smallYSpace,
        Row(
          children: [
            AppTextField(
              text:
                  "${disposalLocation.location!.lat!.toStringAsFixed(5)},${disposalLocation.location!.lng!.toStringAsFixed(5)}",
            ),
            AppConstants.smallXSpace,
            GestureDetector(
              onTap: () {
                Clipboard.setData(
                  ClipboardData(
                    text:
                        "${disposalLocation.location!.lat},${disposalLocation.location!.lng}",
                  ),
                );
              },
              child: Icon(Icons.copy, size: 16, color: AppColors.white),
            ),
          ],
        ),

        AppConstants.mediumYSpace,
        ImageView(
          image: disposalLocation.pictures!.isNotEmpty
              ? disposalLocation.pictures!.first
              : AppImages.rubbish,
          width: double.infinity,
          height: 200,
        ),
      ],
    );
  }
}
