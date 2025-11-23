import 'package:easacc/core/router/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'route_pages.dart';

final GoRouter router = GoRouter(
  // TODO: Change to login screen
  initialLocation: AppRoutes.home,
  routes: appRoutes,
);
