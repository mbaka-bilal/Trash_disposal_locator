import 'package:go_router/go_router.dart';
import 'package:myapp/core/constants/constants.dart';

final routes = GoRouter(
    debugLogDiagnostics: true,
    restorationScopeId: 'router',
    navigatorKey: AppConstants.rootNavigatorKey,
    initialLocation: "/",
    redirect: (context, routeState) {
      //TODO navigate to login screen if token is missing or expired and user tries to access  a private route
    },
    routes: <GoRoute>[]);