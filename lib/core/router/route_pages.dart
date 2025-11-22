import 'package:easacc/features/auth/presentation/controller/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';



final List<GoRoute> appRoutes = [
GoRoute(
    path: AppRoutes.login,
    name: 'login',
    builder: (context, state) => const LoginScreen(),
    
  ),
  // GoRoute(
  //   path: AppRoutes.settings,
  //   name: 'settings',
  //   builder: (context, state) => const SettingsScreen(),
  // ),
  // GoRoute(
  //   path: AppRoutes.webview,
  //   name: 'webview',
  //   builder: (context, state) => const WebViewScreen(),
  // ),
];
