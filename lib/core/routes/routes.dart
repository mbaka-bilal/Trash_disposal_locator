/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 24,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 24,June,2025
*/

import 'package:go_router/go_router.dart';

import '../../features/error_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../constants/constants.dart';

final publicRoutes = <GoRoute>[
  GoRoute(
    path: SplashScreen.path,
    name: SplashScreen.routeName,
    builder: (context, routeState) {
      return const SplashScreen();
    },
  ),
];
final privateRoutes = <GoRoute>[];

final routes = GoRouter(
  debugLogDiagnostics: true,
  restorationScopeId: AppConstants.restorationScopeId,
  navigatorKey: AppConstants.rootNavigatorKey,
  initialLocation: SplashScreen.path,
  redirect: (context, routeState) {
    return ErrorScreen.path;
  },
  routes: <GoRoute>[...publicRoutes, ...privateRoutes],
);
