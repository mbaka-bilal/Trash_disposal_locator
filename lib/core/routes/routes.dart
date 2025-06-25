/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 24,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 24,June,2025
*/

import 'package:go_router/go_router.dart';

import '../../features/error_screen.dart';
import '../../features/location/presentation/screens/map_screen.dart';
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
  GoRoute(
    path: MapScreen.path,
    name: MapScreen.routeName,
    builder: (context, routeState) {
      return const MapScreen();
    },
  ),
  GoRoute(
    path: ErrorScreen.path,
    name: ErrorScreen.routeName,
    builder: (context, routeState) {
      return const ErrorScreen();
    },
  ),
];
final privateRoutes = <GoRoute>[];

final routes = GoRouter(
  debugLogDiagnostics: true,
  restorationScopeId: AppConstants.restorationScopeId,
  navigatorKey: AppConstants.rootNavigatorKey,
  initialLocation: SplashScreen.path,
  onException: (context, routeState, router) {
    router.go(ErrorScreen.path);
  },
  redirect: (context, routeState) {
    // // Get the current route path
    // final path = routeState.uri.path;

    // // If we're already on the splash screen, don't redirect
    // if (path == SplashScreen.path) {
    //   return null;
    // }

    // // Add authentication check here if needed
    // // For now, just allow navigation to public routes
    // if (publicRoutes.any((route) => route.path == path)) {
    //   return null;
    // }

    // // If no matching route found, return to splash screen
    // return SplashScreen.path;
  },
  routes: <GoRoute>[...publicRoutes, ...privateRoutes],
);
