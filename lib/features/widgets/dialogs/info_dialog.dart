/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 26,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 26,June,2025
*/

import 'package:flutter/material.dart';
import 'package:myapp/features/widgets/media/image_view.dart';

import '../../../core/constants/constants.dart';
import '../../../core/styling/text_style.dart';
import '../app_text_field.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({
    super.key,
    required this.title,
    required this.message,
    this.image,
  });

  final String title;
  final String message;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (image != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ImageView(image: image!, width: 100, height: 100),
          ),

        AppTextField(
          text: title,
          alignment: TextAlign.center,
          textStyle: AppTextStyle(context: context, fontSize: 20).fw600(),
        ),
        AppConstants.mediumYSpace,
        AppTextField(
          text: message,
          alignment: TextAlign.center,
          textStyle: AppTextStyle(context: context, fontSize: 15).fw400(),
        ),
      ],
    );
  }
}
