import 'package:easacc/core/config/router/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'route_pages.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.login,
  routes: appRoutes,
);
