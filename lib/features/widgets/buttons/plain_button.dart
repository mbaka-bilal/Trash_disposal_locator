/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 24,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 24,June,2025
*/


import 'package:flutter/material.dart';

import '../../../core/styling/colors.dart';
import '../../../core/styling/text_style.dart';
import '../app_text_field.dart';

class PlainButton extends StatelessWidget {
  const PlainButton({
    super.key,
    this.isLoading = false,
    this.onTap,
    this.child,
    this.text,
    this.backgroundColor,
    this.disabledColor,
    this.width,
    this.height,
    this.borderRadius,
  });

  final bool isLoading;
  final VoidCallback? onTap;
  final Widget? child;
  final String? text;
  final Color? backgroundColor;
  final Color? disabledColor;
  final double? width;
  final double? height;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    assert(
        child != null || text != null, "Either child or text must be non-null");

    return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          shape: borderRadius != null
              ? WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))
              : null,
          backgroundColor:
              WidgetStateProperty.resolveWith((Set<WidgetState> state) {
            if (state.contains(WidgetState.disabled)) {
              return disabledColor;
            }

            return backgroundColor;
          }),
          fixedSize: width != null && height != null
              ? WidgetStateProperty.all(Size(width!, height!))
              : null,
        ),
        child: Center(
          child: child ??
              AppTextField(
                text: text!,
                textStyle: AppTextStyle(
                        context: context, fontSize: 16, color: AppColors.white)
                    .fw900(),
              ),
        ));
  }
}
