/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 24,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 24,June,2025
*/


import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      required this.text,
      this.overflow = true,
      this.textStyle,
      this.maxLines});

  final String text;
  final TextStyle? textStyle;
  final int? maxLines;
  final bool overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      maxLines: maxLines,
      overflow: overflow ? TextOverflow.ellipsis : null,
    );
  }
}
