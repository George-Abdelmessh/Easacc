import 'package:go_router/go_router.dart';

import 'app_routes.dart';



final List<GoRoute> appRoutes = [
GoRoute(
    path: AppRoutes.login,
    name: 'login',
    // pageBuilder: (context, state) =>
    //     const MaterialPage(child: SocialLoginPage()),
  ),
  GoRoute(
    path: AppRoutes.settings,
    name: 'settings',
    // pageBuilder: (context, state) => const MaterialPage(child: SettingsPage()),
  ),
  GoRoute(
    path: AppRoutes.webview,
    name: 'webview',
    // pageBuilder: (context, state) => const MaterialPage(child: Placeholder()),
  ),
];
