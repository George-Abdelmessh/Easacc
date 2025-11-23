import 'package:easacc/core/router/app_routes.dart';
import 'package:easacc/core/services/cache/shared_preferences_service.dart';
import 'package:easacc/core/services/cache/shared_prefs_keys.dart';
import 'package:go_router/go_router.dart';
import 'route_pages.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.login,
  redirect: (context, state) {
    if (_isLoggedIn()) {
      return AppRoutes.home;
    }
    return null;
  },
  routes: appRoutes,
);

bool _isLoggedIn() {
  return SharedPreferencesService.getData(key: SharedPrefsKeys.isLoggedIn)
          as bool? ??
      false;
}
