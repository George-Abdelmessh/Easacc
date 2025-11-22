import 'package:easacc/core/router/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'route_pages.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.login,
  routes: appRoutes,
);
