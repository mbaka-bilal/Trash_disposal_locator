/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 26,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 26,June,2025
*/

import 'package:flutter/material.dart';
import 'package:myapp/core/extensions/string_extensions.dart';

import 'info_dialog.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    required this.title,
    required this.errorMessage,
  });

  final String title;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return InfoDialog(
      title: title,
      message: errorMessage,
      image: "error".lottie,
    );
  }
}
