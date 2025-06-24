/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 19,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 19,June,2025
*/


import 'package:flutter/material.dart';

import '../../../core/services/navigation_service.dart';

class AppAppBar<T> extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({super.key, this.returnValue});

  final T? returnValue;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
          onTap: () =>
              NavigationService.pop<T?>(context: context, data: returnValue),
          child: Icon(Icons.arrow_back_ios)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
