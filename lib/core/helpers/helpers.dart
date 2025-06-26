/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 26,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 26,June,2025
*/

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../features/widgets/dialogs/error_dialog.dart';
import '../basestate.dart';
import 'dialog_helpers.dart';

class AppHelpers {
  static EdgeInsets defaultPadding({
    double left = 20,
    double top = 20,
    double right = 20,
    double bottom = 50,
  }) {
    return EdgeInsets.only(left: left, top: top, right: right, bottom: bottom);
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 500;
  }

  static bool isWeb(BuildContext context) => kIsWeb;

  static Widget wrapChildWithLayoutBuilder({
    required Widget child,
    EdgeInsets? padding,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: padding ?? AppHelpers.defaultPadding(),
              child: child,
            ),
          ),
        );
      },
    );
  }

  static printToLog({required String message, bool isError = false}) {
    final logger = Logger();

    if (isError) {
      logger.e(message);
    } else {
      logger.d(message);
    }
  }

  static handleState({
    required BaseState status,
    required String title,
    required BuildContext context,
    required Function() onSuccess,
    String? errorMessage,
  }) {
    if (status.isError) {
      DialogHelpers.showAppDialog(
        context: context,
        child: ErrorDialog(
          title: title,
          errorMessage: errorMessage ?? status.errorMessage!,
        ),
      );
    }

    if (status.isSuccess) {
      onSuccess();
    }
  }
}
