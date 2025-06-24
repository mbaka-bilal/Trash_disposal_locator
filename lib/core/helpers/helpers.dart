import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
}
