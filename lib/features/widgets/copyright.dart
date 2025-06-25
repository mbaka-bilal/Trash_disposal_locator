/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 25,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 25,June,2025
Description: Copyright text
*/

import 'package:flutter/material.dart';

import '../../core/constants/strings.dart';
import '../../core/helpers/helpers.dart';

class Copyright extends StatelessWidget {
  const Copyright({super.key});

  @override
  Widget build(BuildContext context) {
    if (AppHelpers.isWeb(context)) {
      return Text(
        '${DateTime.now().year} ${AppStrings.appName}. ${AppStrings.copyAsYouPlease}.',
        style: TextStyle(color: Colors.grey, fontSize: 12),
      );
    } else {
      return Offstage();
    }
  }
}
