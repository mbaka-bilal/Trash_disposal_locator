/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 24,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 24,June,2025
Description: Abstraction to handle navigation in the app
*/

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routes/routes.dart';

class NavigationService<T extends Object?> {
  static Future<T?> pushToScreen<T>({
    required BuildContext context,
    required String routeName,
    Map<String, String> queryParams = const {},
    T? data,
  }) async {
    return await context.pushNamed<T>(
      routeName,
      extra: data,
      queryParameters: queryParams,
    );
  }

  static jumpToScreen({
    required BuildContext context,
    required String routeName,
    Map<String, String> queryParams = const {},
    dynamic data,
  }) {
    context.goNamed(routeName, extra: data, queryParameters: queryParams);
  }

  static replaceTopScreen({
    required BuildContext context,
    required String routeName,
    Map<String, String> queryParams = const {},
    dynamic data,
  }) {
    context.pushReplacementNamed(routeName,
        extra: data, queryParameters: queryParams);
  }

  static popScreenUntil<T>({
    required String routeName,
    T? data,
  }) {
    final topScreen =
        routes.routerDelegate.currentConfiguration.matches.last.matchedLocation;

    while (topScreen != routeName) {
      if (!routes.canPop()) {
        return;
      }

      routes.pop<T>(data);
    }
  }

  static pop<T>({
    required BuildContext context,
    T? data,
  }) {
    context.pop<T?>(data);
  }
}
